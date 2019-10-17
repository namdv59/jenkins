<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<EInvoice.Core.Domain.NavigateLink>" %>

<link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />
<style type="text/css">fieldset{margin:20px 50px 10px 50px !important}label{margin-left:50px !important;min-width:130px !important}</style>
<script type="text/javascript" src="/Content/js/jquery.validate.min.js"></script>

<%:Html.Hidden("Id",Model.Id) %>
<fieldset>
    <ol>                
        <li>
            <label for="Key">Tên hiển thị:<span style="color: red">(*)</span></label>
            <%=Html.TextBox("Name", Model.Name, new { style = "width:200px", @class = "required", maxlength="200" })%>            
        </li>
        <li>
            <label for="Value">Đường dẫn:<span style="color: red">(*)</span></label>
            <%=Html.TextBox("NavigateUrl", Model.NavigateUrl, new { style = "width:200px", @class = "required", maxlength="200"  })%>  
        </li>
        <li>
            <label for="Value">Permission Code:<span style="color: red">(*)</span></label>
            <%=Html.TextBox("PermissionCode", Model.PermissionCode, new { style = "width:200px", @class = "required", maxlength="100" })%>  
        </li> 
        <li>
            <label for="Value">Mô tả:<span style="color: red">(*)</span></label>
            <%=Html.TextBox("Sumary", Model.Sumary, new { style = "width:300px", maxlength="200" })%>  
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
    });

    function validText(e) {
        var keypressed = String.fromCharCode(e.which);
        var dbs = new Array("~", "@", "#", "$", "^", "*", ";", "|", "<", ">", "!");
        var sum = dbs.length;
        var i = 0;
        while (i < sum) {
            if (dbs[i] == keypressed)
                return false;
            i++;
        }
        return;
    }
</script>