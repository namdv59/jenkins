<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<KeyStoresModel>" %>
<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="widget-header1" style="border-bottom: none">
    Tạo thông tin KeyStore
</div>
<% using (Html.BeginForm("AddKeyStore", "Company", FormMethod.Post))
      { %>
      <%=Html.Hidden("comId",Model.ComId) %>
      <% Html.RenderPartial("CompanyKeyStoresShareElement", Model); %>
        <input type="button" id="Save" value="Tạo mới"  style="margin-left:400px" onclick="sub()" />
        <input type="button" value="Quay lại" onclick="CancelClick(<%=Model.ComId%>)"  style="margin-left:10px"/>
   <% } %>
   <script language="javascript" type="text/javascript">
        function sub() {
            document.forms[0].submit();
        }
       function CancelClick(Comid) {
           document.location = "/Company/ViewKeyStores?Comid=" + Comid;
       }
    </script>
</asp:Content>

