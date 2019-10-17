<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<user>" %>
<%@ Import Namespace="IdentityManagement.Domain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm("ServiceRoleUpdate", "Account", FormMethod.Post, new { onsubmit = "return isSelectCompany();" }))
       { %>
    <b style="margin: 8px">Công ty:</b>
    <%=Html.Label(ViewData["NameCompany"] as string) %>  
    <%=Html.Hidden("ComID", Model.GroupName) %>  
    <% Html.RenderPartial("AccountRoleShareElement", Model); %>
    <input type="submit" value="Sửa đổi" style="margin: 0px 5px 0px 300px; width: 60px" />
    <input type="button" value="Quay lại" style="width: 60px" onclick="document.location = '/Account/ServiceRoleIndex'" />
    <% } %>    
</asp:Content>

