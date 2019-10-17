<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EInvoice.Core.Domain.NavigateLink>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% using (Html.BeginForm("CreateLink", "Menus", FormMethod.Post))
       { %>
    <% Html.RenderPartial("NavLinkUsecontrol", Model); %>
    <input id="Submit" type="submit" value="Lưu" style="margin: 5px 10px 5px 400px; width: 60px" />
    <input type="button" value="Quay lại" style="width: 60px" onclick="document.location = '/Menus/Listlink'" />
    <%}%>

</asp:Content>
