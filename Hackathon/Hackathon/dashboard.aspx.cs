using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard : HackPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		var UserId = Sql.Query($"SELECT Id FROM [User] WHERE [Name] ='{Request.QueryString["UserName"]}';");
		UserId.Read();
		if (!HasAccess((int)UserId.GetValue(0)))
			Response.Redirect($"/login.aspx?error=NO_ACCESS");


	}
	bool HasAccess(int DesiredUserID)
	{
		if (Context.Session["CurrentUser"] == null || Context.Session["SessionKey"] == null)
			return false;
		int CurrentUserID = int.Parse(Context.Session["CurrentUser"].ToString());
		string SessionKey = Context.Session["SessionKey"].ToString();
		if (DesiredUserID != CurrentUserID)
			return false;
		//check if the user is logged in

		//then check if the user is legit
		var query = Sql.ScalarQuery("SELECT UserId FROM SessionKey WHERE UserId = " + CurrentUserID + " AND SessionKey = '" + SessionKey + "';");

		return query != null;
	}


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        UserAccount.Logout();
    }
}