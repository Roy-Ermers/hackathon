using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class settings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Password.Attributes.Add("placeholder", Translator.Translate("password"));
        Password.Attributes.Add("placeholder", Translator.Translate("repeatpassword"));
    }

    protected void TbBedrijfsnaam_TextChanged(object sender, EventArgs e)
    {

    }

    protected void TbBedrijfsinfo_TextChanged(object sender, EventArgs e)
    {

    }
}