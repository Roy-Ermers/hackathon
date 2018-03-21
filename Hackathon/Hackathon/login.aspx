<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:Label runat="server" ID="warning"></asp:Label>
    <asp:TextBox TextMode="SingleLine" ID="username" runat="server"></asp:TextBox>
    <asp:TextBox TextMode="password" ID="password" runat="server"></asp:TextBox>
    <button runat="server" OnClick="Unnamed1_Click"><%= Translator.Translate("Login") %></button>
</asp:Content>

