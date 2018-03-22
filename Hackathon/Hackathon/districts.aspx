<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="districts.aspx.cs" Inherits="Districts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
    <script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <section id="sidebar">
        <ul>
            <li>
                <table>
                    <tr>
                        <td colspan="3">
                            <%=Translator.Translate("Citizens") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            MIN
                        </td>
                        <td>
                            <input id="citizens" type="range" min="0" max="100" />
                        </td>
                        <td>
                            MAX
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            EVERAGE AGE
                        </td>
                    </tr>
                    <tr rowspan="2">
                        <td>
                            MIN
                        </td>
                        <td>
                            <input id="averageAge" type="range" min="0" max="100" />
                        </td>
                        <td>
                            MAX
                        </td>
                    </tr>
                </table>
            </li>
        </ul>
    </section>
    <section id="content">
        <div class="container">
            <div id="districts">
                            <%
                var query = Sql.Query("SELECT Id, Name FROM [User] WHERE Type=1 ORDER BY Name ASC;");
                while(query.Read()) {
                    Response.Write(
                        "<div class='district'>" +
                            "<div class='district-top'>" +
                                "<img id='avatar' src='" + UserAccount.ProfilePicture((int)query.GetValue(0)) + "'>" + 
                            "</div>" +
                            "<div class='district-content'>" +
                                "<h1 class='district-content-title'>" +
                                    query.GetValue(1) +
                                "</h1>" +
                                "<div class='district-stats'>" +
                                    "<table>" +
                                        "<tr>" +
                                            "<td>" +
                                                "0" +
                                            "</td>" +
                                            "<td>" +
                                                "<progress min='0' value='43' max='100'>" +
                                                    "43" +
                                                "</progress>" +
                                            "</td>" +
                                            "<td>" +
                                                "100" +
                                            "</td>" +
                                        "</tr>" +
                                    "</table>" +
                                "</div>" +
                            "</div>" +
                        "</div>"
                        );
                }
            %>
            </div>
    </section>
</asp:Content>

