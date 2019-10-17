<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<InvTemplate>" %>

<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="EInvoice.Core.IService" %>
<%@ Import Namespace="System.Linq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />
    <script src="/Content/js/jquery.bpopup.min.js"></script>
    <style type="text/css">
        fieldset li
        {
            width: 95% !important;
            margin-left: 20px;
        }

        fieldset label
        {
            min-width: 130px !important;
        }
        .word_wrap
        {            
            white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
            white-space: -pre-wrap; /* Opera 4-6 */
            white-space: -o-pre-wrap; /* Opera 7 */
            word-wrap: break-word; /* Internet Explorer 5.5+ */
        }
    </style>
    <script type="text/javascript" src="/Content/js/jquery.blockUI.js"></script>
    <script type="text/javascript" src="/Content/js/jquery.validate.min.js"></script>
    <script src="/Content/js/FXUtils.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        function ajxCall() {
            var jsondata = "tempName=" + document.getElementById("c").value;
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
    <fieldset style="width: 472px; margin-left: 200px; border: 1px solid #ccc; border-radius: 5px 5px 5px 5px">
        <div>
            <ol>
                <li>
                    <div style="margin-bottom: 10px">
                        <b style="margin-left: 120px; font-size: larger">CHI TIẾT MẪU HÓA ĐƠN</b>
                    </div>
                </li>
                <li>
                    <label for="">
                        <b>Tên loại hóa đơn:</b></label>
                    <label class="word_wrap">
                        <%=Html.Encode(Model.InvCateName) %></label>
                </li>
                <li>
                    <label for="">
                        <b>Tên Mẫu hóa đơn:</b></label>
                    <label id="tempName" class="word_wrap">
                        <%=Html.Encode(Model.TemplateName)%></label>
                    <input type="hidden" id="c" value="<%=Html.Encode(Model.TemplateName) %>" />
                </li>
                <li>
                    <label for="">
                        <b>Service Type:</b></label>
                    <label class="word_wrap">
                        <%=Html.Encode(Model.ServiceType) %></label>
                </li>
                <li>
                    <label for="">
                        <b>Invoice Type:</b></label>
                    <label class="word_wrap">
                        <%=Html.Encode(Model.InvoiceType) %></label>
                </li>
                <li>
                    <label for="">
                        <b>Invoice View:</b></label>
                    <label class="word_wrap">
                        <%=Html.Encode(Model.InvoiceView) %></label>
                </li>
                <li>
                    <label for="">
                        <b>Generator Type:</b></label>
                    <label class="word_wrap">
                        <%=Html.Encode(Model.IGenerator) %></label>
                </li>
                <li>
                    <label for="">
                        <b>View Type:</b></label>
                    <label class="word_wrap">
                        <%=Html.Encode(Model.IViewer) %></label>
                </li>
                <li>
                    <label for="">
                        <a href="#" onclick="ajxCall()" title="Preview" id="pre">
                            <img src="/Content/Images/preview.gif" alt="" style="margin-left: 355px" />
                        </a>
                    </label>
                </li>
            </ol>
            <input type="button" style="margin: 5px 0px 5px 162px" value="Quay lại" onclick="document.location = '/InvoiceTemplate/Index'" />
        </div>
        <div id="src" style="display: none">
            <span class="button b-close"><span>X</span></span>
        </div>
    </fieldset>
</asp:Content>
