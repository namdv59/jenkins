<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CompanyModel>" %>
<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<%Html.EnableClientValidation(); %>
<link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Content/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/Content/js/Share.js"></script>
<style type="text/css">
    fieldset {
        margin: 20px 0 10px 60px !important;
    }

    label {
        min-width: 220px !important;
    }

    input[readonly=readonly], #Domain {
        cursor: pointer;
        border: none;
        border-bottom: 1px dashed #ccc;
    }

    input[type=text] {
        cursor: pointer;
        border: none;
        border-bottom: 1px dashed #ccc;
    }

    select, textarea {
        background-color: #fee;
    }
</style>

<%=Html.Hidden("id", Model.tmpCompany.id) %>
<%=Html.Hidden("flag","0") %>
<%if (Model.tmpCompany.id > 0)
  { %>
<%=Html.Hidden("AccountName", Model.tmpCompany.AccountName)%>
<h3 class="readonly" style="margin-top: 20px; text-align: center">SỬA THÔNG TIN ĐƠN VỊ PHÁT HÀNH HÓA ĐƠN </h3>
<%}%>
<% else
  {
%>
<h3 style="margin-top: 20px; text-align: center">TẠO THÔNG TIN PHÁT HÀNH HÓA ĐƠN</h3>
<%}%>
<fieldset>
    <ol>
        <li>
            <label for="Name">
                1. Tên công ty <span style="color: red">(*)</span></label>
            <%=Html.TextBox("Name", Model.tmpCompany.Name, new { style = "width:600px", @class = "required", title = "Nhập tên đơn vị!",maxlength="200",PlaceHolder="Nhập không quá 200 ký tự" })%>
        </li>
        <li>
            <label for="TaxCode">
                2. Mã số thuế của công ty <span style="color: red">(*)</span></label>
            <%=Html.TextBox("TaxCode", Model.tmpCompany.TaxCode, new { style = "width:160px",maxlength="14", @class = "required ", title = "Mã số thuế của đơn vị!"})%>
            <a href="#TaxCode" onclick="checkMST(document.getElementById('TaxCode').value,'')" style="color: blue">Kiểm tra?</a>
        </li>
        <li>
            <label for="Address">
                3. Địa chỉ <span style="color: red">(*)</span></label>
            <%=Html.TextBox("Address", Model.tmpCompany.Address, new { style = "width:600px", @class = "required", title = "Nhập địa chỉ đơn vị!",maxlength="280",PlaceHolder="Nhập không quá 300 ký tự"  })%>
        </li>
        <li>
            <label for="Phone">
                4. Điện thoại</label>
            <%=Html.TextBox("Phone", Model.tmpCompany.Phone, new { style = "width:600px",maxlength="20"})%>            
        </li>
        <li>
            <label for="Fax">
                5. Số Fax</label>
            <%=Html.TextBox("Fax", Model.tmpCompany.Fax, new { style = "width:600px",maxlength="20", @class = "onlynum"})%>
        </li>
        <li>
            <label for="Email">
                6. Email <span style="color: red">(*)</span></label>
            <%=Html.TextBox("Email", Model.tmpCompany.Email, new { style = "width:600px", @class = "required email", title = "Nhập đúng định dạng mail !",maxlength="50",PlaceHolder="Nhập không quá 50 ký tự"  })%>
        </li>
        <li>
            <label for="ContactPerson">
                7. Người liên hệ</label>
            <%=Html.TextBox("ContactPerson", Model.tmpCompany.ContactPerson, new { style = "width:600px",maxlength="100"})%>
        </li>
        <li>
            <label for="RepresentPerson">
                8. Người đại diện pháp luật <span style="color: red">(*)</span></label>
            <%=Html.TextBox("RepresentPerson", Model.tmpCompany.RepresentPerson, new { style = "width:600px", @class = "required", title = "Nhập tên người đại diện pháp luật!",maxlength="100",PlaceHolder="Nhập không quá 100 ký tự"  })%>
        </li>
        <li>
            <label for="BankNumber">
                9. Số tài khoản</label>
            <%=Html.TextBox("BankNumber", Model.tmpCompany.BankNumber, new { style = "width:600px",maxlength="40" })%>
        </li>
        <li>
            <label for="BankAccountName">
                10. Chủ tài khoản</label>
            <%=Html.TextBox("BankAccountName", Model.tmpCompany.BankAccountName, new { style = "width:600px",maxlength="190" })%>
        </li>
        <li>
            <label for="BankName">
                11. Tên ngân hàng
            </label>
            <%=Html.TextBox("BankName", Model.tmpCompany.BankName, new { style = "width:600px",maxlength="140"})%>
        </li>
        <li>
            <label for="TaxAuthorityCode">
                12. Tên cơ quan thuế</label>
            <%=Html.DropDownList("TaxAuthorityCode", Model.TaxList, "---Cơ quan thuế---", new { @Style = "width:200px" })%>
        </li>
        <li>
            <label for="Descriptions">
                13. Mô tả</label>
            <%=Html.TextArea("Descriptions",Model.tmpCompany.Descriptions, new { Style = "width:600px",maxlength="300" })%>
        </li>
        <li>
            <label for="Domain">
                14. Tên miền đăng ký:</label>
            <%=Html.TextBox("SubDomain", "", new { style = "width:120px;background-color: #fee;", maxlength="80"})%>
            <b><a href="#SubDomain" style="color: blue" onclick="setDomain()" title="Đăng ký tên miền">>></a></b>
            <%=Html.TextBox("Domain", Model.tmpCompany.Domain, new { style = "width:430px;margin-left: 5px", @readonly="readonly", maxlength="200"})%>
            <img src="/Content/Images/im-edit.jpg" onclick="ddd(1)" style="display: block; float: right" id="edit" title="Chỉnh sửa thông tin" />
            <img src="/Content/Images/valid.png" onclick="ddd(2)" style="display: none; float: right" id="valid" title="Lưu sửa đổi" />
        </li>
        <li>
            <label for="SignatureImage">
                15.Ảnh chữ ký(Kích thước < 512KB)</label>
            <%
                if (!string.IsNullOrEmpty(Model.SignatureImage))
                {                                      
            %>
            <img src="<%=Model.SignatureImage%>" alt="" style="max-height: 30px; max-width: 200px" id="ImageNew" />
            <%}
            %>
            <input type="file" name="SignatureImage" id="SignatureImage" onchange="return validateFileExtension(this)" value="<%=Model.SignatureImage %>" />
        </li>
        <li>
            <label for="Descriptions">
                16. Sử dụng</label>
            <%=Html.CheckBox("Approved",Model.tmpCompany.Approved, new { style="vertical-align:middle;margin-right: 50px"})%><span style="color:#ff0000">(?Cho phép đơn vị phát hành hóa đơn)</span>
        </li>
    </ol>
</fieldset>
<script language="javascript" type="text/javascript">
    function setDomain() {
        if (!$('#SubDomain').val()) return;
        var dm = $("#Domain").val();
        dm += "(" + $('#SubDomain').val() + ")";
        $('#Domain').val(dm);
        $('#SubDomain').val("");
    }

    $('#SubDomain').keyup(function (e) {
        if (e.keyCode == 13) {
            setDomain();
        }
    });

    function ddd(id) {
        if (id == 1) {
            $("#Domain").removeAttr("readonly");
            var el = $("#Domain").get(0);
            var elemLen = el.value.length;
            el.selectionStart = elemLen;
            el.selectionEnd = elemLen;
            el.focus();
            $("#valid").css("display", "block");
            $("#edit").css("display", "none");
        }
        else {
            $("#Domain").attr("readonly", "readonly");
            $("#valid").css("display", "none");
            $("#edit").css("display", "block");
        }
    }

    //validate kich thuoc va duoi cua file
    function validateFileExtension(fld) {
        var photo = document.getElementById("SignatureImage");
        var file = photo.files[0];
        var file_lenth = file.size;
        if (file_lenth >= 512000) {
            alert("Kích thước của file này phải nhỏ hơn 512kb!");
            //fld.form.reset();
            $('#SignatureImage').attr({ value: '' });
            fld.focus();
            return false;
        }
        if (!/(\.png|\.jpg|\.jpeg)$/i.test(fld.value)) {
            alert("Kiểu file này không đúng xin vui lòng nhập lại!.");
            //fld.form.reset();
            $('#SignatureImage').attr({ value: '' });
            fld.focus();
            return false;
        }

        var reader = new FileReader();
        reader.onloadend = function () {
            $('#ImageNew').attr('src', reader.result);
        }
        reader.readAsDataURL(file);
        return true;
    }
    //Check dữ liệu Phone
    function validatePhone(txtPhone) {
        var a = document.getElementById(txtPhone).value;
        var filter = /^[0-9-+]+$/;
        if (filter.test(a)) {
            return true;
        } else {
            return false;
        }
    }
    $(document).ready(function () {        

        $("#BankNumber").keyup(function () {
            checkTextMaxLength(this);
        });
    });
</script>

