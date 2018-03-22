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


		while (query.Read())
		{
			TableRow tr = new TableRow();
			for (int i = 0; i < query.FieldCount; i++)
				tr.Controls.Add(new TableCell() { Text = query.GetValue(i).ToString() });
			stats_table.Controls.Add(tr);
		}

	}
}
