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
    <div class="district">
        <div id="topper">
            <div class="container">
                <h1 id="title" class="wow fadeInUp" data-wow-delay="0.2s">
                    <%=Translator.Translate("Intro") %>
                </h1>
                <button class="wow fadeInUp" data-wow-delay="0.6s">
                    <%=Translator.Translate("FindDist") %>
                </button>
            </div>
        </div>
        <div class="content">
            <h1 class="title">
                DEN BOSCH
            </h1>
            <table class="stats">
                <tr>
                    <td colspan="3">
                        <%=Translator.Translate("Citizens") %>
                    </td>
                </tr>
                <tr>
                    <td>
                        2
                    </td>
                    <td>
                        <progress min="2" max="10" value="7">

                        </progress>
                    </td>
                    <td>
                        10
                    </td>
                </tr>

                <tr>
                    <td colspan="3">
                        GEMIDDELDE LEEFTIJD
                    </td>
                </tr>
                <tr>
                    <td>
                        5
                    </td>
                    <td>
                        <progress min="5" max="50" value="23">

                        </progress>
                    </td>
                    <td>
                        50
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

