<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="districts.aspx.cs" Inherits="Districts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <section id="sidebar">
        <ul>
            <li>
                <asp:Table runat="server" id="Filters">
                </asp:Table>
            </li>
        </ul>
    </section>
    <section id="content">
        <div class="container">
            <div id="districts" runat="server">
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

