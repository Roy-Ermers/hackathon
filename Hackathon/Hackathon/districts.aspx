<%@ Page Title="Brabant2Go | Districts" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="districts.aspx.cs" Inherits="Districts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="<%=Page.ResolveUrl("Style/animate.css") %>">
    <script src='<%=Page.ResolveUrl("Js/wow.min.js") %>'></script>
        <script>
            new WOW().init();
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <section id="sidebar">
        <ul>
            <li>
                <asp:Table runat="server" id="Filters">
                </asp:Table>
                <asp:Button id="district_search" runat="server" OnClick="Unnamed1_Click" Text="Filter" />
            </li>
        </ul>
    </section>
    <section id="content">
        <div class="container">
            <div clientid="districts" id="districts" runat="server">
            </div>
    </section>
</asp:Content>

