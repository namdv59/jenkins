<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<EInvoice.Core.Domain.Menu>" %>

<link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />
<style type="text/css">fieldset{margin:20px 50px 10px 50px !important}label{margin-left:50px !important;min-width:130px !important}</style>
<script type="text/javascript" src="/Content/js/jquery.validate.min.js"></script>

<%:Html.Hidden("Id",Model.Id) %>
<%:Html.Hidden("ComID", Model.ComID) %>
<fieldset>
    <ol>
        <li><label>Công ty:</label><b><%=ViewBag.ComName%></b></li>
        <li>
            <label for="ParentId">Menu cha:</label>
            <%: Html.DropDownList("ParentId", new SelectList(ViewBag.ParentMenus, "Id", "Name", Model.ParentId), "---Menu cha---", new { style="width:250px"})%>
        </li>
        
        <li>
            <label for="Value">Đường dẫn:<span style="color: red">(*)</span></label>
            <%=Html.DropDownList("NavigateUrl", new SelectList(ViewBag.Links, "NavigateUrl", "Name", Model.NavigateUrl), "--Đường dẫn--", new { style = "width:250px", @class = "required", maxlength="200" })%>  
        </li>
        <li>
            <label for="Key">Tên hiển thị:<span style="color: red">(*)</span></label>
            <%=Html.TextBox("Name", Model.Name, new { style = "width:200px", @class = "required", title ="Nhập khóa!", maxlength="200" })%>            
        </li>
        <li>
            <label for="Value">Vị trí:<span style="color: red">(*)</span></label>
            <%=Html.TextBox("Priority", Model.Priority, new { style = "width:100px", @class = "required number", title ="Nhập khóa!", maxlength="3" })%>  
        </li>
        <li>
            <label for="Value">Sử dụng:<span style="color: red">(*)</span></label>
            <%=Html.CheckBox("IsPub", Model.IsPub)%>  
        </li>        
    </ol>
</fieldset>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('form:first').validate();
        $('input[type="text"]').keypress(function (event) {
            return validText(event);
        });
        $('input[type="text"]').keyup(function (event) {
            return validText(event);
        });
        $('#NavigateUrl').change(function () {            
            $('#Name').val($('#NavigateUrl :selected').text());
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
