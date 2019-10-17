<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<RegisterTempModels>" %>
<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<%@ Import Namespace="EInvoice.Core.Domain" %>
<link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Content/js/jquery.validate.min.js"></script>
<script src="/Content/js/jquery.bpopup.min.js"></script>
<style type="text/css">
    .skin-item {
        box-shadow: 1px 2px 6px #F2F2F2;
        margin: 0 0 20px 20px;
        overflow: hidden;
    }

    .skin-item {
        border: solid 1px #f2f2f2;
        height: 185px;
        padding: 10px;
        position: relative;
        width: 250px;
    }

    .fl {
        float: left;
    }

    .thumbnail {
        height: 185px;
        margin: 0 auto;
        overflow: hidden;
        width: 250px;
    }

    .skin-item .control {
        background: url("/Content/Images/_skinitem_hover.png") repeat scroll center center rgba(0, 0, 0, 0);
    }

    .skin-item:hover .control {
        display: block;
    }

    .skin-item .control {
        display: none;
        left: 10px;
        overflow: hidden;
        position: absolute;
        text-align: center;
        bottom: 2px;
        width: 250px;
    }

    .thumbnail img {
        height: 180px;
        width: 245px;
        border: 2px solid #cc0000;
        border-radius: 10px;
    }
</style>
<%=Html.Hidden("Id", Model.RegisTemp.Id) %>
<%=Html.Hidden("comid", Model.CurrentCom.id)%>
<div>
    <fieldset style="border: 1px solid #CCCCCC">
        <legend>1. Thông tin đơn vị phát hành</legend>
        <div style="padding: 10px 5px 10px 5px; float: left; vertical-align: bottom">
            <ol>
                <li>
                    <label for="">
                        Tên đơn vị:</label>
                    <%=Html.TextBox("Name",Model.CurrentCom.Name, new { style = "width:400px", @readonly = "readonly", @disabled = "disabled" })%>
                </li>
                <li>
                    <label for="">
                        Mã số thuế:</label>
                    <%=Html.TextBox("TaxCode",Model.CurrentCom.TaxCode, new { style = "width:150px", @readonly = "readonly", @disabled = "disabled" })%>
                </li>
                <li>
                    <label for="">
                        Địa chỉ:</label>
                    <%=Html.TextBox("Address",Model.CurrentCom.Address, new { style = "width:600px", @readonly = "readonly", @disabled = "disabled" })%>
                </li>
            </ol>
        </div>
    </fieldset>
    <fieldset style="border: 1px solid #CCCCCC">
        <legend>2. Chọn mẫu hóa đơn</legend>
        <div style="padding: 10px 5px 20px 5px; float: left; vertical-align: bottom">
            <ol>
                <li>
                    <label for="">
                        Loại hóa đơn: <span style="color: red">(*)</span></label>
                    <%=Html.DropDownList("cateId",new SelectList(Model.InvCategories,"id","Name", Model.cateId),"Loại hóa đơn",new {style="width:300px",@class = "required", title = "Chọn Category!"  })%>
                </li>
            </ol>
            <div id="temp"></div>
            <div id="src" style="display: none">
                <span class="button b-close"><span>X</span></span>
                <div id="inv" />
            </div>
        </div>
    </fieldset>
</div>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('#cateId').change(function () {
            getTemp();
        });
        getTemp();
    });

    function setImg(img, name, id) {
        var comid = $("#comid").val();
        var divData = "";
        divData += '<div class="skin-item fl">'
        divData += '<div class="thumbnail" title="' + name + '"><h2 style="z-index:1000;position: absolute;padding-top: 90px;text-align: center;width: 245px;color:red">' + name + '</h2>'
        divData += '<img src="' + img + '" alt="' + name + '" title="' + name + '" style="opacity: 0.4;filter: alpha(opacity=50);">'
        divData += '</div>'
        divData += '<div class="control">'
        divData += '<img src="/Content/Images/bt_skin_registration.png" alt="Đăng ký dùng mẫu hóa đơn" onclick="document.location=\'/Registertemp/create?comid=' + comid + '&tempid=' + id + '\'">'
        divData += '<img src="/Content/Images/bt_skin_detail.png" alt="Chi tiết" onclick="ajxCall(' + comid + ',' + id + ')">'
        divData += '</div>'
        divData += '</div>';
        $('#temp').append(divData);
    }
    function getTemp() {
        $('#temp').html("");
        if (!$("#cateId").val() || !$("#comid").val())
            return;
        var jsondata = "id=" + $("#cateId").val() + "&Companyid=" + $("#comid").val()
        $.ajax({
            type: "POST",
            url: "/RegisterTemp/ajx/",
            data: jsondata,
            success: function (data) {
                if (data.it.length > 0) {
                    for (i = 0; i < data.it.length; i++) {
                        setImg(data.it[i].ImagePath, data.it[i].TemplateName, data.it[i].Id);
                    }
                }
            }
        });
    };

    function ajxCall(comid, tempid) {
        var jsondata = "tempid=" + tempid;
        $.ajax({
            type: "POST",
            url: "/RegisterTemp/ajxPreview/",
            data: jsondata,
            success: function (data) {
                document.getElementById("inv").innerHTML = data + "<p style='z-index:9999;position: absolute;margin-bottom:5px'> <a href='/Registertemp/create?comid=" + comid + "&tempid=" + tempid + "' title='Tạo đăng ký mẫu' class='detail'><img src='/Content/Images/bt_skin_registration.png' alt='Đăng ký mẫu'></a></p>"
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
