<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ComIndexModel>" %>

<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="FX.Utils.MvcPaging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/grid.css" rel="stylesheet" type="text/css" />
    <div class="widget-header1">
        Danh mục quản lý công ty
    </div>
    <!--End div widget-header1-->
    <div style="padding: 10px 5px 10px 5px; float: left; vertical-align: bottom">
        <form id="Searchform" method="post" action="/Company/Index">
            Tên đơn vị:
            <%=Html.TextBox("ComName", Model.ComName, new { style="width: 200px; margin-left: 10px; margin-right: 10px", maxlength="200"})%>            
            <input id="Submit1" type="submit" value="Tìm kiếm" />
        </form>
    </div>
    <div style="padding: 10px 0px 0 0; float: right">
        <a href="/Company/Create/" title="Create">
            <img alt="" src="/Content/Images/add.jpg" /></a>
    </div>
    <table style="width: 100%; min-width: 800px" class="grid">
        <thead>
            <tr>
                <th style="width: 30px">Stt
                </th>
                <th style="width: 200px">Tên đơn vị
                </th>
                <th>Email
                </th>
                <th style="width: 100px">Tài khoản
                </th>
                <th style="width: 200px">Địa chỉ
                </th>
                <th>Điện thoại
                </th>
                <th style="width: 100px">Chứng thư
                </th>
                <th style="width: 150px">Mẫu hóa đơn
                </th>
                <th style="width: 100px">Cấu hình
                </th>
                <th style="width: 60px">Menu
                </th>
                <th style="width:40px">Trạng thái</th>
                <th style="width: 30px">Sửa
                </th>
                <th style="width: 30px">Xóa
                </th>
            </tr>
        </thead>
        <tbody>
            <%    
                List<Company> comlst = Model.PageListCOM.ToList();
                int i = Model.PageListCOM.PageIndex * Model.PageListCOM.PageSize + 1;
                foreach (Company com in comlst)
                {
            %>
            <tr>
                <td><%=i%></td>
                <td><%=Html.Encode(com.Name)%></td>
                <td><%=Html.Encode(com.Email)%></td>
                <%if (string.IsNullOrEmpty(com.AccountName))
                  {%>
                <td>
                    <a href="/Account/NewAccountCom?comid=<%=com.id%>" title="CreateAndUpdate">
                        <img alt="Tạo tài khoản" src="/Content/Images/add_icon.png" />
                    </a>
                </td>
                <%}
                  else
                  { %>
                <td>
                    <a style="color:blue" href="/Account/UpdateAccountCom?comid=<%=com.id%>&accountName=<%=com.AccountName%>" title="CreateAndUpdate">
                        <%=Html.Encode(com.AccountName)%>
                    </a>
                </td>
                <%} %>
                <td><%=Html.Encode(com.Address)%></td>
                <td><%=Html.Encode(com.Phone)%></td>
                <td style="text-align: center"><a href="/Company/ViewKeyStores?Comid=<%=com.id%>" title="Chứng thư số"><img alt="Chứng thư số" src="/Content/Images/cert.png"/></a></td>
                <td style="text-align: center"><a href="/RegisterTemp/IndexRegCom?comId=<%=com.id%>" title="Đăng ký mẫu HĐ"><img alt="Đăng ký mẫu HĐ" src="/Content/Images/xml_f2.png"/></a></td>
                <td style="text-align: center"><a href="/configuration/Index?comid=<%=com.id%>" title="Tạo config"><img alt="Tạo config" src="/Content/Images/config.png"/></a></td>
                <td style="text-align: center"><a href="/Menus/Index?comid=<%=com.id%>" title="Tạo menu"><img alt="Tạo menu" src="/Content/Images/menus.png"/></a></td>
                <td style="text-align:center">
                    <img src="<%=com.Approved ? "/Content/Images/valid.png" : "/Content/Images/cross.gif" %>" title="<%=com.Approved ? "Sử dụng" :"Chưa duyệt"%>"/></td>
                <td style="text-align: center"><a href="/Company/Edit/<%=com.id%>" title="Edit">
                    <img alt="" src="/Content/Images/im-edit.jpg" /></a></td>
                <td style="text-align: center"><a href="#" onclick="OnDelete('<%=com.id%>')" title="Delete">
                    <img alt="" src="/Content/Images/no.png" /></a></td>
            </tr>
            <% i++;
                }%>
        </tbody>
    </table>
    <div class="pager">
        <%=Html.Pager(Model.PageListCOM.PageSize, Model.PageListCOM.PageIndex + 1, Model.PageListCOM.TotalItemCount, new
            {
                action = "index",
                controller = "Company",
                ComName = Model.ComName
            })%>
    </div>

    <script language="javascript" type="text/javascript">
        $(function () {
            $.ajax({
                type: "POST",
                url: "/Company/GetLstComName",
                success: function (data) {
                    $("#ComName").autocomplete({
                        source: data
                    });
                }
            });
        });
        function OnDelete(id) {
            if (!confirm("Chắc chắn xóa công ty này?"))
                return;
            document.location = "/Company/delete?id=" + id;
        }
    </script>
</asp:Content>
