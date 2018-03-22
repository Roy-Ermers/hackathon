using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class settings : HackPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		var UserId = Sql.Query($"SELECT Id FROM [User] WHERE [Name] ='{Request.QueryString["UserName"]}';");
		UserId.Read();
		if (!HasAccess((int)UserId.GetValue(0)))
			Response.Redirect($"/login.aspx?error=NO_ACCESS");

		var UserInfo = Sql.Query("SELECT Name, Info FROM [User] WHERE Id = " + Session["CurrentUser"]);
		UserInfo.Read();

		Password.Attributes.Add("placeholder", Translator.Translate("password"));
		Password2.Attributes.Add("placeholder", Translator.Translate("repeatpassword"));
		Save.Text = Translator.Translate("save");
		if (Session["saved"] == null)
		{
			TbBedrijfsnaam.Text = UserInfo.GetValue(0).ToString();
			TbBedrijfsinfo.Text = UserInfo.GetValue(1).ToString();
		}
		else Session["saved"] = null;
	}

	bool HasAccess(int DesiredUserID)
	{
		if (Context.Session["CurrentUser"] == null || Context.Session["SessionKey"] == null)
			return false;
		int CurrentUserID = int.Parse(Context.Session["CurrentUser"].ToString());
		string SessionKey = Context.Session["SessionKey"].ToString();
		if (DesiredUserID != CurrentUserID)
			return false;
		var query = Sql.ScalarQuery("SELECT UserId FROM SessionKey WHERE UserId = " + CurrentUserID + " AND SessionKey = '" + SessionKey + "';");
		return query != null;
	}

	protected void Save_Click(object sender, EventArgs e)
	{
		Session["saved"] = "YES";
		if (FileUpload.HasFile)
		{
			string base64 = Convert.ToBase64String(FileUpload.FileBytes);

			Sql.ScalarQuery("UPDATE [User] SET Icon = '" + base64 + "' WHERE Id = " + Request.QueryString["UserId"] + ";");
		}
		Sql.ScalarQuery("UPDATE [User] SET Info = '" + TbBedrijfsinfo.Text + "', Name = '" + TbBedrijfsnaam.Text + "' WHERE Id = " + Session["CurrentUser"]);
	}
}