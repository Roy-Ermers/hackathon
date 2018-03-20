using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["CurrentUser"] == null)
		{
			LinkButton link = new LinkButton() { Text = "Login" };
			link.Click += this.Login;
			LoginContainer.Controls.Add(link);
		}

	}
	protected void Login(object sender, EventArgs e)
	{
		Session["CurrentUser"] = 1;
	}
}
