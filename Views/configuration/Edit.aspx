<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Config>" %>

<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="EInvoice.Core.IService" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm("Edit", "configuration", FormMethod.Post))
       { %>
    <% Html.RenderPartial("ConfigShareElement", Model); %>
    <input id="Submit" type="submit" value="Lưu" style="margin: 5px 10px 5px 400px; width: 60px" />
    <input type="button" value="Quay lại" style="width: 60px" onclick="document.location = '/configuration/Index?comid=<%=Model.ComID%>    '" />
    <%}%>
</asp:Content>

