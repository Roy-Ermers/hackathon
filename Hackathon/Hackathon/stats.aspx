﻿<%@ Page Title="Brabant2Go | Stats" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeFile="stats.aspx.cs" Inherits="Stats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navbar" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="Server">
    <% var name = Sql.ScalarQuery("Select Name FROM [User] WHERE Id = " + Request.QueryString["UserID"]); %>
    <div class="dashboard_content">
        <img id="stats_img" src="<%= UserAccount.ProfilePicture() %>" />
        <div class="dashboard_info">
            <h1 id="stats_h1"><%=Translator.Translate("stats") %> <%=name %></h1>
            <asp:Table runat="server" ID="stats_table">
            </asp:Table>
        </div>
    </div>
</asp:Content>

