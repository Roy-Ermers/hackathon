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
        if (UserId.HasRows)
        {
            Context.RewritePath("Dashboard.aspx?UserId=" + UserId.GetValue(0) + "&" + path[0]);
        }
    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
