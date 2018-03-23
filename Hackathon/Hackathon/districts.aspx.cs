using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Districts : HackPage
{
	public string[] StandardFilters = new string[] { "AvgWage", "Inhabs", "Households" };

	List<Filter> filters = new List<Filter>();
	protected void Page_Load(object sender, EventArgs e)
	{
		foreach (string filter in StandardFilters)
		{
			var qry = Sql.Query("SELECT MIN(StatValue), MAX(StatValue) FROM Stat WHERE StatName = '" + filter + "'; ");
			qry.Read();
			long min = 0;
			long max = qry.GetInt64(1);

			filters.Add(new Filter(filter, min, max));

			TableRow tr = new TableRow();
			tr.Controls.Add(new TableCell() { Text = Translator.Translate(filter), ColumnSpan = 2 });
			Filters.Controls.Add(tr);

			//add minimal label
			TableRow tr1 = new TableRow();
			TableCell tc1 = new TableCell();
			tc1.Controls.Add(new HtmlGenericControl("p") { InnerHtml = Translator.Translate("min") });
			tr1.Controls.Add(tc1);
			Filters.Controls.Add(tr1);

			//minimal number
			TableRow minCell = new TableRow();
			TableCell tc = new TableCell();
			minCell.Controls.Add(tc);
			TextBox minBox = new TextBox();
			minBox.Text = filters.Find(x => x.Name == filter).Min.ToString();
			minBox.TextMode = TextBoxMode.Number;
			minBox.TextChanged += (object s, EventArgs a) => ChangeFilterMin(filter, long.Parse(minBox.Text));
			tc.Controls.Add(minBox);
			Filters.Controls.Add(minCell);

			//add maximal label
			TableRow tr2 = new TableRow();
			TableCell tc2 = new TableCell();
			tc2.Controls.Add(new HtmlGenericControl("p") { InnerHtml = Translator.Translate("max") });
			tr2.Controls.Add(tc2);
			Filters.Controls.Add(tr2);
			//maximal number
			TableRow maxCell = new TableRow();
			tc = new TableCell();
			maxCell.Controls.Add(tc);
			TextBox maxBox = new TextBox();
			maxBox.TextMode = TextBoxMode.Number;
			maxBox.Text = filters.Find(x => x.Name == filter).Max.ToString();
			maxBox.TextChanged += (object s, EventArgs a) => ChangeFilterMax(filter, long.Parse(maxBox.Text));
			tc.Controls.Add(maxBox);
			Filters.Controls.Add(maxCell);

		}
		Reprocess();
	}
	protected void Unnamed1_Click(object sender, EventArgs e)
	{
		Reprocess();
	}
	public void Reprocess()
	{
		List<int> districtIds = new List<int>();

		foreach (Filter f in filters)
		{
			districtIds.AddRange(f.Execute());
		}
		int[] Districts = districtIds.GroupBy(x => x)
					.Where(group => group.Count() == filters.Count)
					.Select(group => group.Key).ToArray();

		districts.InnerHtml = "";
		foreach (int i in Districts)
		{
			string FilterTable = "";
			foreach (Filter f in filters)
			{
				var value = Sql.ScalarQuery($"SELECT StatValue FROM Stat WHERE DistrictId = {i} AND StatName = '{f.Name}'");
				FilterTable += $"<tr><th colspan=3>{Translator.Translate(f.Name)}</th></tr>" +
						$"<tr>" +
	  $"<td>" +
	  $"<progress min='{f.Min}' max='{f.Max}' value='{value}'></progress><p>{value}</p>" +
	  $"</td>" +
	  $"</tr>";
			}
			var name = Sql.ScalarQuery("SELECT Name FROM [User] WHERE Id = " + i + ";");

			districts.InnerHtml += @"<a href='/" + name + "'><div class='district wow fadeInUp'>" +
									"<div class='district-top'>" +
										"<img id='avatar' src='" + UserAccount.ProfilePicture(i) + "'>" +
									"</div>" +
									"<div class='district-content'>" +
										"<h1 class='district-content-title'>" +
										name +
										"</h1>" +
										"<div class='district-stats'>" +
											"<table>" +
											FilterTable +
											"</table>" +
										"</div>" +
									"</div>" +
								"</div></a>";

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
		var qry = Sql.Query("SELECT DistrictId FROM Stat WHERE StatName = '" + name + "' AND StatValue >= " + min + " AND StatValue <= " + max + ";");
		List<int> result = new List<int>();
		while (qry.Read())
		{
			result.Add(qry.GetInt32(0));
		}

		return result.ToArray();
	}
}