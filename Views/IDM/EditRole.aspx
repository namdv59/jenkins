<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EInvoice.SuperAdmin.Models.RoleModel>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% using (Html.BeginForm("EditRole", "IDM", FormMethod.Post))
   { %>
        <%Html.RenderPartial("IDMShareElement", Model); %>
        <br />
        <input type="submit" value="Cập nhật"  style="margin-left:350px; width:80px;"/>
        <input type="button" value="Hủy bỏ" style="margin-left:20px; width:80px;" onclick="document.location='/IDM/IndexRole'" />
<%} %>
</asp:Content>
