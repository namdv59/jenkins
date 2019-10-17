<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<EInvoice.SuperAdmin.Models.RoleModel>" %>
<%@ Import Namespace="IdentityManagement.Domain" %>
<link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    fieldset {
        margin: 20px 0 10px 300px !important;
        width: 400px;
    }
</style>
<script type="text/javascript" src="/Content/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    // chon tat ca cac checkbox
    function selectAll() {
        // xác dinh xem trang thai checkbox
        if ($('input[name=all]').is(':checked')) {
            // set selected toi tat ca cac checkbox ten permissions
            $('input[name=permissions]').attr('checked', true);
        }
        else {
            $('input[name = permissions]').attr('checked', false);
        }
    }

</script>
<%=Html.Hidden("roleid", Model.Id)%>
<div>
    <%if (Model.Id > 0)
      {%>
    <h3 style="margin-bottom: 10px; text-align: center">SỬA ROLE</h3>
    <%}
      else
      {%>
    <h3 style="margin-bottom: 10px; text-align: center">TẠO ROLE</h3>
    <%} %>

    <div id="Role_top">
        <div class="widget-header"></div>
        <label for="name">
            Tên: <span style="color: red">(*)</span></label>
        <%=Html.TextBox("name", Model.name, new { style = "width:200px", @class = "required", title = "Nhập tên mô tả!", maxlength="50"})%>
    </div>
    <!--End div Role_Top-->
    <p style="margin-top: 15px; font-weight: bold;">Chọn các permission cho role: <span style="color: red">(*)</span> </p>
    <div id="box-permission">
        <label>
            <input style="min-height: 0px;" id="all" name="all" value="" type="checkbox" onclick="selectAll();" />
            Chọn hết
        </label>
        <div class="clear"></div>

        <%
            List<permission> ListPermissions = new List<permission>();
            ListPermissions = (List<permission>)ViewData["ListPermissions"];

            foreach (var item in ListPermissions)
            {
                string lable = Resources.Permission.ResourceManager.GetString(item.name);
                if (string.IsNullOrWhiteSpace(lable)) lable = item.name;
        %>
        <label>
            <input style="min-height: 0px;" type="checkbox" name="permissions" value="<%=Html.Encode(item.name) %>" <%=FX.Utils.Web.UI.GetChecked(Model.Permissions.Contains(item))%> />
            <%=Html.Encode(lable)%>
        </label>

        <%}%>
    </div>
    <!--End div box-permission-->
</div>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('form:first').validate();
    });

</script>
