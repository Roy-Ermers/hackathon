using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for HackPage
/// </summary>
public class HackPage : System.Web.UI.Page
{

	public HackPage()
	{
#pragma warning disable CS0618 // Type or member is obsolete
		RegisterStartupScript("PostBackFix",
  "<script>document.forms[0].action='';</script>");
#pragma warning restore CS0618 // Type or member is obsolete
	}
}