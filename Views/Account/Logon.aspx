<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<EInvoice.SuperAdmin.Models.LogOnModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="ctl00_Head1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>Đăng nhập hệ thống
    </title>
    <script type="text/javascript" src="/Content/js/jquery.min.js"></script>
    <style type="text/css">html{margin:0;padding:0}body{font-family:Arial, Helvetica, sans-serif;font-size:9pt;margin:0;padding:0;line-height:1.3em;background:url(/Content/Images/bg_page.gif) repeat-x center top;width:100%;color:#333}#page-container{width:980px;margin:0 auto}.top_banner{background:url(/Content/Images/banner.png) no-repeat;width:980px;height:96px;margin-top:12px}.fl_r{float:right;margin-top:5px;margin-right:15px}#menucontainer{background:url(/Content/Images/nav_bg.gif) repeat-x top left;width:980px;height:35px}#main{padding:10px;background-color:#fff;overflow:hidden;min-height:320px}#footer{font-size:8pt;background:url("/Content/Images/bg_footer.gif") repeat-x scroll left top transparent;height:86px;margin:0}.copyright{padding-top:10px;width:600px}.powerby{float:right;padding-right:30px;padding-top:10px}.clear,.clr{clear:both;height:0;overflow:hidden}div.editor-label{line-height:2em}.editor-field{display:block;padding:2px}input[type="text"]{border:1px solid #CCCCCC;width:200px}input[type="password"]{border:1px solid #CCCCCC;width:200px}.validation-summary-errors{color:#FF0000;font-weight:bold}div#toolbar-box{background:#f7f7f7;margin-bottom:10px}div#element-box{background:#fff}div#element-box div.section-box div.m{background:#fbfbfb}div.t,div.b{height:6px;padding:0;margin:0;overflow:hidden}div.m{border-left:1px solid #ccc;border-right:1px solid #ccc;padding:0 8px}div#toolbar-box div.m{padding:0}div#element-box div.m{padding:5px 10px}div#element-box div.section-box div.t div.t{background:url(/Content/images/j_crn_tr_med.png) 100% 0 no-repeat}div#element-box div.section-box div.t div.t div.t{background:url(/Content/images/j_crn_tl_med.png) 0 0 no-repeat}div#element-box div.section-box div.b{background:url(/Content/images/j_border.png) 0 100% repeat-x}div#element-box div.section-box div.b div.b{background:url(/Content/images/j_crn_br_med.png) 100% 0 no-repeat}div#element-box div.section-box div.b div.b div.b{background:url(/Content/images/j_crn_bl_med.png) 0 0 no-repeat}div#element-box div.t{background:url(/Content/images/j_border.png) 0 0 repeat-x}div#element-box div.t div.t{background:url(/Content/images/j_crn_tr_light.png) 100% 0 no-repeat}div#element-box div.t div.t div.t{background:url(/Content/images/j_crn_tl_light.png) 0 0 no-repeat}div#element-box div.b{background:url(/Content/images/j_border.png) 0 100% repeat-x}div#element-box div.b div.b{background:url(/Content/images/j_crn_br_light.png) 100% 0 no-repeat}div#element-box div.b div.b div.b{background:url(/Content/images/j_crn_bl_light.png) 0 0 no-repeat}.sf-menu{margin:0}.sf-menu{float:left;margin-bottom:1em}.sf-menu{line-height:1;padding-bottom:3px;width:100%}.sf-menu,.sf-menu *{list-style:none outside none;margin:0;padding:0}.sf-menu li{float:left;position:relative}.sf-menu{line-height:1}.sf-menu,.sf-menu *{list-style:none outside none;margin:0;padding:0}.sf-menu a{display:block;position:relative}.sf-menu a{padding:.75em 1em;text-decoration:none}.sf-menu a,.sf-menu a:visited{color:#13a;font-weight:bold}.sf-menu li li a,.sf-menu li li a:visited,.sf-menu li.current li a{color:#13a;font-weight:normal}.sf-menu a:focus,.sf-menu a:hover,.sf-menu a:active,.sf-menu li.current,.sf-menu li li.current,.sf-menu li.current{background:url(/Content/Images/nav_active.gif) repeat-x;color:#fff;outline:0}.sf-menu a.sf-with-ul{padding-right:2.25em;min-width:1px}.sf-sub-indicator{position:absolute;display:block;right:.75em;top:1.05em;width:10px;height:10px;text-indent:-999em;overflow:hidden;background:url('/Content/Images/arrows-ffffff.png') no-repeat -10px -100px}a > .sf-sub-indicator{top:.8em;background-position:0 -100px}a:focus > .sf-sub-indicator,a:hover > .sf-sub-indicator,a:active > .sf-sub-indicator,li:hover > a > .sf-sub-indicator,li.sfHover > a > .sf-sub-indicator{background-position:-10px -100px}form{margin:0px;padding:0px}form .inputbox{width:120px;margin-left:10px}form br{display:none}.login{margin:10px auto;margin-bottom:100px;width:600px}h1{margin:15px 0}h1{color:#0B55C4;font-size:20px;font-weight:bold;padding-bottom:8px}p{margin:0;padding:0;margin-bottom:10px}p{line-height:1.6em;margin-bottom:10px}#lock{background:url(/Content/images/j_login_lock.jpg) 50% 0 no-repeat;width:150px;height:137px}#content-box .m{padding:10px}#content-box .padding{padding:30px 0}#section-box{float:right;width:320px;margin-left:10px}#section-box .m{padding:5px}#section-box .padding{background:none;padding:0}.button{text-align:right}.login-form{text-align:left;width:60%}.login-form h1{display:none}.login-form p{padding:0 1em 0 1em}.login-text{text-align:left;width:40%;float:left}#form-login label{display:block;float:left;width:120px;text-align:right;padding:4px;color:#666;font-weight:bold}#form-login .button_holder{float:left;padding-left:180px}#form-login div.button1{float:left}#form-login div.button1 div.next{float:left}button,input[type=reset],input[type=button],input[type=submit]{min-width:73px;background-color:#2B91AF;border-radius:10px;box-shadow:0 2px 3px rgba(0, 0, 0, 0.3);color:#FFF;cursor:pointer;display:inline-block;padding:5px 10px;text-align:center;text-decoration:none;border:1px solid #ccc;margin-right:10px}.captcha_input{direction:ltr;font-size:20px !important;height:24px;text-align:center;width:115px !important}.captcha_img{float:left;margin-right:5px}</style>    
</head>
<body>
    <div id="TemPlateContainer" runat="server" align="center">
        <div id="page-container">
            <div class="top_banner">
                <div class="fl_r">
                    [ <a href="/">Home page</a> ]

                </div>
                <div class="clear"></div>
            </div>
            <div id="menucontainer">
                <ul class="sf-menu">
                    <li><a href="#">Đăng ký</a></li>
                </ul>
            </div>
            <div id="main">
                <div class="login" id="element-box" align="left">
                    <div class="t">
                        <div class="t">
                            <div class="t"></div>
                        </div>
                    </div>
                    <div class="m">
                        <h1>Administration Login</h1>
                        <div id="section-box">
                            <div class="t">
                                <div class="t">
                                    <div class="t"></div>
                                </div>
                            </div>
                            <div class="m">
                                <% using (Html.BeginForm("LogOn", "Account", new { autocomplete = "off" }))
                                   {%>
                                <%=Html.AntiForgeryToken()%>
                                <%=Html.Hidden("ReturnUrl", Model.ReturnUrl != null ? Model.ReturnUrl : "/")%>
                                <div id="lblErrorMessage" class="validation-summary-errors"><%=Model.lblErrorMessage%></div>
                                <div>
                                    <div class="editor-label">
                                        Tên đăng nhập
                                    </div>
                                    <div class="editor-field">
                                        <%= Html.TextBox("UserName", "", new { @class = "required", title = "Nhập tài khoản!", style = "height:20px" })%>
                                    </div>

                                    <div class="editor-label">
                                        Mật khẩu
                                    </div>
                                    <div class="editor-field">
                                        <%= Html.Password("Password", "", new { @class = "required", title = "Nhập mật khẩu!", style = "height:20px", autocomplete = "off" })%>
                                    </div>

                                    <div class="editor-label">
                                        Mã xác thực
                                        <%Html.RenderPartial("Captcha", new EInvoice.SuperAdmin.Models.Captcha()); %>
                                    </div>
                                    <p style="margin-top: 10px">
                                        <input type="submit" value="Đăng nhập"/>
                                    </p>
                                </div>
                                <%} %>
                            </div>
                            <div class="b">
                                <div class="b">
                                    <div class="b"></div>
                                </div>
                            </div>
                        </div>
                        <p>Sử dụng tên đăng nhập và mật khẩu hợp lệ để truy cập vào hệ thống.</p>
                        <div id="lock"></div>
                        <div class="clr"></div>
                    </div>
                    <div class="b">
                        <div class="b">
                            <div class="b"></div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <div id="footer">
                    <div class="copyright">
                        <div>© Công ty Điện toán và Truyền số liệu (VDC)</div>
                        <div>Địa chỉ: Nhà Internet, lô IIA, làng quốc tế Thăng Long, phường Dịch Vọng, quận Cầu Giấy, Hà Nội</div>
                        <div>Tel: 84.04.37930569 Fax 84.4.379.30506 Hỗ trợ 24/24: 18001260/61/62 - Email: vdc@vdc.com.vn</div>
                    </div>
                    <div class="powerby">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">        
        $(document).ready(function () {
            $('#UserName').focus();
            $('#captch').val('');
        });
    </script>
</body>
</html>
