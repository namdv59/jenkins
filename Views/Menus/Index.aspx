<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MenusModels>" %>

<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="FX.Utils.MvcPaging" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/grid.css" rel="stylesheet" type="text/css" />
    <div class="widget-header1">
        Danh mục quản lý menu công ty
    </div>
    <!--End div widget-header1-->
    <div style="padding: 10px 5px 10px 5px; float: left; vertical-align: bottom">
        <form id="Searchform" name="Searchform" method="post" action="/Menus/Index">
            <b style="margin: 8px">Công ty:</b>
            <%=Html.Hidden("Change") %>
            <%=Html.DropDownList("comId", new SelectList(Model.Companies, "id", "Name",Model.ComId), new { style = "width:250px;margin-left: 5px"})%>
            <b style="margin-left: 20px">Menu cha:</b>
            <%=Html.DropDownList("parentId", new SelectList(ViewBag.Parents,"Id","Name"),new { style = "width:150px;margin-left: 5px", onchange="document.Searchform.submit();" }) %>            
            <b style="margin-left:20px">Hiển thị menu cha</b><%=Html.CheckBox("isParent", false, new { style="vertical-align:middle;margin-left: 5px", onchange="document.Searchform.submit();"})%>
        </form>
    </div>
    <div style="padding: 10px 5px 10px 5px; float: right">
        <a href="/Menus/Create?comid=<%=Model.ComId%>" title="Create">
            <img alt="" src="/Content/Images/add.jpg" /></a>
    </div>
    <table style="width: 100%; min-width: 800px" class="grid">
        <thead>
            <tr>
                <th style="width:30px">
                    STT
                </th>
                <th>
                    Tên
                </th>
                <th>
                    Link
                </th>
                <th style="width:30px">
                    Vị trí
                </th>
                <th style="width:60px">
                    ?Sử dụng
                </th>                
                <th style="width:30px">
                    Sửa
                </th>
                <th style="width:30px;border-bottom-color: #EEE">
                    Xóa
                </th>
            </tr>
        </thead>
        <tbody>
            <%int i = Model.PagedListMenus.PageIndex * Model.PagedListMenus.PageSize + 1;
                foreach (var it in Model.PagedListMenus.ToList())
              { %>
            <tr>
                <td style="text-align:right"><%=i %></td>
                <td><%=Html.Encode(it.Name)%></td>
                <td><%=Html.Encode(it.NavigateUrl)%></td>
                <td style="text-align: center"><%=Html.Encode(it.Priority)%></td>                
                <td style="text-align:center"><img src="<%=it.IsPub ? "/Content/Images/valid.png" : "/Content/Images/cross.gif" %>" /></td>                
                <td style="text-align: center"><a href="/Menus/Edit/<%=it.Id%>" title="Edit">
                    <img alt="" src="/Content/Images/im-edit.jpg" /></a></td>
                <td style="text-align: center"><a href="#" onclick="OnDelete('<%=it.Id%>')" title="Delete">
                    <img alt="" src="/Content/Images/no.png" /></a></td>
            </tr>
            <% i++;      
          }%>
        </tbody>
    </table>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $('#comId').change(function () {
               $("#Change").val(1);
               document.Searchform.submit();                    
            });
        });
        function OnDelete(id) {
            if (!confirm("Chắc chắn xóa menu này?"))
                return;
            document.location = "/Menus/delete?id=" + id;
        }        
    </script>
</asp:Content>
