<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="container">
        <div id="login">
            <h1>
                LOGIN
            </h1>
            <table>
                <tr>
                    <td colspan="2">
                        <asp:Label runat="server" ID="warning"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Username:
                    </td>
                    <td>
                        <asp:TextBox TextMode="SingleLine" ID="username" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Password
                    </td>
                    <td>
                        <asp:TextBox TextMode="password" ID="password" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <button runat="server" OnClick="Unnamed1_Click"><%= Translator.Translate("Login") %></button>
            </table>
        </div>
    </div>
</asp:Content>

