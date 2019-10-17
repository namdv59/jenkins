<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<InvRegistempModels>" %>

<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<%@ Import Namespace="EInvoice.Core.Domain" %>

<link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />
<link href="/Content/css/farbtastic.css" type="text/css" rel="stylesheet" />
<script src="/Content/js/jquery.bpopup.min.js"></script>
<script type="text/javascript" src="/Content/js/Share.js"></script>
<script type="text/javascript" src="/Content/js/jquery.validate.min.js"></script>
<script src="/Content/js/farbtastic.js"></script>
<style type="text/css">fieldset{margin:20px 50px 10px 50px !important}fieldset label{float:left;margin-right:0px;min-width:100px}label.error{padding:0 4px;position:absolute;background-color:#fff;line-height:22px !important;font-weight:normal !important;border:none;border-bottom:1px dashed #f00}input[type=text].error{border:none;border-bottom:1px dashed #f00}input[type=text]:focus{outline:none;border:none;border-bottom:1px dashed #000}input[type=file]{display:none;visibility:hidden}input[readonly=readonly]{cursor:pointer;border:none;border-bottom:1px dashed #ccc}textarea{min-height:55px;background-color:#fee}.textr{text-align:right}.textc{text-align:center}.widget-header{margin-top:3px;text-align:center;padding-bottom:7px}.frm-header{margin:0;padding:0;overflow:hidden}div.line{padding:3px 0;overflow:hidden}div.line > div.control{overflow:hidden;padding-left:7px}div.line > div.control input{width:100%;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box}
</style>
<form enctype="multipart/form-data" method="post">
    <div class="widget-header">
        Cấu hình thông tin cho mẫu hóa đơn
    </div>
    <% 
        int action = ViewData["action"] == null ? 0 : (int)ViewData["action"];
        string previewContent = ViewData["previewContent"] == null ? "" : (string)ViewData["previewContent"];        
    %>
    <%=Html.Hidden("actName", "")%>
    <%=Html.Hidden("Change", Model.Change)%>
    <%=Html.Hidden("ac", action)%>
    <%=Html.Hidden("pc", previewContent)%>
    <%=Html.Hidden("tempId", Model.tempId)%>
    <%=Html.Hidden("ComId", Model.CurrentCom.id)%>
    <%=Html.Hidden("Id", Model.RegisTemp.Id)%>
    <%=Html.Hidden("InvCateID", Model.RegisTemp.InvCateID)%>
    <%=Html.Hidden("IsCertify", Model.RegisTemp.IsCertify)%>
    <%=Html.Hidden("Back", Model.Back)%>
    <%string dpl = Model.Change ? "display:block" : "display:none";
      string dlpcl = Model.Change && Model.RegisTemp.Id == 0 ? "display:block" : "display:none";
      string provider = Model.RegisTemp.IsCertify ? "display:block" : "display:none";%>
    <fieldset>
        <legend>Thông tin đơn vị phát hành</legend>
        <ol>
            <li>
                <label>Đơn vị phát hành:</label>
                <%: Html.TextBox("ComName", Model.CurrentCom.Name, new { style="width:80%",@readonly="readonly"})%>
            </li>
            <li>
                <%: Html.Label("ComTaxcode", labelText: "Mã số thuế:") %>
                <%: Html.TextBox("TaxCom", Model.CurrentCom.TaxCode, new { style="width:80%", @readonly="readonly" })%>
            </li>
            <li>
                <%: Html.Label("addressCom", labelText:"Địa chỉ:") %>
                <%: Html.TextBox("addressCom", Model.CurrentCom.Address, new {style="width:80%",@readonly="readonly"})%>                    
            </li>
        </ol>
    </fieldset>
    <fieldset>
        <legend>Thông tin về mẫu</legend>
        <ol>
            <li>
                <label>Tên đăng ký mẫu:</label>
                <%: Html.TextBox("Name", Model.RegisTemp.Name, new { style="width:300px", @required = "required", maxlength = "50"})%>
            </li>
            <li>
                <%: Html.Label("NameInv", labelText: "Tên hóa đơn:") %>
                <%: Html.TextBox("NameInvoice", Model.RegisTemp.NameInvoice, new { @required = "required", style="width:300px", maxlength = "150" })%>
            </li>
            <li>
                <%: Html.LabelFor(m => m.RegisTemp.InvPattern, labelText: "Mẫu số:") %>
                <%if (Model.RegisTemp.Id > 0)
                  {%>
                <%= Html.TextBox("InvPattern", Model.RegisTemp.InvPattern, new { @style="width:100px",@readonly="readonly", MaxLength = "50"})%>
                <%}
                  else
                  { %>
                <%: Html.TextBox("InvPattern", Model.RegisTemp.InvPattern, new { @style="width:60px", @readonly="readonly"})%>   
                    Liên HĐ:<%: Html.TextBox("InterPattern", "0", new {@style="width: 25px;",@maxlength = "1", @required = "Number", onkeypress = "return keypress(event);" })%>/   
                    STT Mẫu:<%: Html.TextBox("PatternOrder", Model.RegisTemp.PatternOrder, new {@style="width:43px;" ,@maxlength = "3", onblur = "validateOrder(event)"})%>
                <span style="color: red">(Ví dụ: 01GTKT2/001)</span>
                <%} %>
            </li>
            
            <li style="<%=dpl%>">
                <%: Html.Label("LogoCss", "Ảnh logo:") %>
                <div class="control">
                    <input type="file" name="logoImg" id="_logoAttackment" accept=".png,.jpg,.gif,.icon" />
                    <input type="text" name="_logoFile" value="<%=Model._logoFile %>" id="_logoFile" style="width: 500px; border: none; border-bottom: 1px dashed #ccc;" readonly="readonly" placeholder="Nhấn chuột vào đây để đính kèm logo công ty (png, jpg, gif, icon)..." />
                </div>
            </li>
            <li style="<%=dpl%>">
                <%: Html.Label("ImgCss", "Ảnh nền:") %>
                <div class="control">
                    <input type="file" name="bgrImg" id="_imgAttackment" accept=".png,.jpg,.gif" />
                    <input type="text" name="_imgFile" id="_imgFile" value="<%=Model._imgFile%>" style="width: 500px; border: none; border-bottom: 1px dashed #ccc;" readonly="readonly" placeholder="Nhấn chuột vào đây để đính kèm ảnh nền hóa đơn (png, jpg, gif)..." />
                </div>
            </li>           
            <li style="<%=dlpcl%>">
                <label for="color">Màu nền:</label>
                <%=Html.Hidden("Color", Model.Color) %>
                <%:Html.TextBox("CssColor", Model.CssColor ?? "#123456", new { style = "width:350px;", maxlength="30" })%>
                <div id="picker" style="float: right;"></div>
            </li>           
            <li style="<%=dpl%>">
                <%: Html.Label("CssData", "Chỉnh sửa css:") %>                              
            </li> 
            <li style="<%=dpl%>">
                <%:Html.TextArea("CssData",Model.RegisTemp.CssData , new { style = "width:100%;", rows = 8}) %>  
            </li>
            <%if(Model.RegisTemp.IsCertify) {%>            
            <li>
                <%: Html.Label("ICertifyProvider", "Xác thực thuế:") %>
                <%:Html.DropDownList("ICertifyProvider", new[] 
              {
                  new SelectListItem{Text="Xác thực hóa đơn khi phát hành", Value="EInvoice.Services.Launching.TaxCertifyProvider", Selected= (Model.RegisTemp.ICertifyProvider == "EInvoice.Services.Launching.TaxCertifyProvider")},
                  new SelectListItem{Text="Xác thực hóa đơn sau khi phát hành", Value="EInvoice.Services.Launching.AgentCertifyProvider", Selected= (Model.RegisTemp.ICertifyProvider == "EInvoice.Services.Launching.AgentCertifyProvider")}                  
              }, new { style = "width:450px;"})%>                
            </li>    
            <%} %>           
            <li>
                <a href="#" onclick="preview()" title="Preview" id="prv">
                    <img src="/Content/Images/preview.gif" alt="" style="margin: 10px 0px 0px 45px" />
                </a>
            </li>
        </ol>
    </fieldset>
    <div class="textc">
        <input type="submit" class="button" value="Lưu mẫu" onclick="return validateForm();" />
        <%if (Model.Back == 0 && Model.RegisTemp.Id > 0)
          {%>
        <input type="button" value="Quay lại" onclick="document.location='/RegisterTemp/Index?comId=<%=Model.CurrentCom.id %>'" />
        <%}
          else
          {%>
        <input type="button" value="Quay lại" onclick="document.location = '/RegisterTemp/IndexRegCom?comId=<%=Model.CurrentCom.id %>'" />
        <%} %>
    </div>
</form>
<div id="src" title="Mẫu hóa đơn điện tử" style="display: none;">
    <span class="button b-close"><span>X</span></span>
    <div id="inv"></div>
</div>
<script type="text/javascript">
    function pad(number, length) {
        var str = "" + number;
        while (str.length < length) {
            str = "0" + str
        }
        return str
    }
    function validateOrder(ev) {
        var flag = false;
        $("#PatternOrder").val(pad($("#PatternOrder").val(), 3));
        if (isNaN($("#PatternOrder").val())) {
            alert("Pattern Order phải là số!");
            setTimeout("$('#PatternOrder').focus();", 0);
            $("#PatternOrder").focus();
            $("#PatternOrder").select();
            return
        }
        if (parseInt($("#PatternOrder").val(), 10) <= 0 || parseFloat($("#PatternOrder").val()) % 1 != 0) {
            alert("Pattern Order phải nguyên dương!");
            setTimeout("$('#PatternOrder').focus();", 0);
            $("#PatternOrder").focus();
            $("#PatternOrder").select();
            return
        }
    }
    function keypress(e) {
        var keypressed = null;
        if (window.event) {
            keypressed = window.event.keyCode;
        } else {
            keypressed = e.which;
        }
        if (keypressed < 48 || keypressed > 57) {
            if (keypressed == 8 || keypressed == 127) {
                return
            }
            return false
        }
    }
    $(document).ready(function () {
        $("input[type=text]:first").focus();        
        $("#_logoFile").click(function () {
            $("#_logoAttackment").trigger("click")
        }).keypress(function (e) {
            if (e.keyCode == 13 || e.which == 13) {
                $(this).trigger("click");
                return false
            }
        });
        $("#_imgFile").click(function () {
            $("#_imgAttackment").trigger("click")
        }).keypress(function (e) {
            if (e.keyCode == 13 || e.which == 13) {
                $(this).trigger("click");
                return false
            }
        });
        $("#_logoAttackment").change(function () {
            var _file = $(this)[0].files[0];
            if (_file) {
                var _extl = [
                    "png", "jpg", "gif", "icon"
                ];
                var _ext = _file.name.substring(_file.name.lastIndexOf(".") + 1);
                if (_extl.indexOf(_ext) > -1) {
                    $("#_logoFile").val(_file.name)
                } else {
                    $(this).val("");
                    alert("Xin lỗi, định dạng file đính kèm không được chấp nhận.")
                }
            } else {
                $("#_logoFile").val("")
            }
        });
        $("#_imgAttackment").change(function () {
            var _file = $(this)[0].files[0];
            if (_file) {
                var _extl = [
                    "png", "jpg", "gif"
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
        $("#PatternOrder").val(pad($("#PatternOrder").val(), 3));
        $("#actName").val("sub");
        if ($("#pc").val() != "") {
            document.getElementById("inv").innerHTML = $("#pc").val();
            $(function () {
                $("#src").bPopup({
                    easing: "easeOutBack",
                    speed: 450,
                    transition: "slideDown"
                })
            })
        }
        $("#picker").farbtastic("#CssColor")
    });
    function validateForm() {
        updateColor()
    }
    function updateColor() {
        var color = $("#CssColor").val();
        if (color == "#123456") {
            $("#Color").val("");
            return
        }
        color = ".VATTEMP,#printView{background-color:" + color + " !important;}";
        $("#Color").val(color);
        $("#IsPreview").val(true)
    }
    function preview() {
        $("#actName").val("preview");
        updateColor();
        document.forms[0].submit()
    }
</script>
