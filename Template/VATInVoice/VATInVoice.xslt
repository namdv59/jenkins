<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl" xmlns="http://www.w3.org/1999/xhtml"
>

  <xsl:template name="addZero">
    <xsl:param name="count"/>
    <xsl:if test="$count > 0">
      <xsl:text>0</xsl:text>
      <xsl:call-template name="addZero">
        <xsl:with-param name="count" select="$count - 1"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="addDots">
    <xsl:param name="val"/>
    <xsl:param name="val1"/>
    <xsl:param name="val2"/>
    <xsl:param name="i" select="1"></xsl:param>
    <xsl:if test="$val1>0">
      <xsl:choose>
        <xsl:when test="$val2 !=0">
          <xsl:value-of select="substring($val,$i,$val2)"/>
          <xsl:if test="substring($val,$i+$val2+1,1) !=''">
            <xsl:text>.</xsl:text>
          </xsl:if>
          <xsl:call-template name="addDots">
            <xsl:with-param name="val" select="$val"/>
            <xsl:with-param name="val1" select="$val1 - 1"/>
            <xsl:with-param name="i" select="$i + $val2"/>
            <xsl:with-param name="val2" select="3"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <!--<xsl:text>test</xsl:text>-->
          <xsl:value-of select="substring($val,$i,3)"/>
          <xsl:if test="substring($val,$i+3,1) !=''">
            <xsl:text>.</xsl:text>
          </xsl:if>
          <xsl:call-template name="addDots">
            <xsl:with-param name="val" select="$val"/>
            <xsl:with-param name="val1" select="$val1 - 1"/>
            <xsl:with-param name="i" select="$i + 3"/>
            <xsl:with-param name="val2" select="3"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template name="addLine">
    <xsl:param name="count"/>
    <xsl:if test="$count > 0">
      <tr class="noline back">
        <td class="stt">
          <xsl:value-of select="''"/>
        </td>
        <td>
          <xsl:value-of select="''"/>
        </td>
        <td class="back-bold">
          <xsl:value-of select="''"/>
        </td>
        <td class="back-bold">
          <xsl:value-of select="''"/>
        </td>
        <td class="back-bold">
          <xsl:value-of select="''"/>
        </td>
        <td class="back-bold">
          <xsl:value-of select="''"/>
        </td>
      </tr>
      <xsl:call-template name="addLine">
        <xsl:with-param name="count" select="$count - 1"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <!--<link href="file:///D:\hddt\src\EInvoice.Admin\Template\VATInVoice\style\css\styles.css" type="text/css" rel="stylesheet" />-->
        <link href="http://vdcitadmin.e-invoice.vn/Template/VATInVoice/style/css/styles.css" type="text/css" rel="stylesheet" />
        <title>VAT</title>
      </head>

      <body>
        <div id="printView">
          <xsl:for-each select="Invoice//Content">

            <div class = "VATTEMP">
              <div class="header-main" style="padding-left:10px">
                <h1 id="logo">
                  <!--<img src="logo.png" alt=""/>-->
                  <img src="http://vdcitadmin.e-invoice.vn/Template/VATInVoice/style/images/logo.png" alt=""/>
                </h1>
                <div class="header">
                  <div class="header-content">
                    <h2>
                      <xsl:value-of select="InvoiceName"/>
                    </h2>
                    <p class="name-upcase">Telecommunication service invoice (VAT)</p>
                  </div>
                  <div class="header-note">
                    <p>
                      Mẫu số: <strong>
                        <xsl:value-of select="InvoicePattern"/>
                      </strong>
                    </p>
                    <p>
                      <b>Ký hiệu </b><i>(Serial No)</i>: <strong>
                        <xsl:value-of select="SerialNo"/>
                      </strong>
                    </p>
                    <p style="margin-top:5px;">
                      <b>Số </b> <i>(No)</i>: <span class="number">
                        <xsl:call-template name="addZero">
                          <xsl:with-param name="count" select="7-string-length(InvoiceNo)"/>
                        </xsl:call-template>
                        <xsl:value-of select="InvoiceNo" />
                      </span>
                    </p>
                  </div>
                </div>
              </div>
              <div class="clearfix"></div>
              <div style="padding-left:10px">
                <div class="">
                  <label class="fl-l">
                    <strong>Mã số thuế:</strong>
                  </label>
                  <!--//string-length(ComTaxCode) substring(str,indexstart,number)-->
                  <label class="input-code" maxlength="1" style="margin-right:0px;" >
                    <xsl:value-of select="substring(ComTaxCode,1,1)"/>
                  </label>
                  <label class="input-code" style="margin-right:5px;"  maxlength="1">
                    <xsl:value-of select="substring(ComTaxCode,2,1)"/>
                  </label>
                  <label class="input-code" maxlength="1" style="margin-right:0px;" >
                    <xsl:value-of select="substring(ComTaxCode,3,1)"/>
                  </label>
                  <label class="input-code" maxlength="1" style="margin-right:0px;" >
                    <xsl:value-of select="substring(ComTaxCode,4,1)"/>
                  </label>
                  <label class="input-code" maxlength="1" style="margin-right:0px;" >
                    <xsl:value-of select="substring(ComTaxCode,5,1)"/>
                  </label>
                  <label class="input-code" maxlength="1" style="margin-right:0px;" >
                    <xsl:value-of select="substring(ComTaxCode,6,1)"/>
                  </label>
                  <label class="input-code" maxlength="1" style="margin-right:0px;" >
                    <xsl:value-of select="substring(ComTaxCode,7,1)"/>
                  </label>
                  <label class="input-code" maxlength="1" style="margin-right:0px;" >
                    <xsl:value-of select="substring(ComTaxCode,8,1)"/>
                  </label>
                  <label class="input-code" style="margin-right:5px;"  maxlength="1">
                    <xsl:value-of select="substring(ComTaxCode,9,1)"/>
                  </label>
                  <label class="input-code" maxlength="1" style="margin-right:5px;" >
                    <xsl:value-of select="substring(ComTaxCode,10,1)"/>
                  </label>
                  <label class="input-code" maxlength="1" style="margin-right:0px;" >
                    <xsl:value-of select="substring(ComTaxCode,11,1)"/>
                  </label>
                  <label class="input-code" maxlength="1" style="margin-right:0px;" >
                    <xsl:value-of select="substring(ComTaxCode,12,1)"/>
                  </label>
                  <label class="input-code" maxlength="1" style="margin-right:5px;" >
                    <xsl:value-of select="substring(ComTaxCode,13,1)"/>
                  </label>
                  <label class="input-code" maxlength="1" style="margin-right:0px;" >
                    <xsl:value-of select="substring(ComTaxCode,14,1)"/>
                  </label>
                </div>
                <div class="clearfix" style="padding-top:5px">
                  Đơn vị: <xsl:value-of select="ComName"/>
                </div>
                <div class="clearfix">
                  <label class="fl-l">Địa chỉ:</label>
                  <xsl:choose>
                    <xsl:when test="ComAddress!=''">
                      <label class="fl-l input-name" style="width:680px;">
                        <xsl:value-of select="ComAddress"/>
                      </label>
                    </xsl:when>
                    <xsl:otherwise>
                      <label class="fl-l input-name" style="width:680px;height:12px">
                        <xsl:value-of select="ComAddress"/>
                      </label>
                    </xsl:otherwise>
                  </xsl:choose>

                </div>
                <div class="clearfix">
                  <label class="fl-l">Tên khách hàng (Customer's name):</label>
                  <xsl:choose>
                    <xsl:when test="CusName!=''">
                      <label class="fl-l input-name" style="width:548px">
                        <xsl:value-of select="CusName"/>
                      </label>
                    </xsl:when>
                    <xsl:otherwise>
                      <label class="fl-l input-name" style="width:548px;height:12px">
                        <xsl:value-of select="CusName"/>
                      </label>
                    </xsl:otherwise>
                  </xsl:choose>
                </div>
                <div class="clearfix">
                  <label class="fl-l">Địa chỉ (Address):</label>
                  <xsl:choose>
                    <xsl:when test="CusAddress!=''">
                      <label class="fl-l input-name" style="width:636px">
                        <xsl:value-of select="CusAddress"/>
                      </label>
                    </xsl:when>
                    <xsl:otherwise>
                      <label class="fl-l input-name" style="width:636px;height:12px">
                        <xsl:value-of select="CusAddress"/>
                      </label>
                    </xsl:otherwise>
                  </xsl:choose>
                </div>
                <div class="clearfix">
                  <label class="fl-l">Số điện thoại (Tel):</label>
                  <xsl:choose>
                    <xsl:when test="CusPhone!=''">
                      <label class="fl-l input-name" style="width:200px;">
                        <xsl:value-of select="CusPhone"/>
                      </label>
                    </xsl:when>
                    <xsl:otherwise>
                      <label class="fl-l input-name" style="width:200px; height:12px">
                        <xsl:value-of select="CusPhone"/>
                      </label>
                    </xsl:otherwise>
                  </xsl:choose>

                  <label class="fl-l">Mã số (Code):</label>
                  <xsl:choose>
                    <xsl:when test="CusCode!=''">
                      <label class="fl-l input-name" style="width:350px;">
                        <center>
                          <xsl:value-of select="CusCode"/>
                        </center>
                      </label>
                    </xsl:when>
                    <xsl:otherwise>
                      <label class="fl-l input-name" style="width:350px;height:12px">
                        <center>
                          <xsl:value-of select="CusCode"/>
                        </center>
                      </label>
                    </xsl:otherwise>
                  </xsl:choose>

                </div>
                <div class="clearfix">
                  <label class="fl-l">Hình thức thanh toán (Kind of Payment):</label>
                  <xsl:choose>
                    <xsl:when test="Kind_of_Payment!=''">
                      <label class="fl-l input-name" style="width:200px;">
                        <center>
                          <xsl:value-of select="Kind_of_Payment"/>
                        </center>
                      </label>
                    </xsl:when>
                    <xsl:otherwise>
                      <label class="fl-l input-name" style="width:200px;height:12px">
                        <center>
                          <xsl:value-of select="Kind_of_Payment"/>
                        </center>
                      </label>
                    </xsl:otherwise>
                  </xsl:choose>

                  <label class="fl-l">
                    <strong>MST:</strong>
                  </label>
                  <label class="input-code black" style="margin-right:0px;" maxlength="1" type="text" name="">
                    <xsl:value-of select="substring(CusTaxCode,1,1)"/>
                  </label>
                  <label class="input-code black" style="margin-right:5px;" maxlength="1" type="text" name="">
                    <xsl:value-of select="substring(CusTaxCode,2,1)"/>
                  </label>
                  <label class="input-code black" style="margin-right:0px;" maxlength="1" type="text" name="">
                    <xsl:value-of select="substring(CusTaxCode,3,1)"/>
                  </label>
                  <label class="input-code black" style="margin-right:0px;" maxlength="1" type="text" name="">
                    <xsl:value-of select="substring(CusTaxCode,4,1)"/>
                  </label>
                  <label class="input-code black" style="margin-right:0px;" maxlength="1" type="text" name="">
                    <xsl:value-of select="substring(CusTaxCode,5,1)"/>
                  </label>
                  <label class="input-code black" style="margin-right:0px;" maxlength="1" type="text" name="">
                    <xsl:value-of select="substring(CusTaxCode,6,1)"/>
                  </label>
                  <label class="input-code black" style="margin-right:0px;" maxlength="1" type="text" name="">
                    <xsl:value-of select="substring(CusTaxCode,7,1)"/>
                  </label>
                  <label class="input-code black" style="margin-right:0px;" maxlength="1" type="text" name="">
                    <xsl:value-of select="substring(CusTaxCode,8,1)"/>
                  </label>
                  <label class="input-code black" style="margin-right:5px;" maxlength="1" type="text" name="">
                    <xsl:value-of select="substring(CusTaxCode,9,1)"/>
                  </label>
                  <label class="input-code black" style="margin-right:5px;" maxlength="1" type="text" name="">
                    <xsl:value-of select="substring(CusTaxCode,10,1)"/>
                  </label>
                  <label class="input-code black" style="margin-right:0px;" maxlength="1" type="text" name="">
                    <xsl:value-of select="substring(CusTaxCode,11,1)"/>
                  </label>
                  <label class="input-code black" style="margin-right:0px;" maxlength="1" type="text" name="">
                    <xsl:value-of select="substring(CusTaxCode,12,1)"/>
                  </label>
                  <label class="input-code black" style="margin-right:5px;" maxlength="1" type="text" name="">
                    <xsl:value-of select="substring(CusTaxCode,13,1)"/>
                  </label>
                  <label class="input-code black" style="margin-right:0px;" maxlength="1" type="text" name="">
                    <xsl:value-of select="substring(CusTaxCode,14,1)"/>
                  </label>
                </div>


                <div class="statistics">
                  <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tbody>
                      <tr>
                        <th>STT (NO)</th>
                        <th>
                          Dịch vụ sử dụng (Kind of Service) <label style="width:50px;font-size:8px;color:black;text-transform:none">
                            <xsl:value-of select="KindOfService"/>
                          </label>
                        </th>
                        <th>ĐVT (Unit)</th>
                        <th>Số lượng (Quantity)</th>
                        <th>Đơn giá (Price)</th>
                        <th>Thành tiền (Amount) VNĐ</th>
                      </tr>
                      <tr>
                        <th>1</th>
                        <th>2</th>
                        <th>3</th>
                        <th>4</th>
                        <th>5</th>
                        <th>6=4x5</th>
                      </tr>


                      <xsl:for-each select="Products//Product">
                        <tr class="noline back">
                          <td class="stt">
                            <xsl:value-of select="position()"/>
                          </td>
                          <td>
                            <xsl:value-of select="ProdName"/>
                          </td>
                          <td class="back-bold">
                            <xsl:value-of select="ProdUnit"/>
                          </td>
                          <td class="back-bold">
                            <xsl:choose>
                              <xsl:when test="(ProdQuantity=0) or(ProdQuantity='')">
                                <xsl:value-of select="''"></xsl:value-of>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="translate(translate(translate(format-number(ProdQuantity, '###,###'),',','?'),'.',','),'?','.')"/>
                              </xsl:otherwise>
                            </xsl:choose>
                          </td>
                          <td class="back-bold">
                            <xsl:choose>
                              <xsl:when test="(ProdPrice=0) or(ProdPrice='')">
                                <xsl:value-of select="''"></xsl:value-of>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="translate(translate(translate(format-number(ProdPrice, '###,###'),',','?'),'.',','),'?','.')"/>
                              </xsl:otherwise>
                            </xsl:choose>
                          </td>
                          <td class="back-bold">
                            <xsl:choose>
                              <xsl:when test="(Amount=0) or(Amount='')">
                                <xsl:value-of select="''"></xsl:value-of>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="translate(translate(translate(format-number(Amount, '###,###'),',','?'),'.',','),'?','.')"/>
                              </xsl:otherwise>
                            </xsl:choose>
                          </td>
                        </tr>
                      </xsl:for-each>
                      <xsl:if test="count(Product) &lt; 5">
                        <xsl:call-template name="addLine">
                          <xsl:with-param name="count" select="(5-count(Product))+20"/>
                        </xsl:call-template>
                      </xsl:if>


                      <tr class="bg-pink">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                      <tr class="bg-pink">
                        <td colspan="5" style="padding-right:100px">
                          <b style="font-size:11px"><i>Cộng tiền dịch vụ (Total) (1):</i></b>
                        </td>
                        <td class="back-bold" align="center">
                          <xsl:choose>
                            <xsl:when test="Total = ''">
                              <xsl:value-of select="''"/>
                            </xsl:when>
                            <xsl:when test="Total mod 1 != 0">
                              <xsl:value-of select="translate(translate(translate(format-number(Total, '###,###.##'),',','?'),'.',','),'?','.')"/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="translate(translate(translate(format-number(Total, '###,###'),',','?'),'.',','),'?','.')"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <tr class="bg-pink">
                        <td colspan="5" style="padding-right:100px">
                          <xsl:choose>
                            <xsl:when test="VAT_Rate='X'">
                              <b style="font-size:11px">
                                <i>Thuế suất GTGT (VAT rate):</i> &#160;&#160; X &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>Tiền thuế GTGT (VAT amount) (2):</i>
                              </b>
                            </xsl:when>
                            <xsl:when test="VAT_Rate=''">
                              <b style="font-size:11px">
                                <i>Thuế suất GTGT (VAT rate):</i> &#160;&#160; % x(1)= &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>Tiền thuế GTGT (VAT amount) (2):</i>
                              </b>
                            </xsl:when>
                            <xsl:otherwise>
                              <b style="font-size:11px">
                                <i>Thuế suất GTGT (VAT rate):</i> &#160;&#160;<xsl:value-of select="VAT_Rate"></xsl:value-of>% x(1)= &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<i>Tiền thuế GTGT (VAT amount) (2):</i>
                              </b>
                            </xsl:otherwise>
                          </xsl:choose>

                        </td>
                        <td class="back-bold">
                          <xsl:choose>
                            <xsl:when test="(VAT_Amount=0) or (VAT_Rate='X') or(VAT_Rate='')">
                              <xsl:value-of select="''"></xsl:value-of>
                            </xsl:when>

                            <xsl:otherwise>
                              <xsl:value-of select="translate(translate(translate(format-number(VAT_Amount, '###,###'),',','?'),'.',','),'?','.')"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                      </tr>
                      <tr class="bg-pink">
                        <td colspan="5" style="padding-right:100px">
                          <b style="font-size:11px"><i>Tổng cộng tiền thanh toán (Grand total) (1+2):</i></b>
                        </td>
                        <td class="back-bold">
                          <xsl:choose>
                            <xsl:when test="Amount=''">
                              <xsl:value-of select="''"></xsl:value-of>
                            </xsl:when>

                            <xsl:otherwise>
                              <xsl:value-of select="translate(translate(translate(format-number(Amount, '###,###'),',','?'),'.',','),'?','.')"/>
                            </xsl:otherwise>
                          </xsl:choose>

                        </td>
                      </tr>
                    </tbody>
                  </table>

                  <div>
                    <label class="fl-l">Số tiền viết bằng chữ (In words)*:</label>
                    <xsl:choose>
                      <xsl:when test="Amount_words!=''">
                        <label class="fl-l input-name" style="width:556px;">
                          <xsl:value-of select="Amount_words"/>
                        </label>
                      </xsl:when>
                      <xsl:otherwise>
                        <label class="fl-l input-name" style="width:556px;height:12px">
                          <xsl:value-of select="Amount_words"/>
                        </label>
                      </xsl:otherwise>
                    </xsl:choose>

                  </div>
                  <div class="clearfix">
                    <div class="payment fl-l">
                      <p style="font-size:12px; margin:0px">Người mua hàng</p>
                      <br/>
                      <p style="font-size:12px; margin:0px">
                        <xsl:choose>
                          <xsl:when test="/Invoice/imageClient != '' ">
                            <img src="{/Invoice/imageClient/@URI}" height="50px" width="50px"/>
                          </xsl:when>
                        </xsl:choose>
                      </p>
                    </div>
                    <div class="date fl-r">
                      <p style="font-size:12px; margin:0px">
                        <xsl:choose>
                          <xsl:when test="SignDate!= '' ">
                            Ngày  <b style="color:#000">
                              <xsl:value-of select="substring(SignDate,1,2)"/>
                            </b> tháng  <b style="color:#000">
                              <xsl:value-of select="substring(SignDate,4,2)"/>
                            </b> năm
                            <b style="color:#000">
                              <xsl:value-of select="concat('20',substring(SignDate,9,2))"/>
                            </b>
                          </xsl:when>
                          <xsl:otherwise>
                            Ngày  &#160;&#160;<b style="color:#000">
                              <xsl:value-of select="substring(SignDate,1,2)"/>
                            </b> tháng  &#160;&#160;<b style="color:#000">
                              <xsl:value-of select="substring(SignDate,4,2)"/>
                            </b> năm
                          </xsl:otherwise>
                        </xsl:choose>


                      </p>
                      <p style="font-size:12px; margin:0px">Đơn vị bán hàng</p>
                      <br/>
                      <p style="font-size:12px; margin:0px">
                        <xsl:choose>
                          <xsl:when test="/Invoice/image != '' ">
                            <img src="{/Invoice/image/@URI}" height="50px" width="50px"/>
                            <br/>
                            <br/>
                            <p style="font-size:12px; margin:0px">
                              Kí bởi <xsl:value-of select="ComName"/>
                            </p>
                          </xsl:when>
                        </xsl:choose>
                      </p>

                    </div>
                    <div class="clearfix"></div>


                    <xsl:choose>
                      <xsl:when test="/Invoice/isReplace!=''">
                        <div style="text-align:center;padding-top:30px;font-size:larger;text-transform:uppercase">
                          <xsl:value-of select="//Invoice/isReplace"/>
                        </div>
                      </xsl:when>
                    </xsl:choose>

                    <xsl:choose>
                      <xsl:when test="/Invoice/convert!=''">
                        <div style="text-align:center;padding-top:30px">
                          <div>
                            <h3 style="font-size:12px">
                              <b>
                                <xsl:value-of select="/Invoice/convert"/>
                              </b>
                            </h3>
                            <p style="font-size:12px; margin:0px">
                              Ngày <b style="color:#000">
                                <xsl:value-of select="substring(/Invoice/ConvertDate,1,2)"/>
                              </b> tháng <b style="color:#000">
                                <xsl:value-of select="substring(/Invoice/ConvertDate,4,2)"/>
                              </b> năm <b style="color:#000">

                                <xsl:value-of select="concat('20',substring(/Invoice/ConvertDate,9,2))"/>
                              </b>
                            </p>
                            <p style="font-size:12px; margin:0px">
                              Người chuyển đổi
                            </p>
                            <i>
                              ( Signature of converter )
                            </i>
                          </div>
                        </div>
                      </xsl:when>
                    </xsl:choose>

                  </div>
                </div>
              </div>
            </div>

          </xsl:for-each>
        </div>
      </body>


    </html>

  </xsl:template>

</xsl:stylesheet>
