<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<user>" %>
<%@ Import Namespace="IdentityManagement.Domain" %>
<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<%Html.EnableClientValidation(); %>
<link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />

<style type="text/css">
    .tt {
        border: 1px solid #ccc;
        height: 150px;
        width: 700px;
        margin: 10px 0px 20px 0px;
        padding: 10px 0px 10px 15px;
    }

        .tt td {
            width: 33%;
        }

    table.tt td {
        white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
        white-space: -pre-wrap; /* Opera 4-6 */
        white-space: -o-pre-wrap; /* Opera 7 */
        word-wrap: break-word; /* Internet Explorer 5.5+ */
        max-width: 150px;
    }
</style>
<script type="text/javascript" src="/Content/js/jquery.validate.min.js"></script>
<%
    string[] UserRoles = ViewData["UserRoles"] as string[];   
%>
<%=Html.Hidden("userid", Model.userid)%>
<fieldset>
    <legend>Thông tin về tài khoản</legend>
    <ol>
        <%if (Model.userid > 0)
          {%>
        <li>
            <label for="username"><%=Resources.Einvoice.User_LblAccountName %><span style="color: red">(*)</span></label>
            <%=Html.Encode(Model.username)%>
            <%=Html.Hidden("username", Model.username)%>
        </li>
        <%}
          else
          {%>
        <li>
            <label for="username"><%=Resources.Einvoice.User_LblAccountName %><span style="color: red">(*)</span></label>
            <%=Html.TextBox("username", Model.username, new { style = "width:200px", @class = "required", title = Resources.Einvoice.User_ReqAccountName, maxlength="50"})%>
        </li>
        <%}%>
        <li>
            <label for="password"><%=Resources.Einvoice.User_LblPassWord %> <span style="color: red">(*)</span></label>
            <%=Html.Password("password", Model.password, new { style = "width:200px",maxlength="64",  @class = "required", minlength = "6", title = Resources.Einvoice.User_ReqPassWord })%>
        </li>
        <li>
            <label for="RetypePassword"><%=Resources.Einvoice.User_lblRetypePass %><span style="color: red">(*)</span></label>
            <%=Html.Password("RetypePassword", Model.password, new { style = "width:200px",maxlength="64",  @class = "required", minlength = "6", title = Resources.Einvoice.User_ReqRetypeNewPass })%>          
        </li>
        <%if (Model.userid > 0)
          {%>
        <li>
            <label for="email"><%=Resources.Einvoice.User_LblEmail %></label>
            <%=Html.Encode(Model.email)%>
            <%=Html.Hidden("email", Model.email)%>
        </li>
        <%}
          else
          {%>
        <li>
            <label for="email"><%=Resources.Einvoice.User_LblEmail %> <span style="color: red">(*)</span></label>
            <%=Html.TextBox("email", Model.email, new { style = "width:200px", maxlength="64", @class = "required email", title = Resources.Einvoice.User_MesInvalidEmail })%>
        </li>
        <%} %>
        <li>
            <label for="IsApproved"><%=Resources.Einvoice.User_LblActive %></label>
            <%=Html.CheckBox("IsApproved", Model.IsApproved, new { @onclick = "checkboxa()" })%>
        </li>
        <li>
            <label for="IsLockedOut"><%=Resources.Einvoice.User_LblLock %></label>
            <%=Html.CheckBox("IsLockedOut", Model.IsLockedOut, new { @onclick = "checkboxb()" })%>
        </li>

        <li style="border-bottom: none">
            <div style="padding: 10px 5px 5px 5px">
                <b>Roles</b>
                <table width="100%" class="tt">
                    <tr>
                        <td>
                            <input type="checkbox" name="AssignRoles" value="<%=ViewData["AllRoles"] %>" disabled="disabled" checked="checked" />
                            <%=ViewData["AllRoles"]%>
                        </td>
                    </tr>
                </table>
            </div>
        </li>
    </ol>
</fieldset>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('#username').keypress(function (event) {
            var keypressed = null;            
            var idName = $(this).attr('id');
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
        });

        $('form:first').validate({
            rules: {
                password: {
                    required: true,
                    minlength: 6
                },
                RetypePassword: {
                    required: true,
                    equalTo: "#password"
                }
            },
            messages: {
                password: {
                    required: "<%=Resources.Message.User_MesReqNewPass %> ",
                    minlength: $.format("<%=Resources.Message.User_MesReqMinLengthPass%>  ")
                },
                RetypePassword: {
                    required: "<%=Resources.Message.User_MesReqConfirmNewPass%> ",
                    equalTo: "<%=Resources.Message.User_MesErrConfirmPas%> "
                }
            }
        });
        if ($('#userid').val() < 1) {
            $('#username').val("");
            $('#password').val("");
            $('#RetypePassword').val('');
        }
        $("form").submit(function () {
            if ($('#username').val().indexOf(" ") >= 0 || $('#password').val().indexOf(" ") >= 0 || $('#RetypePassword').val().indexOf(" ") >= 0) {
                alert("Tài khoản hoặc mật khẩu không được chứa khoảng cách.");
                return false;
            }
        });
    });

    function checkboxa() {
        var isChecked = $('#IsApproved').is(':checked');
        if (isChecked == true) {
            $('input[name=IsApproved]').attr('checked', true);
            $('input[name=IsLockedOut]').attr('checked', false);
        }
        else {
            $('input[name=IsApproved]').attr('checked', false);
            $('input[name=IsLockedOut]').attr('checked', true);
        }
    }
    function checkboxb() {
        var isChecked = $('#IsLockedOut').is(':checked');
        if (isChecked == true) {
            $('input[name=IsApproved]').attr('checked', false);
            $('input[name=IsLockedOut]').attr('checked', true);
        }
        else {
            $('input[name=IsApproved]').attr('checked', true);
            $('input[name=IsLockedOut]').attr('checked', false);
        }
    }
</script>

