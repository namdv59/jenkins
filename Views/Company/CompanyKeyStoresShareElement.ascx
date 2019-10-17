<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<KeyStoresModel>" %>
<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />
<style type="text/css">fieldset{margin: 20px 0 10px 100px !important;}fieldset label{min-width: 200px !important;}</style>
<script type="text/javascript" src="/Content/js/jquery.validate.min.js"></script>
<%=Html.Hidden("Id", Model.Id) %>
<div>
    <fieldset>
        <legend>KeyStore</legend>
        <ol>
            <li>
                <label for="Type">
                    Loại keyStore <span style="color:red">(*)</span></label>
                <%=Html.DropDownList("Type",new[]
              {
                  new SelectListItem{Text="P12 KeyStore", Value="0", Selected= (Model.Type == 0)},
                  new SelectListItem{Text="JKS KeyStore", Value="1",Selected= (Model.Type == 1)},
                  new SelectListItem{Text="HSM", Value="2",Selected= (Model.Type == 2)},
                  new SelectListItem{Text="PKI Token", Value="3",Selected= (Model.Type == 3)},
                  new SelectListItem{Text="Token", Value="4",Selected= (Model.Type == 4)}
              },"Select One", new { style = "width:200px", @class = "required", title = "Chọn kiểu KeyStore!",onchange="nav()"})%>
                <a href="#" id="btnGetCert">Lấy chứng thư</a> 
            </li>
            <li id="path">
                <label for="Path">
                    Đường dẫn <span style="color:red">(*)</span></label>
                <%=Html.TextBox("Path", Model.Path, new { style = "width:374px", @class = "required", title = "Nhập mô tả cho khóa!", maxlength="200" })%>
            </li>
            <li id="pass">
                <label for="Password">
                    Mật khẩu <span style="color:red">(*)</span></label>
                <%=Html.Password("Password", Model.Password, new { style = "width:80px", @class = "required", title = "Nhập mã bảo vệ!", maxlength="64" })%>
            </li>
            <li id="serial">
                <label for="SerialCert">
                    Số serial <span style="color:red">(*)</span></label>
                <%=Html.TextBox("SerialCert", Model.SerialCert, new { style = "width:350px", @readonly = "readonly", maxlength="64"  })%>
            </li>
            <li id="keyof">
                <label for="KeyStoresOf">
                    KeyStores tại <span style="color:red">(*)</span></label>
                Server<%=Html.RadioButton("KeyStoresOf", "0", Model.KeyStoresOf == 0, new { @class="t"})%>
                Client<%=Html.RadioButton("KeyStoresOf", "1",Model.KeyStoresOf==1, new { @class="t"})%>
            </li>
        </ol>
    </fieldset>
</div>
<div>
    <fieldset style="display: none">
        <legend>Thông tin chứng thư của đơn vị phát hành</legend>
        <ol>
            <li>
                <label>
                    1. Chủ sở hữu chứng thư:</label>
                <%=Html.TextBox("OwnCA",Model.OwnCA, new { style = "width:170px", @readonly = "readonly" })%>
            </li>
            <li>
                <label>
                    2. Tên đơn vị cấp chứng thư số</label>
                <%=Html.TextBox("OrganizationCA",Model.OrganizationCA, new { style = "width:170px", @readonly = "readonly" })%>
            </li>
            <li>
                <label>
                    3. Thông tin CertNumber</label>
                <%=Html.TextBox("CertNumber", Model.CertNumber, new { style = "width:170px", @readonly = "readonly" })%>
            </li>
            <li>
                <label>
                    4. Thông tin chứng thư:</label>
                <%=Html.TextArea("Cer",Model.Cer, new {style = "width:350px; height:60px", @readonly="readonly"})%>
            </li>
            <li>
                <label>
                    5. Ngày bắt đầu</label>
                <%=Html.TextBox("ValidFrom",Model.ValidFrom, new { style = "width:170px", @readonly = "readonly" })%>
            </li>
            <li>
                <label>
                    6. Ngày hết hạn</label>
                <%=Html.TextBox("ValidTo",Model.ValidTo, new { style = "width:170px", @readonly = "readonly" })%>
            </li>
        </ol>
    </fieldset>
</div>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('#Save').attr('disabled', 'disabled');
        $('form:first').validate();
        if ($("#Type").val() == 2) {
            $("#SerialCert").removeAttr("readOnly");
            $("#path").css("display", "none");
            $("#pass").css("display", "none");
            $("#keyof").css("display", "none");
        }
        else if ($("#Type").val() == 0) {
            $("#keyof").css("display", "none");
        }
        else if ($("#Type").val() == 4) 
        {
            $("#keyof").css("display", "block");
            $("#path").css("display", "none");
            if ($('input[name=KeyStoresOf]:checked').val() == "0") {
                $("#SerialCert").removeAttr("readOnly");
                $("#pass").css("display", "block");
            }
            else {
                $('#SerialCert').attr('readOnly', true);
                $("#pass").css("display", "none");
            }
        }
        else 
        {

        }
    });
    function nav() {
        reset();
        //hsm
        if ($("#Type").val() == 2) {
            $("#SerialCert").removeAttr("readOnly");
            $("#pass").css("display", "none");
            $("#path").css("display", "none");
            $("#keyof").css("display", "none");
        }
            //p12
        else if ($("#Type").val() == 0) {
            $('#SerialCert').attr('readOnly', true);
            $("#path").css("display", "block");
            $("#pass").css("display", "block");
            $("#keyof").css("display", "none");
        }
            //token
        else if ($("#Type").val() == 4) {
            $("#keyof").css("display", "block");
            $("#path").css("display", "none");
            if ($('input[name=KeyStoresOf]:checked').val() == "0") {
                $("#SerialCert").removeAttr("readOnly");
                $("#pass").css("display", "block");
            }
            else {
                $('#SerialCert').attr('readOnly', true);
                $("#pass").css("display", "none");
            }
        }
        else{
        }
    }
    function reset() {
        $("#Path").val("");
        $("#Password").val("");
        $("#SlotIndex").val("");
        $("#SerialCert").val("");
        $("#Cer").val("");
        $("#OwnCA").val("");
        $("#OrganizationCA").val("");
        $("#ValidFrom").val("");
        $("#ValidTo").val("");
        $('#Save').attr('disabled', 'disabled');
    }
    //lay thong tin chung thu
    $("#btnGetCert").click(function () {
        if ($("#Type").val() == "4" && $('input[name=KeyStoresOf]:checked').val() == "1") {
            var app = document.getElementById("VNPTApplet");
            var s = app.showDialog();
            var serial = app.getCertSerial();
            if(serial!=null && serial !=""){
                $("#SerialCert").val(serial);
                $("#Cer").val(app.getCert(serial));
                var s=app.getCertInfo();
                $("#ValidFrom").val(s.split(',')[3]);
                $("#ValidTo").val(s.split(',')[4]);
                $("#OwnCA").val(s.split(',')[0]);
                $("#OrganizationCA").val(s.split(',')[1]);
                $("#CertNumber").val(serial);
                if (serial != null || serial != ""){
                    $("#Save").removeAttr("disabled");
                    alert("Chọn chứng thư thành công!");
                }
                else
                    $('#Save').attr('disabled', 'disabled');
            }
        }
        else {
            var jsondata = "type=" + $("#Type").val() + "&pass=" + $("#Password").val() + "&path=" + $("#Path").val() + "&serial=" + $("#SerialCert").val();
            $.ajax({
                type: "POST",
                url: "/Company/getCertificates/",
                data: jsondata,
                success: function (jsondata) {
                    if (jsondata.mess == "") {
                        $("#SerialCert").val(jsondata.serialNumber);
                        $("#Cer").val(jsondata.cer);
                        $("#OwnCA").val(jsondata.ownCA);
                        $("#OrganizationCA").val(jsondata.organizationCA);
                        $("#ValidFrom").val(jsondata.validFrom);
                        $("#ValidTo").val(jsondata.validTo);
                        $("#CertNumber").val(jsondata.serialNumber);
                        $("#Save").removeAttr("disabled");
                        alert("Chọn chứng thư thành công!")
                    }
                    else {
                        $('#Save').attr('disabled', 'disabled');
                        alert(jsondata.mess);
                    }
                }
            });
        }
    });
    var k = <%=Model.KeyStoresOf%>;
    $(function () {
        $('input.t').click(function (event) {
            if ($(this).val() == 0) {
                $("#SerialCert").removeAttr("readOnly");
                $("#pass").css("display", "block");
                if (k == 1) $('#Save').attr('disabled', 'disabled');
                k = 0;
            }
            else {
                $('#SerialCert').attr('readOnly', true);
                $("#pass").css("display", "none");
                if (k == 0) $('#Save').attr('disabled', 'disabled');
                k = 1;
            }
        })
    });
</script>
<script language="javascript" type="text/javascript">
    var _app = navigator.appName;
    if (_app == 'Microsoft Internet Explorer') {
        document.write(
              '<applet CODE="VNPTApplet" CODEBASE="." ARCHIVE="/Content/jar/VNPT_HDDT_Tool.jar" id="VNPTApplet" NAME="VNPTApplet" WIDTH="0" HEIGHT="0">',
              '	<param name="archive" value="/Content/jar/VNPT_HDDT_Tool.jar">',
              '	<param name="code" value="Applet/VNPT_CA_Applet">',
              '	<param name="mayscript" value="yes">',
              '	<param name="scriptable" value="true">',
              '	<param name="name" value="VNPT_CA_Applet">',
              '	If you see this text then Java is disabled in your browser. Please download the Sun Java Plugin from "www.sun.com".',
              '</applet>'
          );
    }
    else {
        document.write(
              '<object type="application/x-java-applet;version=1.4.1" name="VNPTApplet" id="VNPTApplet" height="0" width="0">	',
              '<param name="archive" value="/Content/jar/VNPT_HDDT_Tool.jar">',
              '<param name="code" value="Applet/VNPT_CA_Applet">',
              '<param name="mayscript" value="yes">',
              '<param name="scriptable" value="true">',
              '<param name="name" value="CA_Applet">',
              '	If you see this text then Java is disabled in your browser. Please download the Sun Java Plugin from "www.sun.com".',
              '</object>'
          );
    }
</script>