using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
	public Language CurrentLanguage = Language.English;
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["CurrentUser"] == null)
		{
			LinkButton link = new LinkButton() { Text = "Login" };
			link.Click += this.Login;
			LoginContainer.Controls.Add(link);
		} else
        {
            var name = Sql.ScalarQuery("SELECT Name FROM [User] WHERE Id = " + Session["CurrentUser"]);
            LinkButton link = new LinkButton() { Text = "<img id='nav_photo' src=' " + UserAccount.ProfilePicture() + " '>" + name };
            link.Click += this.Dashboard;
            UserContainer.Controls.Add(link);
        }

	}
	protected void Login(object sender, EventArgs e)
	{
		Response.Redirect("login.aspx");
	}
    protected void Dashboard(object sender, EventArgs e)
    {
        var name = Sql.ScalarQuery("SELECT Name FROM [User] WHERE Id = " + Session["CurrentUser"]);
        Response.Redirect(name + "/dashboard");
    }
    public void Logout(object sender, EventArgs e)
	{
		Sql.Procedure("Logout",new System.Data.SqlClient.SqlParameter("UserID",Session["UserID"]), new System.Data.SqlClient.SqlParameter("SessionKey",Session["SessionKey"]));
	}
	protected void ChangeLanguageNL(object sender, EventArgs e)
	{
		Response.SetCookie(new HttpCookie("language", "dutch"));
        Response.Redirect(Request.Url.ToString());
	}

    protected void ChangeLanguageEN(object sender, EventArgs e)
    {
        Response.SetCookie(new HttpCookie("language", "english"));
        Response.Redirect(Request.Url.ToString());
    }
}
