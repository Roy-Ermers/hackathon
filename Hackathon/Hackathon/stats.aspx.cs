using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Stats : HackPage
{
	public string[] StandardFilters = new string[] { "AvgWage", "Inhabs", "Households" };

	protected void Page_Load(object sender, EventArgs e)
	{

		var query = Sql.Query("SELECT StatName, StatValue FROM Stat WHERE DistrictId = " + Request.QueryString["UserID"] + ";");

		if (query.HasRows)
		{
			while (query.Read())
			{
				TableRow tr = new TableRow();
					tr.Controls.Add(new TableCell() { Text = Translator.Translate(query.GetValue(0).ToString()) });
					tr.Controls.Add(new TableCell() { Text = query.GetValue(1).ToString() });
				stats_table.Controls.Add(tr);
			}
		}
		else
		{
			TableRow tr = new TableRow();
			tr.Controls.Add(new TableCell() { Text = Translator.Translate("NO_DATA") });
			stats_table.Controls.Add(tr);
		}

	}
}
