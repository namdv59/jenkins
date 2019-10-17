<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<EInvoice.SuperAdmin.Models.Captcha>" %>

<div class="editor-field">
    <img src='/Captcha/Show' alt="" class="captcha_img" />
    <%=Html.TextBoxFor(m => m.captch, new { @class = "captcha_input" })%>        
</div>