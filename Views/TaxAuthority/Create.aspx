<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TaxAuthority>" %>
<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="EInvoice.Core.IService" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% using(Html.BeginForm("Create","TaxAuthority",FormMethod.Post) )
   {%>
   <% Html.RenderPartial("TaxAuthorShareElement",Model); %>
        <input type="submit" value="<%=Resources.Einvoice.BtnSave %>" style="margin:5px 10px 0px 250px; width:60px;"/>
        <input type="button" value="<%=Resources.Einvoice.BtnBack %>" style="width:60px;" onclick="document.location = '/TaxAuthority/index'" />
   <%} %>
</asp:Content>
