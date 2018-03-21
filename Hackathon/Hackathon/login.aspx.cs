using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class Login : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void Unnamed1_Click(object sender, EventArgs e)
	{
		SqlParameter response = new SqlParameter("responseMessage", System.Data.SqlDbType.NVarChar,250);
		SqlParameter sessionKey = new SqlParameter("sessionKey", System.Data.SqlDbType.NVarChar,36);

		response.Direction = sessionKey.Direction = System.Data.ParameterDirection.Output;
		
		Sql.Procedure("Login", new SqlParameter("LoginName", username.Text), new SqlParameter("Password", password.Text), response, sessionKey);
	
		if(response.Value.ToString()=="SUCCESS")
		{
			Session["CurrentUser"] = Sql.Query("SELECT Id FROM [User] WHERE [Name] = '" + username.Text + "'").GetInt32(0);
			Session["SessionKey"] = sessionKey;
		}
		else
		{
			warning.Text = Translator.Translate(response.Value.ToString());
		}
	}
}