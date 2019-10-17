<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TempIndexModel>" %>
<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="FX.Utils.MvcPaging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/grid.css" rel="stylesheet" type="text/css" />
    <div class="widget-header1">
        Danh mục mẫu hóa đơn
    </div>

    <div style="padding: 10px 5px 10px 5px; float: left; vertical-align: bottom">
        <% using (Html.BeginForm("Index", "InvoiceTemplate", FormMethod.Post, new { @name="tempIndex"}))
           {%>
                  <b style="margin-left: 95px">Tên mẫu</b>
                  <%=Html.TextBox("TempName", Model.TempName, new { @style = "width:150;margin-left:5px;margin-right:10px", maxlength = "100" })%>
                  <b style="margin: 8px">Loại hóa đơn:</b>
                  <%=Html.DropDownList("CateID", Model.lstInvCategory, "--Tất cả--", new { @style = "width:150px;margin-left: 5px", onchange = "document.tempIndex.submit();" })%>                  
                 <input type="submit" value="Tìm kiếm"/>
        <%}%>
    </div>

    <div style="padding: 10px 0px 10px 5px; float: right">
        <a href="/InvoiceTemplate/Create/" title="Create">
            <img alt="" src="/Content/Images/add.jpg" /></a>
    </div>

    <table class="grid" style="width: 100%; min-width: 650px">
        <thead>
            <tr>
                <th width="30px">
                    STT
                </th>
                <th width="150px">
                    Tên mẫu hóa đơn
                </th>
                <th width="250px">
                    Loại hóa đơn
                </th>
                <th width="50px">
                    Chi tiết
                </th>
                <th width="30px">
                    Sửa
                </th>
                <th width="30px" style="border-bottom-color: #EEE">
                    Xóa
                </th>
            </tr>
        </thead>
        <tbody>
            <%
                List<InvTemplate> lstInvtemp = Model.PageListTemp.ToList();
                int i = Model.PageListTemp.PageIndex * Model.PageListTemp.PageSize + 1;
                foreach (InvTemplate item in lstInvtemp)
                {
            %>
            <tr>
                <td style="text-align: center">
                    <%=i %>
                </td>
                <td>
                    <%=Html.Encode(item.TemplateName)%>
                </td>
                <td>
                    <%=Html.Encode(item.InvCateName)%>
                </td>
                <td style="text-align: center">
                    <a href="/InvoiceTemplate/DetailInvTemp/<%=item.Id%>" title="Details">
                        <img alt="" src="/Content/Images/details.png" /></a>
                </td>
                <td style="text-align: center">
                    <a href="/InvoiceTemplate/Edit/<%=item.Id%>" title="Edit">
                        <img alt="" src="/Content/Images/im-edit.jpg" /></a>
                </td>
                <td style="text-align: center">
                    <a href="#" onclick="OnDelete('<%=item.Id%>')" title="Delete">
                        <img alt="" src="/Content/Images/no.png" /></a>
                </td>
            </tr>
            <%i++;}%>
        </tbody>
    </table>

    <div class="pager">
        <%=Html.Pager(Model.PageListTemp.PageSize, Model.PageListTemp.PageIndex + 1, Model.PageListTemp.TotalItemCount, new
            {
                action = "index",
                controller = "InvoiceTemplate",
                CateID = Model.CateID,
                TempName = Model.TempName
            })%>
    </div>
    <script language="javascript" type="text/javascript">
        function OnDelete(id) {
            if (!confirm("Bạn có chắc chắn xóa mẫu hóa đơn này?"))
                return;
            document.location = "/InvoiceTemplate/delete?id=" + id;
        }        
    </script>
</asp:Content>
