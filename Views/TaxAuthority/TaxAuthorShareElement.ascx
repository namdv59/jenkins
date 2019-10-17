<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<TaxAuthority>" %>
<%@ Import Namespace="EInvoice.Core.Domain" %>
<%Html.EnableClientValidation(); %>
<link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    fieldset {
        margin: 20px 50px 10px 50px !important;
    }

    label {
        margin-left: 50px !important;
        min-width: 130px !important;
    }
</style>
<script type="text/javascript" src="/Content/js/jquery.validate.min.js"></script>
<%if (Model.Code == null)
  {%>
<h3 style="margin-top:20px;text-align:center"><%=Resources.Einvoice.Tax_CreateTitle%></h3>
<%}
  else
  {%>
<h3 style="margin-top:20px;text-align:center""><%=Resources.Einvoice.Tax_LblEditTitle%></h3>
<%}%>
<fieldset>
    <ol>
        <li>
            <%if (!string.IsNullOrWhiteSpace(Model.Code))
              {%>
            <label for="code"><%=Resources.Einvoice.Tax_LblCode%>: </label>
            <%=Html.Label(Model.Code)%>
            <%=Html.Hidden("Code", Model.Code)%>
            <%}
              else
              {%>
            <label for="code"><%=Resources.Einvoice.Tax_LblCode%>: <span style="color: red">(*)</span></label>
            <%=Html.TextBox("Code", Model.Code, new { style = "width:600px", maxlength="50", @class = "required", title = Resources.Einvoice.Tax_ReqCode, onkeypress = "return checkTaxCode(event);" })%>
            <%} %>          
        </li>
        <li>
            <label for="name"><%=Resources.Einvoice.Tax_LblName%>: <span style="color: red">(*)</span></label>
            <%=Html.TextBox("Name", Model.Name, new { style = "width:600px", maxlength="200", @class = "required", title =Resources.Einvoice.Tax_ReqName })%>            
        </li>
        <li>
            <label for="phone"><%=Resources.Einvoice.Tax_LblPhone%>:</label>
            <%=Html.TextBox("Phone", Model.Phone, new { style = "width:600px", maxlength="20", title = Resources.Einvoice.Tax_ReqPhone })%>
        </li>
        <li>
            <label for="address"><%=Resources.Einvoice.Tax_LblAddress%>: <span style="color: red">(*)</span></label>
            <%=Html.TextBox("Address", Model.Address, new { style = "width:600px", maxlength="200", @class = "required", title =Resources.Einvoice.Tax_ReqAddress })%>
        </li>
    </ol>
</fieldset>
<script type="text/javascript">
    $(document).ready(function () {
        $('form:first').validate();
        $('input[type="text"]').keypress(function (event) {
            return validText(event);
        });
        $('input[type="text"]').keyup(function (event) {
            return validText(event);
        });        
        $('#Code').change(function () {
            $(this).val($(this).val().toUpperCase());
        });
        $("form").submit(function () {            
            if (checkValid($('#Code').val()) < 1) {
                $('#Code').val("");                
                alert("Mã cơ quan thuế chỉ được nhập số hoặc chữ.");
                return false;
            }
        });
    });

    function checkValid(text) {        
        var dbs = new Array("~", "@", "#", "$", "^", "*", "|", "<", ">", "!");
        var sum = dbs.length;
        var i = 0;
        while (i < sum) {
            for (var k = 0 ; k < text.length; k++) {
                if (dbs[i] == text[k])
                    return 0;
            }
            i++;
        }
        return 1;
    }

    function validText(e) {
        var keypressed = String.fromCharCode(e.which);
        var dbs = new Array("~", "@", "#", "$", "^", "*", "|", "<", ">", "!");
        var sum = dbs.length;
        var i = 0;
        while (i < sum) {
            if (dbs[i] == keypressed)
                return false;
            i++;
        }
        return;
    }
    function checkTaxCode(e) {
        var keypressed = null;
        if (window.event) { //IE
            keypressed = window.event.keyCode;
            if (keypressed < 48
                || (keypressed > 57 && keypressed < 65)
                || (keypressed > 90 && keypressed < 97
                || keypressed > 122)) {
                return false;
            }
        }
        else {
            keypressed = e.which; //NON-IE, Standard
            if (keypressed < 48
                || (keypressed > 57 && keypressed < 65)
                || (keypressed > 90 && keypressed < 97
                || keypressed > 122)) {
                if (e.charCode == 0) {// không phải kí tự thì vẫn ok           
                    return;
                }
                return false;
            }
        }
    }
</script>
