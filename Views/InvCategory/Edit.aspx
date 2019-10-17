<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<InvCategory>" %>
<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="EInvoice.Core.IService" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% using (Html.BeginForm("Update", "InvCategory", FormMethod.Post))
   { %>
        <%Html.RenderPartial("InvCateShareElement", Model); %> 
        <input type="submit" style="margin:5px 10px 0px 70px;width:60px" value="<%=Resources.Einvoice.BtnSave%>" />
        <input type="button" style="width:60px" value="<%=Resources.Einvoice.BtnBack%>" onclick="document.location = '/InvCategory/index'" />
<%} %>
</asp:Content>
