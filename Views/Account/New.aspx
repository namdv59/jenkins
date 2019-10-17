<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AccountComModel>" %>
<%@ Import Namespace="IdentityManagement.Domain" %>
<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <% using (Html.BeginForm("Createnew", "Account", FormMethod.Post))
      { %>
      <% Html.RenderPartial("AccountShareElement", Model); %>
        <input type="submit" value="Tạo mới" style="margin:0px 5px 0px 300px; width:60px"/>
        <input type="button" value="Quay lại" style="width:60px" onclick="document.location = '/Account/index'" />
   <% } %>
</asp:Content>
