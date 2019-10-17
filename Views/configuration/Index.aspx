<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<Config>>" %>

<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="FX.Utils.MvcPaging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/grid.css" rel="stylesheet" type="text/css" />    
    <div class="widget-header1"><%=Html.Encode(ViewData["comname"])%></div>
    <div class="clear"></div>
    <div style="padding: 10px 0px 10px 5px; float: right; margin-top: -20px">
        <a href="/configuration/Create?comid=<%=ViewData["comid"]%>" title="Create">
            <img alt="" src="/Content/Images/add.jpg" /></a>
    </div>    
    <table class="grid" style="width: 100%; min-width: 800px">
        <thead>
            <tr>
                <th width="30px">STT
                </th>
                <th width="200px">Từ khóa 
                </th>
                <th width="150px">Giá trị
                </th>
                <th width="30px">Sửa
                </th>
                <th width="30px" style="border-right-color: #EEE">Xóa
                </th>
            </tr>
        </thead>
        <tbody>
            <%
                IList<Config> Lstconfig = Model.ToList();
                int i = Model.PageIndex * Model.PageSize + 1;
                foreach (Config item in Lstconfig)
                {
            %>
            <tr>
                <td style="text-align: center">
                    <%=i %>
                </td>
                <td style="text-align: center">
                    <%=Html.Encode(item.Key) %>
                </td>
                <td style="text-align: center">
                    <%=Html.Encode(item.Value) %>
                </td>
                <td style="text-align: center">
                    <a href="/configuration/Edit?id=<%=item.ID%>&comid=<%=item.ComID%>" title="Edit">
                        <img alt="" src="/Content/Images/im-edit.jpg" /></a>
                </td>
                <td style="text-align: center">
                    <a href="#" onclick="OnDelete('<%=item.ID%>')" title="Delete">
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
        <%=Html.Pager(Model.PageSize, Model.PageIndex + 1, Model.TotalItemCount, new
            {
                action = "Index",
                controller = "configuration",
                comid= ViewData["comid"]
            })%>
    </div>
    <div>
        <input type="button" value="Quay lại" style="float: right; width: 70px;" onclick="document.location = '/Company/index'" />
    </div>
    <script language="javascript" type="text/javascript">
        function OnDelete(id) {
            if (!confirm("Bạn chắc chắn muốn xóa config này?"))
                return;
            document.location = "/configuration/Delete?id=" + id;
        }
    </script>
</asp:Content>
