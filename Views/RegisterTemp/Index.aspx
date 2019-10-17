<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<RegIndexModel>" %>

<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="FX.Utils.MvcPaging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/grid.css" rel="stylesheet" type="text/css" />    
    <div class="widget-header1">Danh mục hóa đơn đăng ký</div>
    <div style="padding: 10px 5px 10px 5px; float: left; vertical-align: bottom">
        <form id="Searchform" name="Searchform" method="post" action="/RegisterTemp/Index" onsubmit="getHiddenValue()">
            <b style="margin: 8px">Công ty:</b>
            <%=Html.DropDownList("ComID", Model.selectlistCom, new { style = "width:300px;margin-left: 5px", onchange="document.Searchform.submit()" })%>            
        </form>
    </div>

    <div style="padding: 10px 5px 10px 0px; float: left; vertical-align: bottom">
    </div>
    <div class="clear"></div>

    <table class="grid" style="width: 98%; min-width: 800px">
        <thead>
            <tr>
                <th width="30px">STT
                </th>
                <th width="150px">Mẫu đăng ký
                </th>
                <th width="200px">Tên mẫu 
                </th>
                <th width="150px">Tên loại
                </th>
                <th width="100px">Mẫu số
                </th>
                <th width="30px">Sửa
                </th>
                <th width="30px" style="border-right-color: #EEE">Xóa
                </th>
            </tr>
        </thead>
        <tbody>
            <%
                IList<RegisterTemp> rtList = Model.PagedlistReg.ToList();
                int i = Model.PagedlistReg.PageIndex * Model.PagedlistReg.PageSize + 1;
                foreach (RegisterTemp rt in rtList)
                {
            %>
            <tr>
                <td style="text-align: center">
                    <%=i%>
                </td>
                <td style="text-align: center">
                    <%=Html.Encode(rt.Name)%>
                </td>
                <td style="text-align: center">
                    <%=rt.InvoiceTemp !=null ? Html.Encode(rt.InvoiceTemp.TemplateName) : ""%>
                </td>
                <td style="text-align: center">
                    <%=rt.InvoiceTemp != null ? Html.Encode(rt.InvoiceTemp.InvCateName) : ""%>
                </td>
                <td style="text-align: center">
                    <%=Html.Encode(rt.InvPattern)%>
                </td>
                <td style="text-align: center">
                    <a href="/RegisterTemp/Edit?id=<%=rt.Id%>&back=<%=Model.back%>" title="Edit">
                        <img alt="" src="/Content/Images/im-edit.jpg" /></a>
                    <%=Html.Hidden("back", Model.back)%>
                </td>
                <td style="text-align: center">
                    <a href="#" onclick="OnDelete('<%=rt.Id%>')" title="Delete">
                        <img alt="" src="/Content/Images/no.png" /></a>
                </td>
            </tr>
            <%
                    i++;
                } 
            %>
        </tbody>
    </table>
    <div class="pager">
        <%=Html.Pager(Model.PagedlistReg.PageSize, Model.PagedlistReg.PageIndex + 1, Model.PagedlistReg.TotalItemCount, new
            {
                action = "Index",
                controller = "RegisterTemp",
                selectedComId = Model.selectedComId,
            })%>
    </div>
    <script language="javascript" type="text/javascript">
        function OnDelete(id) {            
            if (!confirm("Bạn chắc chắn muốn xóa đăng ký mẫu này?"))
                return;
            document.location = "/RegisterTemp/Delete?id=" + id;
        }
    </script>
</asp:Content>

