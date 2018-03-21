<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>TestPagina</title>
    <link rel="stylesheet" href="<%=Page.ResolveUrl("Style/animate.css") %>">
    <script src='<%=Page.ResolveUrl("Js/wow.min.js") %>'></script>
        <script>
            new WOW().init();
        </script>
</asp:Content>
<asp:Content ContentPlaceHolderID="body" Runat="Server">
        <div id="topper">
            <div class="container">
                <h1 id="title" class="wow fadeInUp" data-wow-delay="0.2s">
                    <%=Translator.Translate("Intro") %>
                </h1>
                <button class="wow fadeInUp" data-wow-delay="0.6s">
                    <%=Translator.Translate("FindDist") %>
                </button>
                <h1 id="down">
                    ▼
                </h1>
            </div>
        </div>
       </asp:Content>

