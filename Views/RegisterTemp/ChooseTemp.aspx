<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<RegisterTempModels>" %>
<%@ Import Namespace="EInvoice.SuperAdmin.Models"%>
<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="EInvoice.Core.IService" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="widget-header1" style="border-bottom:none">ĐĂNG KÝ MẪU HÓA ÐON</div> 
    <% using (Html.BeginForm("ChooseTemp", "RegisterTemp", FormMethod.Get, new { name = "myform"}))
       { %>
    <% Html.RenderPartial("InvRegTempShareElement", Model); %>        
    <% } %>    
</asp:Content>
