<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<InvTemplate>" %>
<%@ Import Namespace="EInvoice.Core.Domain" %>

<link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/farbtastic.css" type="text/css" rel="stylesheet" />
<script src="/Content/js/jquery.bpopup.min.js"></script>
<script type="text/javascript" src="/Content/js/Share.js"></script>
<script type="text/javascript" src="/Content/js/jquery.validate.min.js"></script>
<script src="/Content/js/jquery.PrintArea.js"></script>
<script src="/Content/js/farbtastic.js"></script>
<style type="text/css">
    fieldset {
        margin: 20px 50px 10px 50px !important;
    }

        fieldset label {
            float: left;
            margin-right: 0px;
            min-width: 150px;
        }

    label.error {
        padding: 0 4px;
        position: absolute;
        background-color: #fff;
        line-height: 22px !important;
        font-weight: normal !important;
        border: none;
        border-bottom: 1px dashed #f00;
    }

    input[type=text].error {
        border: none;
        border-bottom: 1px dashed #f00;
    }

    input[type=text]:focus {
        outline: none;
        border: none;
        border-bottom: 1px dashed #000;
    }

    input[type=file] {
        display: none;
        visibility: hidden;
    }

    input[readonly=readonly] {
        cursor: pointer;
        border: none;
        border-bottom: 1px dashed #ccc;
    }

    textarea {
        min-height: 55px;
        background-color: #fee;
    }

    .textr {
        text-align: right;
    }

    .textc {
        text-align: center;
    }

    .widget-header {
        margin-top: 3px;
        text-align: center;
        padding-bottom: 7px;
    }

    .frm-header {
        margin: 0;
        padding: 0;
        overflow: hidden;
    }

    div.line {
        padding: 3px 0;
        overflow: hidden;
    }

        div.line > div.control {
            overflow: hidden;
            padding-left: 7px;
        }

            div.line > div.control input {
                width: 100%;
                -moz-box-sizing: border-box;
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
            }
</style>
<form enctype="multipart/form-data" method="post">
    <%=Html.Hidden("Id", Model.Id)%>
    <%=Html.Hidden("ImagePath", Model.ImagePath) %>
    <%=Html.Hidden("actName", "")%>
    <% 
        int action = ViewData["action"] == null ? 0 : (int)ViewData["action"];
        string previewContent = ViewData["previewContent"] == null ? "" : (string)ViewData["previewContent"];
    %>
    <%=Html.Hidden("ac", action)%>
    <%=Html.Hidden("pc", previewContent)%>    
    <div class="widget-header">
        Cấu hình thông tin cho mẫu hóa đơn
    </div>
    <fieldset>
        <legend>Thông tin về mẫu hóa đơn</legend>
        <ol>
            <li>
                <label><b>Loại hóa đơn:<span style="color: red">(*)</span></b></label>
                <%: Html.DropDownList("InvCateID",(SelectList)ViewData["lstInvCate"], "---Loại hóa đơn---", new { style = "width:327px;display:none", @required = "required", title = "Chọn loại hóa đơn!" })%>
                <%: Html.TextBox("InvCateName", Model.InvCateName, new { style = "width:327px;display:none",@readonly="readonly", maxlength= "200" })%>
            </li>
            <li>
                <label for="templateName"><b><%=Resources.Einvoice.Temp_tempName%>: <span style="color: red">(*)</span></b></label>
                <%if(Model.Id > 0) {%>
                <%=Html.Label("TemplateName", Model.TemplateName) %>
                <%=Html.Hidden("TemplateName", Model.TemplateName) %>
                <%}else{ %>
                <%: Html.TextBox("TemplateName",Model.TemplateName, new { style = "width:327px", maxlength= "50", @required = "required textandnum", title = Resources.Einvoice.Temp_ReqName, onblur = "checkTempName($('#TemplateName').val())" })%>
                <%} %>
            </li>
            <li>
                <label for="ImageTemp">Ảnh mẫu(<512KB):</label>
                <div class="control">
                    <input type="file" name="ImageTemp" id="_imgAttackment" accept=".png,.jpg,.gif,.icon" />
                    <input type="text" name="_imgFile" value="<%=Html.Encode((string)ViewBag._ImgFile) %>" id="_imgFile" style="width: 500px; border: none; border-bottom: 1px dashed #ccc;" <%=ViewBag._ImgFile == null ? "readonly='readonly'"  : ""%> placeholder="Nhấn chuột vào đây để đính kèm ảnh mẫu(png, jpg, gif, icon)..." />
                </div>
            </li>
            <li>
                <label for="xml"><b><%=Resources.Einvoice.Temp_LblXMLFile%>: <span style="color: red">(*)</span></b></label>
                <div class="control">
                    <input type="file" name="xml" id="_xmlAttackment" accept=".xml" onchange="TestFileType(this,'xml','xmlCon','XmlFile')" />
                    <input type="text" name="_xmlFile" value="<%=Html.Encode((string)ViewBag._xmlFile) %>" id="_xmlFile" style="width: 500px; border: none; border-bottom: 1px dashed #ccc;" <%=ViewBag._xmlFile == null ? "readonly='readonly'"  : ""%> placeholder="Nhấn chuột vào đây để đính kèm xml(xml)..." required="required" />
                </div>
            </li>
            <li>
                <label for="xsltFile"><b><%=Resources.Einvoice.Temp_LblXSLTFile%>: <span style="color: red">(*)</span></b></label>
                <div class="control">
                    <input type="file" name="xslt" id="_xsltAttackment" accept=".xslt" onchange="TestFileType(this,'xslt','xsltCon','XsltFile')" />
                    <input type="text" name="_xsltFile" value="<%=Html.Encode((string)ViewBag._xsltFile) %>" id="_xsltFile" style="width: 500px; border: none; border-bottom: 1px dashed #ccc;" <%=ViewBag._xsltFile == null ? "readonly='readonly'"  : ""%> placeholder="Nhấn chuột vào đây để đính kèm xslt(xslt)..." required="required" />
                </div>
            </li>
            <li>
                <label for="schemaFile">
                    <b><%=Resources.Einvoice.Temp_LblSchemaFile%>: <span style="color: red">(*)</span></b></label>
                <div class="control">
                    <input type="file" name="xsd" id="_xsdAttackment" accept=".xsd" onchange="TestFileType(this,'xsd','xsdCon','SchemaFile')" />
                    <input type="text" name="_xsdFile" value="<%=Html.Encode((string)ViewBag._xsdFile) %>" <%=ViewBag._xsdFile == null ? "readonly='readonly'"  : ""%> id="_xsdFile" style="width: 500px; border: none; border-bottom: 1px dashed #ccc;" placeholder="Nhấn chuột vào đây để đính kèm xsd(xsd)..." required="required" />
                </div>
            </li>
            <li>
                <%: Html.Label("CssData", "Dữ liệu css:") %>                 
            </li>
            <li>
                <%:Html.TextArea("CssData",Model.CssData , new { style = "width:100%;", rows = 8}) %>
            </li>
            <li>
                <%: Html.Label("LogoCss", "Css Logo:") %>                   
            </li>
            <li>
                <%: Html.TextArea("CssLogo", Model.CssLogo, new { style = "width:100%;", rows = 5 })%>
            </li>
            <li>
                <%: Html.Label("ImgCss", "Css Background:") %>
            </li>
            <li>
                <%: Html.TextArea("CssBackgr", Model.CssBackgr, new { style = "width:100%;", rows = 5  })%>
            </li>
            <li>
                <label for="serType">Service Type: <span style="color: red">(*)</span></label>
                <%: Html.TextBox("ServiceType",Model.ServiceType, new { style = "width:327px", @required = "required", title = "Nhập service type", maxlength= "200"})%>
            </li>
            <li>
                <label for="invType">Invoice Type: <span style="color: red">(*)</span></label>
                <%: Html.TextBox("InvoiceType",Model.InvoiceType, new { style = "width:327px", @required = "required", title = "Nhập invoice type", maxlength= "200"})%>
            </li>
            <li>
                <label for="invView">Invoice View: <span style="color: red">(*)</span></label>
                <%: Html.TextBox("InvoiceView",Model.InvoiceView, new { style = "width:327px", @required = "required", title = "Nhập invoice view", maxlength= "200"})%>
            </li>
            <li>
                <label for="generatorType">Generator Type: <span style="color: red">(*)</span></label>
                <%: Html.TextBox("IGenerator", Model.IGenerator, new { style = "width:327px", @required = "required", title = "Nhập Generator Type", maxlength= "200" })%>
            </li>
            <li>
                <label for="IViewer">IViewer: <span style="color: red">(*)</span></label>
                <%: Html.TextBox("IViewer", Model.IViewer, new { style = "width:327px", @required = "required", title = "Nhập View Type", maxlength= "200" })%>
            </li>
            <li>
                <label for="IViewer">Xác thực thuế:</label>
                <%: Html.CheckBox("IsCertify", Model.IsCertify)%>
            </li>
            <li id="pre" style="display: none">
                <a href="#" onclick="test()" title="Preview" id="prv">
                    <img src="/Content/Images/preview.gif" alt="" style="margin: 10px 0px 0px 45px" />
                </a>
            </li>
        </ol>
    </fieldset>
    <div class="textc">
        <input id="Submit1" type="submit" value="Lưu dữ liệu" runat="server" />
        <input type="button" style="width: 60px" value="<%=Resources.Einvoice.BtnBack%>"
            onclick="document.location = '/InvoiceTemplate/Index'" />
    </div>
</form>

<div id="src" title="Mẫu hóa đơn điện tử" style="display: none;">    
    <div id="inv"></div>
    <div id="inbt"></div>
</div>
<script type="text/javascript">
    function printInvoice() {
        $("#inbt").css("display", "none");
        var printElement = document.getElementById("inv");
        $(printElement).printArea({
            mode: "iframe",
            popWd: 1000,
            popHt: 900,
            popClose: false
        });
        $("#inbt").css("display", "block");
        return (false);
    }
    $(document).ready(function () {
        $("input[type=text]:first").focus();
        $("#actName").val("sub");
        if ($("#pc").val() != "") {
            document.getElementById("inv").innerHTML = $("#pc").val();
            document.getElementById("inbt").innerHTML += "<button value='Print' class='button' name='Print' onclick=\"printInvoice();\">In mẫu hóa đơn</button>";            
            $(function () {
                $("#src").bPopup({
                    easing: "easeOutBack",
                    speed: 450,
                    transition: "slideDown"
                })
            })
        }
        $("#TemplateName").change(function () {
            $(this).val($(this).val().toUpperCase())
        });
        if ($("#ac").val() != 0) {
            document.getElementById("InvCateName").style.display = "block"
        } else {
            document.getElementById("InvCateID").style.display = "block"
        }
        $("#_imgFile").click(function () {
            $("#_imgAttackment").trigger("click")
        }).keypress(function (e) {
            if (e.keyCode == 13 || e.which == 13) {
                $(this).trigger("click");
                return false
            }
        });
        $("#_xmlFile").click(function () {
            $("#_xmlAttackment").trigger("click");
        }).keypress(function (e) {
            if (e.keyCode == 13 || e.which == 13) {
                $(this).trigger("click");
                return false
            }
        });
        $("#_xsltFile").click(function () {
            $("#_xsltAttackment").trigger("click")
        }).keypress(function (e) {
            if (e.keyCode == 13 || e.which == 13) {
                $(this).trigger("click");
                return false
            }
        });
        $("#_xsdFile").click(function () {
            $("#_xsdAttackment").trigger("click")
        }).keypress(function (e) {
            if (e.keyCode == 13 || e.which == 13) {
                $(this).trigger("click");
                return false
            }
        });
        $("#_xsltAttackment").change(function () {
            var _file = $(this)[0].files[0];
            if (_file) {
                var _extl = ["xslt"];
                var _ext = _file.name.substring(_file.name.lastIndexOf(".") + 1);
                if (_extl.indexOf(_ext) > -1) {
                    $("#_xsltFile").val(_file.name);
                    $("#_xsltFile").attr("readonly", true);
                } else {
                    $(this).val("");
                    alert("Xin lỗi, định dạng file đính kèm không được chấp nhận.")
                }
            } else {
                $("#_xsltFile").val("");
            }
        });
        $("#_xsdAttackment").change(function () {
            var _file = $(this)[0].files[0];
            if (_file) {
                var _extl = ["xsd"];
                var _ext = _file.name.substring(_file.name.lastIndexOf(".") + 1);
                if (_extl.indexOf(_ext) > -1) {
                    $("#_xsdFile").val(_file.name);
                    $("#_xsdFile").attr("readonly", true);
                } else {
                    $(this).val("");
                    alert("Xin lỗi, định dạng file đính kèm không được chấp nhận.")
                }
            } else {
                $("#_xsdFile").val("")
            }
        });
        $("#_xmlAttackment").change(function () {
            var _file = $(this)[0].files[0];
            if (_file) {
                var _extl = ["xml"];
                var _ext = _file.name.substring(_file.name.lastIndexOf(".") + 1);
                if (_extl.indexOf(_ext) > -1) {
                    $("#_xmlFile").attr("readonly", false);
                    $("#_xmlFile").val(_file.name);
                    $("#_xmlFile").attr("readonly", true);
                } else {
                    $(this).val("");
                    alert("Xin lỗi, định dạng file đính kèm không được chấp nhận.")
                }
            } else {
                $("#_xmlFile").val("")
            }
        });
        $("#_imgAttackment").change(function () {
            var _file = $(this)[0].files[0];
            if (_file) {
                var _extl = [
                    "png", "jpg", "gif", "icon"
                ];
                var _ext = _file.name.substring(_file.name.lastIndexOf(".") + 1);
                if (_extl.indexOf(_ext) > -1) {
                    $("#_imgFile").val(_file.name)
                } else {
                    $(this).val("");
                    alert("Xin lỗi, định dạng file đính kèm không được chấp nhận.")
                }
            } else {
                $("#_imgFile").val("")
            }
        });
        preview();
    });
    function preview() {        
        if ($("#_xsdFile").val() && $("#_xsltFile").val() && $("#_xmlFile").val())
            document.getElementById("pre").style.display = "block";
        else
            document.getElementById("pre").style.display = "none";
    };
    function checkTempName(tempName) {
        var jsondata = "tempName=" + tempName;
        $.ajax({
            data: jsondata,
            success: function (data) {
                if (!data) {
                    alert("<%=Resources.Message.Temp_MesConfluentNameTemp%>");
                    $("#TemplateName").val("")
                }
            },
            type: "POST",
            url: "/InvoiceTemplate/ajxCheckTempName/"
        })
    }
    function test() {
        $("#actName").val("preview");
        document.forms[0].submit()
    }
    function TestFileType(fileName, rfileType, fileInputContainer, fileTextID) {
        if (fileName.value == "")
            return;
        $("#_xsltFile").attr("readonly", false);
        $("#_xsdFile").attr("readonly", false);
        $("#_xmlFile").attr("readonly", false);
        dots = fileName.value.split(".");
        fileType = dots[dots.length - 1];
        $("#" + fileTextID).val(fileName.value);
        if (fileType != rfileType) {
            alert("<%=Resources.Message.Temp_MesWrongFormat %> " + rfileType + "!");
            var parent = document.getElementById(fileInputContainer);
            newFileInput = document.createElement("input");
            parent.removeChild(document.getElementById(rfileType));
            newFileInput.setAttribute("type", "file");
            newFileInput.setAttribute("id", rfileType);
            newFileInput.setAttribute("size", 37);
            newFileInput.setAttribute("title", "Chọn file " + rfileType);
            newFileInput.setAttribute("name", rfileType);
            parent.appendChild(newFileInput);
            newFileInput.addEventListener("change", function () {
                TestFileType(this, rfileType, fileInputContainer, fileTextID)
            }, false);
            $("#" + fileTextID).val("")
        }
        if (rfileType == "xml") {
            var _xmlName = $("#_xmlAttackment").val().substring($("#_xmlAttackment").val().lastIndexOf("\\") + 1);
            $("#_xmlFile").val(_xmlName);
        }
        if (rfileType == "xsd") {
            var _xsdName = $("#_xsdAttackment").val().substring($("#_xsdAttackment").val().lastIndexOf("\\") + 1);
            $("#_xsdFile").val(_xsdName);
        }
        if (rfileType == "xslt") {
            var _xsltName = $("#_xsltAttackment").val().substring($("#_xsltAttackment").val().lastIndexOf("\\") + 1);
            $("#_xsltFile").val(_xsltName);
        }
        $("#_xsltFile").attr("readonly", true);
        $("#_xsdFile").attr("readonly", true);
        $("#_xmlFile").attr("readonly", true);
        preview();
    }
</script>
