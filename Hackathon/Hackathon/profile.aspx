<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%=Page.ResolveUrl("Style/dashboard.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <% var name = Sql.ScalarQuery("Select Name FROM [User] WHERE Id = " + Request.QueryString["UserID"]); %>
    <% var info = Sql.ScalarQuery("Select Info FROM [User] WHERE Id = " + Request.QueryString["UserID"]);
        if (string.IsNullOrEmpty(info.ToString()))
        {
            info = Translator.Translate("NO_DATA");
        }
        %>
    <% var type = Sql.ScalarQuery("Select Type FROM [User] WHERE Id = " + Request.QueryString["UserID"]); %>

        <div class="dashboard_header">
                <% if (type.ToString() == "1") { %>
                    <iframe
                        id="maps_background"
                      width="100%"
                      height="450"
                      frameborder="0"
                      style="border:0"
                      src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDJTDqMFi8a-LEz7liqy8AfeK6U-hiET_s&q=<%= name %>&amp;">
                    </iframe>
                    <% } else { %>
                        <div id="dashboard_header_image">
                            <img id="" src="<%= UserAccount.ProfilePicture() %>" />
                        </div>
                    <% } %>

        <div class="dashboard_info">
            <h1><%=name %></h1>
            <p><%=info %></p>
        </div>
        <% if (type.ToString() == "1"){ %>
        <div class="dashboard_stats">
            <h1><%=Translator.Translate("stats") + " " + Translator.Translate("district") %></h1>
            <asp:Table runat="server" ID="stats_table">

            </asp:Table>
        </div>
            <%} %>
    </div>
</asp:Content>

