<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="districts.aspx.cs" Inherits="Districts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="container">
        <%
            var query = Sql.Query("SELECT * FROM [User];");
            while(query.Read()) {
                for(int i = 0; i < query.FieldCount; i++) {
                    Response.Write(query.GetValue(i) + "<br>");
                }
            }
        %>
    </div>
</asp:Content>

