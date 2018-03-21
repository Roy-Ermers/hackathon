<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>TestPagina</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="body" Runat="Server">
    <div class="district">
        <div id="topper">
            <div class="container">
                <h1 id="title">
                    HERE YOU CAN FIND THE BEST<br>
                    DUTCH DESTRICT FOR YOUR COMPANY.
                </h1>
                <button>
                    FIND A DESTRICT
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
                        <%=Translator.Translate("Citzens") %>INWONERS
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

