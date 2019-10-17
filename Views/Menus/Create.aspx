<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EInvoice.Core.Domain.Menu>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% using (Html.BeginForm("Create", "Menus", FormMethod.Post))
       { %>
    <% Html.RenderPartial("MenuShareElement", Model); %>
    <input id="Submit" type="submit" value="Lưu" style="margin: 5px 10px 5px 400px; width: 60px" />
    <input type="button" value="Quay lại" style="width: 60px" onclick="document.location = '/Menus/Index?comid=<%=Model.ComID%>'" />
    <%}%>
</asp:Content>
