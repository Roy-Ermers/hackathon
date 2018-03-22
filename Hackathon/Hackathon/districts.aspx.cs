using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Districts : HackPage
{
	public string[] StandardFilters = new string[] { "AvgWage", "Inhabs" };

	List<Filter> filters = new List<Filter>();
	protected void Page_Load(object sender, EventArgs e)
	{
		foreach (string filter in StandardFilters)
		{
			var qry = Sql.Query("SELECT MIN(StatValue), MAX(StatValue) FROM Stat WHERE StatName = '" + filter + "'; ");
			qry.Read();
			long min = qry.GetInt64(0);
			long max = qry.GetInt64(1);

			filters.Add(new Filter(filter, min, max));

			TableRow tr = new TableRow();
			tr.Controls.Add(new TableCell() { Text = Translator.Translate(filter), ColumnSpan = 3 });

			TableRow tr2 = new TableRow();
			//minimal number
			TableCell minCell = new TableCell();
			TextBox minBox = new TextBox();
			minBox.TextMode = TextBoxMode.Number;
			minBox.Text = min.ToString();
			minBox.TextChanged += (object s, EventArgs a) => ChangeFilterMin(filter, long.Parse(minBox.Text));
			minCell.Controls.Add(minBox);
			tr2.Controls.Add(minCell);
			//maximal number
			TableCell maxCell = new TableCell();
			TextBox maxBox = new TextBox();
			maxBox.TextMode = TextBoxMode.Number;
			maxBox.Text = max.ToString();
			minBox.TextChanged += (object s, EventArgs a) => ChangeFilterMax(filter, long.Parse(minBox.Text));
			maxCell.Controls.Add(maxBox);
			tr2.Controls.Add(maxCell);

			//add the generated rows
			Filters.Controls.Add(tr);
			Filters.Controls.Add(tr2);

			List<int> districtIds = new List<int>();

			foreach(Filter f in filters)
			{
				districtIds.AddRange(f.Execute());
			}

			int[] Districts = districtIds.Distinct().ToArray();

			foreach(int i in Districts)
			{
				districts.InnerHtml += @"<div class='district'>" +
							"<div class='district-top'>" +
								"<img id='avatar' src='" + UserAccount.ProfilePicture((int)i) + "'>" +
							"</div>" +
							"<div class='district-content'>" +
								"<h1 class='district-content-title'>" +
									Sql.ScalarQuery("SELECT Name FROM [User] WHERE Id = " + i + ";") +
								"</h1>" +
								"<div class='district-stats'>" +
									"<table>" +
										"<tr>" +
											"<td>" +
												"0" +
											"</td>" +
											"<td>" +
												"<progress min='0' value='43' max='100'>" +
													"43" +
												"</progress>" +
											"</td>" +
											"<td>" +
												"100" +
											"</td>" +
										"</tr>" +
									"</table>" +
								"</div>" +
							"</div>" +
						"</div>";

			}
		}
	}

	public void ChangeFilterMin(string name, long min)
	{
		filters.Find(x => x.Name == name).Min = min;
	}
	public void ChangeFilterMax(string name, long max)
	{
		filters.Find(x => x.Name == name).Max = max;
	}
}
class Filter
{
	long min;
	long max;
	string name;
	public long Min
	{
		get
		{
			return min;
		}
		set
		{
			min = value;
		}
	}

	public long Max
	{
		get
		{
			return max;
		}
		set
		{
			max = value;
		}
	}
	public string Name
	{
		get
		{
			return name;
		}
	}
	public Filter(string name, long min, long max)
	{
		this.name = name;
		this.min = min;
		this.max = max;
	}
	public int[] Execute()
	{
		var qry = Sql.Query("SELECT DistrictId FROM Stat WHERE StatName = '" + name + "' AND StatValue > " + min + " AND StatValue < " + max + ";");
		int[] result = new int[qry.FieldCount];
		int index = 0;
		while (qry.Read())
		{
			result[index] = qry.GetInt32(0);
			index++;
		}

		return result;
	}
}