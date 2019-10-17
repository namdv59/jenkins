<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<InvCategory>" %>
<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="EInvoice.Core.IService" %>
<link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Content/js/jquery.validate.min.js"></script>
<%=Html.Hidden("id",Model.id) %>
<fieldset>
    <legend><%=Resources.Einvoice.Cat_LblInvCatInfo%> </legend>
    <ol>
        <li>
            <label for="name"><%=Resources.Einvoice.Cat_LblName%> <span style="color: red">(*)</span></label>
            <%=Html.TextBox("Name", Model.Name, new { style = "width:600px", maxlength="200", @class = "required", title =Resources.Einvoice.Cat_ReqName})%>
        </li>
        <li>
            <label for="pattern"><%=Resources.Einvoice.Cat_Pattern%> <span style="color: red">(*)</span></label>
            <%if(Model.id > 0) {%>
            <%=Html.Label(Model.InvPattern) %>
            <%}else{ %>
            <%=Html.TextBox("InvPattern", Model.InvPattern, new { style = "width:600px", maxlength="20", @class = "required", title =Resources.Einvoice.Cat_ReqPattern, onchange="$(this).val($(this).val().toUpperCase().replace(/ /g,''))"})%>
            <%} %>
        </li>
        <li>
            <label for="Description"><%=Resources.Einvoice.Cat_lblDescription%> </label>
            <%=Html.TextArea("Description", Model.Description, new { @maxlength="300", rows="4", @style="width:400px"})%>
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
        $("form").submit(function () {
            if ($('#InvPattern').val().indexOf(" ") >= 0) {
                alert("Mẫu số không được chứa khoảng cách.");
                return false;
            }
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
