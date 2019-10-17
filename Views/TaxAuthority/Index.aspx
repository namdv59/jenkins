<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<TaxAuthority>>" %>

<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="FX.Utils.MvcPaging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/grid.css" rel="stylesheet" type="text/css" />        
    <div class="widget-header1">
        <%=Resources.Einvoice.Tax_LblCategory %>
    </div>
    <!--End div widget-header1-->
    <div style="padding: 10px 5px 10px 0px; float: left; vertical-align: bottom">
        <form id="Searchform" method="post" action="/TaxAuthority/Index">
            <b><%=Resources.Einvoice.Tax_LblName%>:</b>
            <%=Html.TextBox("name", (string)ViewData["name"], new {style="width: 200px; margin-left: 10px;margin-right: 10px", maxlength="200" })%>
            <input id="Submit1" type="submit" value="<%=Resources.Einvoice.BtnSeach %>" />
        </form>
    </div>
    <div style="padding: 10px 0px 10px 5px; float: right">
        <a href="/TaxAuthority/Create/"><img alt="" src="/Content/Images/add.jpg" /></a>
    </div>
    <table style="width: 100%; min-width: 800px" class="grid">
        <thead>
            <tr>
                <th width="20px">
                    <%=Resources.Einvoice.LblStt%>
                </th>
                <th width="50px">
                    <%=Resources.Einvoice.Tax_LblCode%>
                </th>
                <th width="120px">
                    <%=Resources.Einvoice.Tax_LblName %>
                </th>
                <th width="160px">
                    <%=Resources.Einvoice.Tax_LblAddress %>
                </th>
                <th width="80px">
                    <%=Resources.Einvoice.Tax_LblPhone %>
                </th>
                <th width="35px">
                    <%=Resources.Einvoice.LblEdit %>
                </th>
                <th width="35px" style="border-right-color: #EEE">
                    <%=Resources.Einvoice.LblDelete %>
                </th>
            </tr>
        </thead>
        <tbody>
            <% 
                int i = Model.PageIndex * Model.PageSize + 1;
                foreach (TaxAuthority tax in Model.ToList())
                {
            %>
            <tr>
                <td align="center">
                    <%=i%>
                </td>
                <td>
                    <%=Html.Encode(tax.Code)%>
                </td>
                <td>
                    <%=Html.Encode(tax.Name) %>
                </td>
                <td>
                    <%=Html.Encode(tax.Address) %>
                </td>
                <td>
                    <%=Html.Encode(tax.Phone)%>
                </td>
                <td style="text-align: center">
                    <a href="/TaxAuthority/Edit?id=<%=Html.Encode(tax.Code)%>">
                        <img alt="" src="/Content/Images/im-edit.jpg" /></a>
                </td>
                <td style="text-align: center">
                    <a href="#" onclick="OnDelete('<%=Html.Encode(tax.Code)%>')">
                        <img alt="" src="/Content/Images/no.png" /></a>
                </td>
            </tr>
            <% i++;
                   }%>
        </tbody>
    </table>
    <div class="pager">
        <%=Html.Pager(Model.PageSize, Model.PageIndex + 1, Model.TotalItemCount, new
            {
                action = "index",
                controller = "TaxAuthority",
                name = ViewData["name"]
            })%>
    </div>
    <script type="text/javascript">
        function OnDelete(Code) {
            if (!confirm("Bạn có chắc chắn xóa cơ quan thuế này không?"))
                return;
            document.location = "/TaxAuthority/delete?Code=" + Code;
        }
        function htmlEntities(str) { return String(str).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;") }
    </script>
</asp:Content>
