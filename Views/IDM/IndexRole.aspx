<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<role>>" %>

<%@ Import Namespace="IdentityManagement.Domain" %>
<%@ Import Namespace="FX.Utils.MvcPaging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<link href="/Content/css/grid.css" rel="stylesheet" type="text/css" />
 <div class="widget-header1">
            Danh mục Role
  </div>
<div style="width:100%; margin-top:15px">
 <a href ="/IDM/CreateRole/" title="CreateRole"><img alt="" src="/Content/Images/add.jpg" style="float:right; margin:6px 138px 0px 0px"/></a>
</div>
<table style="width:70%; margin:0 auto; margin-top:55px; border:1px solid #999" class="grid">
    <thead>
        <tr>
            <th width="30px">
                STT
            </th>
            <th width ="150px">
              Tên Role
            </th>
            <th width = "30px">
                Sửa
            </th>
            <th width = "30px" style="border-right-color:#999">
                Xóa
            </th>
        </tr>
    </thead>

        <tbody>
            <%
                IList<role> Rolst = Model.ToList();
                int i = Model.PageIndex * Model.PageSize + 1;
                foreach (role ro in Rolst)
                {
            %>
            <tr>
                <td style="text-align: center"><%=i %></td>
                <td><%= Html.Encode(ro.name) %></td>
                <td style="text-align: center"><a href="/IDM/EditRole/<%=ro.roleid%>" title="EditRole">
                    <img alt="" src="/Content/Images/im-edit.jpg" /></a></td>
                <%string roleName = ro.name;
                  if (roleName != "Admin" && roleName != "Root" && roleName != "Printer" && roleName != "ServiceRole")
                  {%>
                <td style="text-align: center"><a href="#" onclick="OnDelete('<%=ro.roleid %>')" title="Delete">
                    <img alt="" src="/Content/Images/no.png" /></a></td>
                <%}
          else
          { %>
                <td></td>
                <%} %>
            </tr>
            <% i++;
        }%>
        </tbody>
    </table>
    <div class="pager">
        <%=Html.Pager(Model.PageSize, Model.PageIndex + 1, Model.TotalItemCount, new 
{
    action = "IndexRole",
    controller = "IDM"
}
)%>
    </div>
    <script language="javascript" type="text/javascript">
        function OnDelete(roleid) {
            if (!confirm("Bạn có chắc chắn xóa roles này không?"))
                return;
            document.location = "/IDM/DeleteRole?roleid=" + roleid;
        }        
    </script>

</asp:Content>
