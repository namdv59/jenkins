<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Config>" %>
<%@ Import Namespace="EInvoice.Core.Domain" %>
<%Html.EnableClientValidation(); %>
<link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />
<style type="text/css">fieldset{margin:20px 50px 10px 50px !important}label{margin-left:50px !important;min-width:130px !important}</style>
<script type="text/javascript" src="/Content/js/jquery.validate.min.js"></script>
<%=Html.Hidden("ComID",Model.ComID)%>
<%=Html.Hidden("ID",Model.ID)%>
<div style="margin: 10px 10px 10px 10px">
<%if (Model.ID > 0)
  {%>
<h3 style="margin-top:20px;text-align:center">SỬA CẤU HÌNH</h3>
<%}
  else
  {%>
<h3 style="margin-top:20px;text-align:center">THÊM MỚI CẤU HÌNH</h3>
<%}%>
 </div>

<fieldset>
    <ol>
        <li><label>Công ty:</label><b><%=Html.Encode(ViewData["comname"])%></b></li>
        <li>
            <label for="Key">Khóa:<span style="color: red">(*)</span></label>
            <%=Html.TextBox("Key", Model.Key, new { style = "width:150px", @class = "required", title ="Nhập khóa!", maxlength="100" })%>            
        </li>
        <li>
            <label for="Value">Giá trị:<span style="color: red">(*)</span></label>
            <%=Html.TextArea("Value", Model.Value, new { style = "width:500px;height:50px", maxlength="4000"})%>
        </li>
    </ol>
</fieldset>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('form:first').validate();        
    });    
</script>
