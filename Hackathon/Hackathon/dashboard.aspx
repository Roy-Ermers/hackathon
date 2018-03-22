<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%=Page.ResolveUrl("Style/dashboard.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <% var name = Sql.ScalarQuery("Select Name FROM [User] WHERE Id = " + Request.QueryString["UserID"]); %>
    <% var info = Sql.ScalarQuery("Select Info FROM [User] WHERE Id = " + Request.QueryString["UserID"]); %>
    <% var type = Sql.ScalarQuery("Select Type FROM [User] WHERE Id = " + Request.QueryString["UserID"]); %>
    <div class="sidenav">
        <div class="top">
            <div id="avatar">
                <img id="sidenavimg" src="<%=UserAccount.ProfilePicture() %>" />
            </div>
            <p class="user"><%=name %><br /><span>Admin</span></p>
        </div>
        <ul>
            <li class="active">
                <a><%= Translator.Translate("dashboard") %></a>
            </li>
            <li>
                <a href="dashboard/settings"><%= Translator.Translate("settings") %></a>   
            </li>
            <li>
                <a href="stats.aspx">Stats</a>
            </li>
            <li>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" href="../">Logout</asp:LinkButton>
            </li>
        </ul>
    </div>
    <div class="dashboard_content">
        <div class="dashboard_header">
                <% if (type.ToString() == "1") { %>
                    <iframe
                        id="maps_background"
                      width="100%"
                      height="450"
                      frameborder="0"
                      style="border:0"
                      src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDJTDqMFi8a-LEz7liqy8AfeK6U-hiET_s&q=" + name + "'">
                    </iframe>
                    <% } else { %>
                        <div id="dashboard_header_image">
                            <img id="" src="<%= UserAccount.ProfilePicture() %>" />
                        </div>
                    <% } %>
        </div>
        <div class="dashboard_info">
            <h1><%=name %></h1>
            <p><%=info %></p>
        </div>
    </div>
</asp:Content>

