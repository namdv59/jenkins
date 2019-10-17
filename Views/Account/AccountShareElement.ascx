<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<AccountComModel>" %>
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
        white-space: -moz-pre-wrap;
        white-space: -pre-wrap;
        white-space: -o-pre-wrap;
        word-wrap: break-word;
        max-width: 150px;
    }
</style>
<script type="text/javascript" src="/Content/js/jquery.validate.min.js"></script>
<%=Html.Hidden("userid", Model.tmpUser.userid)%>
<fieldset>
    <legend>Thông tin về tài khoản</legend>
    <ol>
        <li>
            <label for="username"><%=Resources.Einvoice.User_LblAccountName %><span style="color: red">(*)</span></label>
            <%if (Model.tmpUser.userid > 0)
              {%>
            <%=Html.Label("username", Model.tmpUser.username)%>
            <%}
              else
              { %>
            <%=Html.TextBox("username", Model.tmpUser.username, new { style = "width:200px", @class = "required", title = Resources.Einvoice.User_ReqAccountName, onblur="validText(username)", onkeyup="validText(username)"  })%>
            <%} %>
        </li>
        <li>
            <label for="password"><%=Resources.Einvoice.User_LblPassWord %> <span style="color: red">(*)</span></label>
            <%=Html.Password("password", Model.tmpUser.password, new { style = "width:200px", @class = "required", minlength = "6", title = Resources.Einvoice.User_ReqPassWord })%>
        </li>
        <li>
            <label for="RetypePassword"><%=Resources.Einvoice.User_lblRetypePass %><span style="color: red">(*)</span></label>
            <%=Html.Password("RetypePassword", Model.RetypePassword, new { style = "width:200px", @class = "required", minlength = "6", title = Resources.Einvoice.User_ReqRetypeNewPass })%>          
        </li>
        <li>
            <label for="email"><%=Resources.Einvoice.User_LblEmail %> <span style="color: red">(*)</span></label>
            <%if (Model.tmpUser.userid > 0)
              {%>
            <%=Html.Label("email", Model.tmpUser.email)%>
            <%}
              else
              { %>
            <%=Html.TextBox("email", Model.tmpUser.email, new { style = "width:200px", @class = "required email", title = Resources.Einvoice.User_MesInvalidEmail })%>
            <%} %>
        </li>
        <li>
            <label for="IsApproved"><%=Resources.Einvoice.User_LblActive %></label>
            <%=Html.CheckBox("IsApproved", Model.tmpUser.IsApproved, new { @onclick = "checkboxa()" })%>
        </li>
        <li>
            <label for="IsLockedOut"><%=Resources.Einvoice.User_LblLock %></label>
            <%=Html.CheckBox("IsLockedOut", Model.tmpUser.IsLockedOut, new { @onclick = "checkboxb()" })%>
        </li>

        <li style="border-bottom: none">
            <div style="padding: 10px 5px 5px 5px">
                <b>Quyền người dùng</b>
                <table width="100%" class="tt">
                    <tr>
                        <% 
                            int rowcount = Model.AllRoles.Length / 3;
                            int odd = Model.AllRoles.Length % 3;
                            for (int i = 0; i < rowcount; i++)
                            {          
                        %>
                    <tr>
                        <td>
                            <input type="checkbox" name="AssignRoles" value="<%= Model.AllRoles[i * 3]%>" <%= FX.Utils.Web.UI.GetChecked(Model.UserRoles.Contains(Model.AllRoles[i * 3]))%> />
                            <%=Model.AllRoles[i*3] %>
                        </td>
                        <td>
                            <input type="checkbox" name="AssignRoles" value="<%= Model.AllRoles[i * 3+1]%>" <%= FX.Utils.Web.UI.GetChecked(Model.UserRoles.Contains(Model.AllRoles[i * 3+1]))%> /><%=Model.AllRoles[i*3+1] %>
                        </td>
                        <td>
                            <input type="checkbox" name="AssignRoles" value="<%= Model.AllRoles[i * 3+2]%>" <%= FX.Utils.Web.UI.GetChecked(Model.UserRoles.Contains(Model.AllRoles[i * 3+2]))%> />
                            <%=Model.AllRoles[i*3+2] %>
                        </td>
                    </tr>
                    <%}
                            if (odd != 0)
                            { %>
                    <tr>
                        <td>
                            <input type="checkbox" name="AssignRoles" value="<%= Model.AllRoles[rowcount * 3]%>" <%= FX.Utils.Web.UI.GetChecked(Model.UserRoles.Contains(Model.AllRoles[rowcount * 3]))%>><%=Model. AllRoles[rowcount * 3]%>
                        </td>
                        <td>
                            <% if (odd > 1)
                               {%>
                            <input type="checkbox" name="AssignRoles" value="<%= Model.AllRoles[rowcount * 3 +1]%>" <%= FX.Utils.Web.UI.GetChecked(Model.UserRoles.Contains(Model.AllRoles[rowcount * 3 + 1]))%>><%= Model.AllRoles[rowcount * 3 + 1]%>
                            <%} %>
                        </td>
                        <td>
                            <% if (odd > 2)
                               {%>
                            <input type="checkbox" name="AssignRoles" value="<%= Model.AllRoles[rowcount * 3 +2 ]%>" <%= FX.Utils.Web.UI.GetChecked(Model.UserRoles.Contains(Model.AllRoles[rowcount * 3 + 2]))%>><%= Model.AllRoles[rowcount * 3 + 2]%>
                            <%} %>
                        </td>
                    </tr>
                    <%} %>
                </table>
            </div>
        </li>
    </ol>
</fieldset>
<script language="javascript" type="text/javascript">
    //Check userName AntiInjection
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
