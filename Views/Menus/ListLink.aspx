<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<NavigateLink>>" %>

<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="FX.Utils.MvcPaging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<link href="/Content/css/grid.css" rel="stylesheet" type="text/css" />
    <div class="widget-header1">
        Danh sách chức năng hệ thống
    </div>
    <!--End div widget-header1-->
    <div style="padding: 10px 5px 10px 5px; float: left; vertical-align: bottom">
        <form id="Searchform" method="post" action="/Menus/Listlink">                     
            <%=Html.TextBox("name",  (string)ViewData["name"], new { style = "width:250px", maxlength="200"})%>
            <input type="submit" value="Tìm kiếm" />
        </form>
    </div>
    <div style="padding: 10px 5px 10px 5px; float: right">
        <a href="/Menus/CreateLink" title="Create">
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
                <th>
                    Mô tả
                </th> 
                <th style="width:100px">
                    Permission
                </th>                
                <th style="width:30px">
                    Sửa
                </th>                
            </tr>
        </thead>
        <tbody>
            <%int i = Model.PageIndex * Model.PageSize + 1;
                foreach (var it in Model.ToList())
              { %>
            <tr>
                <td style="text-align:right"><%=i %></td>
                <td><%=Html.Encode(it.Name)%></td>
                <td><%=Html.Encode(it.NavigateUrl)%></td>                
                <td><%=Html.Encode(it.Sumary)%></td>
                <td style="text-align:center"><%=Html.Encode(it.PermissionCode)%></td>
                <td style="text-align: center"><a href="/Menus/EditLink/<%=it.Id%>" title="Edit">
                    <img alt="" src="/Content/Images/im-edit.jpg" /></a></td>                
            </tr>
            <% i++;      
          }%>
        </tbody>
    </table>
    <div class="pager">
        <%=Html.Pager(Model.PageSize, Model.PageIndex + 1, Model.TotalItemCount, new
            {
                action = "listlink",
                controller = "Menus",
                name = ViewData["name"]
            })%>
    </div>
</asp:Content>
