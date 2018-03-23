<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="container">
        <div id="login">
            <div id="login-topper">
                <h1 id="title">
                    LOGIN
                </h1>
                <p id="subtitle">
                    <asp:Label runat="server" ID="warning"></asp:Label>
                </p>
            </div>
            <div id="login-content">
                <label for="username">
                    <%= Translator.Translate("Username") %>:
                </label><br />
                <asp:TextBox TextMode="SingleLine" ID="username" runat="server"></asp:TextBox><br />
                <label for="password">
                    <%= Translator.Translate("Password") %>:
                </label><br />
                <asp:TextBox TextMode="password" ID="password" runat="server"></asp:TextBox><br />
                <button runat="server" OnServerClick="Unnamed1_Click"><%= Translator.Translate("Login") %></button>
            </div>
        </div>
    </div>
</asp:Content>

