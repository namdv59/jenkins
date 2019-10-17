<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<user>>" %>

<%@ Import Namespace="IdentityManagement.Domain" %>
<%@ Import Namespace="FX.Utils.MvcPaging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/grid.css" rel="stylesheet" type="text/css" />
    <div class="widget-header1">
        Danh sách các tài khoản có quyền Roleservice
    </div>
    <div style="padding: 10px 5px 10px 5px; float: right">
        <a href="/Account/NewServiceRole/" title="Tạo mới">
            <img alt="" src="/Content/Images/add-user-icon.png" /><br />
            Tạo mới</a>
    </div>
    <div style="padding: 10px 5px 10px 5px; vertical-align: bottom; height: 33px; float: left">
        <form id="Searchform" method="post" action="/Account/ServiceRoleIndex">
            <%=Resources.Einvoice.User_LblAccountName%>
            <input id="username" name="username" type="text" style="width: 200px; margin-left: 10px; margin-right: 10px" value="<%=Html.Encode(ViewData["username"] )%>" maxlength="200" />
            <input id="Submit1" type="submit" value="Tìm kiếm" />
        </form>
    </div>

    <table style="width: 100%; min-width: 800px" class="grid">
        <thead>
            <tr>
                <th width="30px">
                    <%=Resources.Einvoice.LblStt %>
                </th>
                <th width="100px">
                    <%=Resources.Einvoice.User_LblAccountName %>
                </th>
                <th width="100px">
                    <%=Resources.Einvoice.User_LblEmail %>
                </th>
                <th width="30px">
                    <%=Resources.Einvoice.User_LblActive %>
                </th>
                <th width="30px">
                    <%=Resources.Einvoice.User_LblLock %>
                </th>
                <th width="80px">
                    <%=Resources.Einvoice.User_LblCreateDate %>
                </th>
                <th width="30px">
                    <%=Resources.Einvoice.LblEdit %>
                </th>
            </tr>
        </thead>
        <tbody>
            <%         
                IList<user> userlst = Model.ToList();
                int i = Model.PageIndex * Model.PageSize + 1;
                foreach (user ur in userlst)
                {
            %>
            <tr>
                <td><%=i%></td>
                <td><%=ur.username%></td>
                <td><%=ur.email%></td>
                <td><%=ur.IsApproved ? "Yes" : "No"%></td>
                <td><%=ur.IsLockedOut ? "Yes" : "No"%></td>
                <td><%=ur.CreateDate.ToString("dd/MM/yyyy")%></td>
                <td style="text-align: center"><a href="/Account/ServiceRoleEdit/<%=ur.userid%>" title="<%=Resources.Einvoice.LblEdit %>">
                    <img alt="" src="/Content/Images/im-edit.jpg" /></a></td>
            </tr>
            <%i++;
                }
            %>
        </tbody>
    </table>
    <div class="pager">
        <%=Html.Pager(Model.PageSize, Model.PageIndex + 1, Model.TotalItemCount,new
                {
                   action = "ServiceRoleIndex",
                   controller = "Account",
                   username = ViewData["username"]                                      
               })%>
    </div>    
</asp:Content>
