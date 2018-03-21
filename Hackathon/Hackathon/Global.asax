<%@ Application Language="C#" %>

<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    protected void Application_BeginRequest(object sender, EventArgs e)
    {
        string[] path = Context.Request.FilePath.Substring(1).Split('/');

        var UserId = Sql.Query($"SELECT Id FROM [User] WHERE [Name] ='{path[0]}';");
        UserId.Read();
        if (UserId.HasRows)
        {
            if (path.Length > 1)
            {
                if (path[1] == "dashboard")
                {
                    if (!HasAccess(UserId.GetInt32(0)))
                        return;
                    Context.RewritePath(HttpRuntime.AppDomainAppVirtualPath + "/dashboard.aspx?UserId=" + UserId.GetValue(0) + "&UserName=" + path[0]);
                }
            }
            else
                Context.RewritePath(HttpRuntime.AppDomainAppVirtualPath + "/profile.aspx?UserId=" + UserId.GetValue(0) + "&UserName=" + path[0]);
        }
    }
    bool HasAccess(int DesiredUserID)
    {
        if (DesiredUserID != int.Parse(Session["CurrentUser"].ToString())) return false;
        //check if the user is logged in
        if (Session["CurrentUser"] == null || Session["SessionKey"] == null) return false;

        //then check if the user is legit
        var query = Sql.ScalarQuery("SELECT * FROM SessionKey WHERE Id = " + Session["CurrentUser"] + " AND SessionKey = " + Session["SessionKey"]);
        return query != null;

    }
    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
