<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AccountComModel>" %>
<%@ Import Namespace="IdentityManagement.Domain" %>
<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm("NewAccountCom", "Account", FormMethod.Post))
       { %>
    <% Html.RenderPartial("AccountShareElement", Model); %>
    <input type="hidden" name="comID" value="<%=Model.tmpUser.GroupName %>" />
    <input type="submit" value="Lưu" style="margin: 0px 5px 0px 300px; width: 60px" />
    <input type="button" value="Quay lại" style="width: 60px" onclick="document.location = '/Company/index'" />
    <% } %>
</asp:Content>
