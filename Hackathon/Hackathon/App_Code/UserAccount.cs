using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserAccount
/// </summary>
public static class UserAccount
{
	public static void Logout()
	{
		Sql.Procedure("Logout", new System.Data.SqlClient.SqlParameter("UserID", HttpContext.Current.Session["UserID"]), new System.Data.SqlClient.SqlParameter("SessionKey", HttpContext.Current.Session["SessionKey"]));
	}
}