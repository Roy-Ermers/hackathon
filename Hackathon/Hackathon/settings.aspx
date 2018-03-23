<%@ Page Title="Brabant2Go | Settings" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeFile="settings.aspx.cs" Inherits="settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
    <asp:Content ID="Content3" ContentPlaceHolderID="navbar" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="dashboard_content">
        <div class="settings_company container">
            <h1><%= Translator.Translate("settings") %></h1>
            <table class="settings">
                <tr>
                    <td><label><%= Translator.Translate("companyname") %></label><br /><asp:TextBox ID="TbBedrijfsnaam" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label><%= Translator.Translate("companyinfo") %></label><br /><asp:TextBox TextMode="multiline" Columns="50" Rows="5" ID="TbBedrijfsinfo" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label><%= Translator.Translate("companylogo") %></label><br /><asp:FileUpload ID="FileUpload" runat="server" /></td>
                </tr>
                <tr>
                    <td><label><%= Translator.Translate("password") %></label><br /><asp:TextBox ID="Password" runat="server" TextMode="password"></asp:TextBox><br /><asp:TextBox ID="Password2" runat="server" TextMode="password"></asp:TextBox></td>
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

