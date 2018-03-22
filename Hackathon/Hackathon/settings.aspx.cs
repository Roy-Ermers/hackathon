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


        Password.Attributes.Add("placeholder", Translator.Translate("password"));
        Password2.Attributes.Add("placeholder", Translator.Translate("repeatpassword"));
		Save.Text = Translator.Translate("save");

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

	protected void TbBedrijfsnaam_TextChanged(object sender, EventArgs e)
    {

    }

    protected void TbBedrijfsinfo_TextChanged(object sender, EventArgs e)
    {

    }


	protected void Save_Click(object sender, EventArgs e)
	{
		if (FileUpload.HasFile)
		{
			string base64 = Convert.ToBase64String(FileUpload.FileBytes);

			Sql.ScalarQuery("UPDATE [User] SET Icon = '" + base64 + "' WHERE Id = " + Request.QueryString["UserId"] + ";");

		}

	}
}