using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Stats : HackPage
{
	public string[] StandardFilters = new string[] { "AvgWage", "Inhabs", "Households" };

	protected void Page_Load(object sender, EventArgs e)
	{

		var query = Sql.Query("SELECT StatName, StatValue FROM Stat WHERE DistrictId = " + Request.QueryString["UserID"] + ";");

		TableRow tr = new TableRow();
		if (query.HasRows)
		{
			while (query.Read())
			{
				TableCell tc = new TableCell();
				tc.Controls.Add(new HtmlGenericControl("h1") { InnerHtml = Translator.Translate(query.GetValue(0).ToString()) });
				tc.Controls.Add(new HtmlGenericControl("p") { InnerHtml = query.GetValue(1).ToString() });
				tr.Controls.Add(tc);
				}
		}
		else
		{
			tr.Controls.Add(new TableCell() { Text = Translator.Translate("NO_DATA") });
			stats_table.Controls.Add(tr);
		}
		stats_table.Controls.Add(tr);

	}
}
