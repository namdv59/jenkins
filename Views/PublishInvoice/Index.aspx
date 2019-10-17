<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EInvoice.SuperAdmin.Models.PublishInvModels>" %>

<%@ Import Namespace="EInvoice.Core.Domain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Tình hình phát hành hóa đơn điện tử
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/grid.css" rel="stylesheet" type="text/css" />      
    <script src="/Content/js/jquery.bpopup.min.js"></script>
    <div class="widget-header1">Quản lý thông báo phát hành</div>
    <div style="padding: 10px 5px 10px 5px; float: left; vertical-align: bottom">
        <form id="Searchform" name="Searchform" method="post" action="/PublishInvoice/Index">
            <b style="margin: 8px">Công ty:</b>
            <%=Html.DropDownList("comId", new SelectList(Model.Companies, "id", "Name",Model.ComId), new { style = "width:300px;margin-left: 5px", onchange="document.Searchform.submit();"})%>
        </form>
    </div>
    <table style="width: 98%; margin-top: 10px; min-width: 800px" class="grid">
        <thead>
            <tr>
                <th width="30px">STT
                </th>
                <th width="50px">Mẫu số
                </th>
                <th width="50px">Ký hiệu
                </th>
                <th width="70px">Số lượng
                </th>
                <th width="70px">Từ số
                </th>
                <th width="70px">Đến số
                </th>
                <th width="70px">Số HĐ hiện tại
                </th>                
                <th width="70px" style="border-right-color: #EEE">Số còn lại
                </th>
                <th width="100px" style="border-right-color: #EEE">Ngày bắt đầu sử dụng
                </th>
                <th width="140px">Trạng thái</th>
                <th>Xem mẫu</th>
            </tr>
        </thead>
        <tbody>
            <%   
                IList<EInvoice.SuperAdmin.Models.PublishInv> lstpubInv = Model.PublishInvs;
                int i = 1;
                foreach (EInvoice.SuperAdmin.Models.PublishInv pubinv in lstpubInv)
                {
            %>
            <tr>
                <td align="center"><%=i%></td>
                <td><%=Html.Encode(pubinv.Pattern)%></td>
                <td><%=Html.Encode(pubinv.Serial)%></td>
                <td style="text-align: right"><%=Html.Encode(pubinv.Quantity)%></td>
                <td style="text-align: right">
                    <%=pubinv.FromNo%>
                </td>
                <td style="text-align: right">
                    <%=pubinv.ToNo%>
                </td>
                <td style="text-align: right">
                    <%=pubinv.CurrentNo%>
                </td>                
                <td style="text-align: right"><%=pubinv.Total%></td>
                <td align="center"><%=pubinv.StartDate%></td>
                <%if (pubinv.Status == 1)
                  {%>
                <td style="text-align: center">Chưa sửa dụng</td>
                <%}
                  else if (pubinv.Status == 2)
                  { %>
                <td style="text-align: center">Đang sử dụng</td>
                <%}%>
                <td><img alt="" src="/Content/Images/preview.gif" onclick="viewTemp('<%=pubinv.TempName %>')"/></td>
            </tr>
            <% i++;
                }%>
        </tbody>
    </table>

    <div id="src" style="display: none;">        
    </div>
    <script type="text/javascript">
        function viewTemp(tempName) {
            var jsondata = "tempName=" + tempName;
            $.ajax({
                type: "POST",
                url: "/InvoiceTemplate/ajxPreview/",
                data: jsondata,
                success: function (data) {
                    document.getElementById("src").innerHTML = data;
                    $(function () {
                        $('#src').bPopup({
                            easing: 'easeOutBack', //uses jQuery easing plugin
                            speed: 450,
                            transition: 'slideDown'
                        });
                    });
                }
            });
        }
    </script>
</asp:Content>
