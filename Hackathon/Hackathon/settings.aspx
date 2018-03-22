<%@ Page Title="Settings" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="settings.aspx.cs" Inherits="settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%=Page.ResolveUrl("Style/dashboard.css") %>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="sidenav">
        <div class="top">
            <img id="sidenavimg" src="<%=UserAccount.ProfilePicture() %>" />
            <p class="user"><%=Request.QueryString["UserName"]%><br /><span>Admin</span></p>
        </div>
        <ul>
            <li>
                <a href="../dashboard"><%= Translator.Translate("dashboard") %></a>
            </li>
            <li class="active">
                <a><%= Translator.Translate("settings") %></a>
            </li>
            <li>
                <a href="stats.aspx">Stats</a>
            </li>
        </ul>
    </div>
    <div class="dashboard_content">
        <div class="settings_company">
            <h1><%= Translator.Translate("settings") %></h1>
            <table class="settings">
                <tr>
                    <td><label><%= Translator.Translate("companyname") %></label></td>
                    <td><asp:TextBox ID="TbBedrijfsnaam" runat="server" OnTextChanged="TbBedrijfsnaam_TextChanged"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label><%= Translator.Translate("companyinfo") %></label></td>
                    <td><asp:TextBox TextMode="multiline" Columns="50" Rows="5" ID="TbBedrijfsinfo" runat="server" OnTextChanged="TbBedrijfsinfo_TextChanged"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label><%= Translator.Translate("companylogo") %></label></td>
                    <td><asp:FileUpload ID="FileUpload" runat="server" /></td>
                </tr>
                <tr>
                    <td><label><%= Translator.Translate("password") %></label></td>
                    <td><asp:TextBox ID="Password" runat="server" TextMode="password"></asp:TextBox><br /><asp:TextBox ID="Password2" runat="server" TextMode="password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button runat="server" ID="Save" CausesValidation="False" OnClick="Save_Click"/>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

