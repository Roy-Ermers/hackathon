<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%=Page.ResolveUrl("Style/dashboard.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <% var name = Sql.ScalarQuery("Select Name FROM [User] WHERE Id = " + Request.QueryString["UserID"]); %>
    <div class="sidenav">
        <div class="top">
            <img id="sidenavimg" src="<%=UserAccount.ProfilePicture() %>" />
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
            <div id="dashboard_header_image">
                 <img id="" src="<%= UserAccount.ProfilePicture() %>" />
            </div>
        </div>
        <div class="dashboard_info">
            <h1><%=name %></h1>
            <p><%=Sql.ScalarQuery("SELECT Info FROM [User] WHERE Id = " + Request.QueryString["UserID"]) %></p>
        </div>
    </div>
</asp:Content>

