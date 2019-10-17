<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CompanyModel>" %>
<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm("Update", "Company", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
    <% Html.RenderPartial("CompanyShareElement", Model); %>
    <input type="button" value="Sửa đổi" style="margin-left: 250px; width: 60px;" onclick="test()" id="save" />
    <input type="button" value="Quay lại" style="margin-left: 20px; width: 60px;" onclick="Onclick()"  />
    <% } %>
    <script language="javascript" type="text/javascript">
        function Onclick() {
            document.location = "/Company/index";
        }
        function test() {
            if ($("form:first").valid())
                checkMST($('#TaxCode').val(), 'save');
        }
    </script>
</asp:Content>
