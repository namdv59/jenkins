<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IndexAccountModel>" %>

<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<%@ Import Namespace="IdentityManagement.Domain" %>
<%@ Import Namespace="FX.Utils.MvcPaging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/grid.css" rel="stylesheet" type="text/css" />
    <div class="widget-header1">
        Danh mục tài khoản
    </div>
    <div style="padding: 10px 5px 10px 5px; float: right"><a href="/Account/New/" title="Tạo mới">
        <img alt="" src="/Content/Images/add-user-icon.png" /><br />
        Tạo mới</a></div>
    <div style="padding: 10px 5px 10px 5px; vertical-align: bottom; height: 33px; float: left">
        <form id="Searchform" method="post" action="/Account/Index">
            Tên tài khoản:
            <%=Html.TextBox("username", Model.username, new {style="width: 250px; margin-left: 10px; margin-right: 10px", maxlength="50" })%> 
            <input id="Submit1" type="submit" value="Tìm kiếm" />
        </form>
    </div>

    <table style="width: 100%; min-width: 800px" class="grid">
        <thead>
            <tr>
                <th width="30px">Stt
                </th>
                <th width="100px">Tên tài khoản:
                </th>
                <th width="100px">Email
                </th>
                <th width="30px">Kích hoạt
                </th>
                <th width="30px">Khóa
                </th>
                <th width="80px">Ngày tạo
                </th>
                <th width="30px">Sửa
                </th>
                <th width="30px">Xóa
                </th>
            </tr>
        </thead>
        <tbody>
            <%         
                IList<user> userlst = Model.PageListUser.ToList();
                int i = Model.PageListUser.PageIndex * Model.PageListUser.PageSize + 1;
                foreach (user ur in userlst)
                {
            %>
            <tr>
                <td><%=i%></td>
                <td><%=Html.Encode(ur.username)%></td>
                <td><%=Html.Encode(ur.email)%></td>
                <td><%=ur.IsApproved ? "Yes" : "No"%></td>
                <td><%=ur.IsLockedOut ? "Yes" : "No"%></td>
                <td><%=ur.CreateDate.ToString("dd/MM/yyyy")%></td>
                <td style="text-align: center"><a href="/Account/Edit/<%=ur.userid%>" title="Edit">
                    <img alt="" src="/Content/Images/im-edit.jpg" /></a></td>
                <td style="text-align: center"><a href="#" onclick="OnDelete('<%=ur.userid%>')" title="Delete">
                    <img alt="" src="/Content/Images/no.png" /></a></td>
            </tr>
            <%i++;
    }
            %>
        </tbody>
    </table>
    <div class="pager">
        <%=Html.Pager(Model.PageListUser.PageSize, Model.PageListUser.PageIndex + 1, Model.PageListUser.TotalItemCount,new
                {
                   action = "index",
                   controller = "Account",
                   username = Model.username                                     
               })%>
    </div>
    <script language="javascript" type="text/javascript">
        function OnDelete(id) {
            if (!confirm("Bạn có chắc chắn xóa tài khoản này không?"))
                return;
            document.location = "/Account/delete?id=" + id;
        }
        $(document).ready(function () {
            $("#username").keypress(function (event) {
                return validText(event);
            });
            $("#username").keyup(function (event) {
                return validText(event);
            });
        });
        function validText(e) {
            var keypressed = String.fromCharCode(e.which);
            var dbs = new Array("~", "@", "#", "$", "^", "*", ";", "|", "<", ">", "!");
            var sum = dbs.length;
            var i = 0;
            while (i < sum) {
                if (dbs[i] == keypressed)
                    return false;
                i++;
            }
            return;
        }       
    </script>
</asp:Content>
