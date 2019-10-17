<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl" xmlns="http://www.w3.org/1999/xhtml">
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
		<xsl:param name="i" select="1"/>
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
	<xsl:output method="xml" indent="yes" encoding="utf-8" version="1.0" doctype-system="about:legacy-compat" media-type=""/>
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
				<link href="/Template/InvoiceExport/style/css/style.css" rel="stylesheet" type="text/css"/>
				<title>InvoiceExport</title>
			</head>
			<body>
				<div id="printView">
					<xsl:for-each select="Invoice//Content">
            <div class="invoi_main">
              <div class="VATTEMP">
                <div class="header-main">
                  <div class="header">
                    <div class="logo">
											<img src="/Template/InvoiceExport/style/images/index.jpg" height="50" width="70"/>
										</div>
										<div class="header-content">
											<h2><xsl:value-of select="InvoiceName"/></h2>
										</div>
										<div class="header-note">
											<p>Mẫu: <strong style="font-size:larger"><xsl:value-of select="InvoicePattern"/></strong></p>
											<p>Ký hiệu: <strong style="font-size:larger"><xsl:value-of select="SerialNo"/></strong></p>
											<p>Số:
                        <xsl:call-template name="addZero">
                             <xsl:with-param name="count" select="7-string-length(InvoiceNo)"/>
                        </xsl:call-template>
                        <xsl:value-of select="InvoiceNo"/></p>
										</div>
									</div>
								</div>
								<div class="clearfix"/>
								<div class="main-content" style="margin-top:60px">
								  <div class="clearfix">
								  		<label class="fl-l">Tên đơn vị xuất khẩu:</label>
                      <label><xsl:value-of select="Publisher"/></label>               
								   </div>
									<div class="clearfix">
										  <label class="fl-l">Địa chỉ:</label>
                      <label class="fl-l" style="margin-top:10px"><xsl:value-of select="PubAddress"/></label> 
									</div>
									<div class="clearfix">
                    <label class="fl-l">Số tài khoản:</label>
                    <label class="fl-l"><xsl:value-of select="PubBankNo"/> </label>
									</div>
									<div class="clearfix">
										<label class="fl-l">Điện thoại:</label>
                    <label class="fl-l"><xsl:value-of select="PubPhone"/></label>
									</div>
									<div class="clearfix">
										<label class="fl-l">Email:</label>
                    <label class="fl-l"><xsl:value-of select="ComMail"/></label>
									</div>
							  	<div class="clearfix">
										<label class="fl-l">Mã số thuế:</label>
                    <label class="fl-l"><xsl:value-of select="PubTaxCode"/></label>
								</div>
                  <div class="clearfix" style="border-bottom:2px solid #CCC; margin-top:5px; width:600px"></div>
							 </div>
                
								<div class="clearfix"/>
								<div class="main-content">
									<div class="clearfix">
										<label class="fl-l">Tên đơn vị nhập khẩu:</label>
										<label class="fl-l input-name" style="width:488px"><xsl:value-of select="CusName"/></label>
									</div>
									<div class="clearfix">
										<label class="fl-l">Địa chỉ:</label>
										<label class="fl-l input-name" style="width:560px"><xsl:value-of select="CusAddress"/></label>
									</div>
									<div class="clearfix">
										<label class="fl-l">Số tài khoản:</label>
										<label class="fl-l input-name" style="width:200px"><xsl:value-of select="CusBankNo"/></label>
										<label class="fl-l">FAX:</label>
										<label class="fl-l input-name" style="width:300px"><xsl:value-of select="CusFax"/></label>
									</div>
									<div class="clearfix">
										<label class="fl-l">Điện thoại:</label>
										<label class="fl-l input-name" style="width:542px"><xsl:value-of select="CusPhone"/></label>
									</div>
									<div class="clearfix">
										<label class="fl-l">Hợp đồng số</label>
										<label class="fl-l input-name" style="width:200px">
											<xsl:value-of select="ContractNo"/>
										</label>
										<label class="fl-l">Ngày hợp đồng:
										</label>
										<label class="fl-l input-name" style="width:246px">
											<xsl:value-of select="ContractDate"/>
										</label>
									</div>
									<div class="clearfix">
										<label class="fl-l">Hình thức thanh toán:
										</label>
										<label class="fl-l input-name" style="width:491px">
											<xsl:value-of select="PaymentMethod"/>
										</label>
									</div>
									<div class="clearfix">
										<label class="fl-l">Địa điểm giao hàng:
										</label>
										<label class="fl-l input-name" style="width:497px;">
											<xsl:value-of select="DeliveryPlace"/>
										</label>
									</div>
									<div class="clearfix">
										<label class="fl-l">Địa điểm nhận hàng:
										</label>
										<label class="fl-l input-name" style="width:494px">
											<xsl:value-of select="ReceivingPlace"/>
										</label>
									</div>
									<div class="clearfix">
										<label class="fl-l">Tên đơn vị vận chuyển:
										</label>
										<label class="fl-l input-name" style="width:483px">
											<xsl:value-of select="Transport"/>
										</label>
									</div>
								</div>
								<div class="clearfix"/>
                <div class="statistics">
                  <table cellpadding="0" cellspacing="0" width="600px" style="border:2px solid #000; margin:0 auto; margin-left:8px">
                    <tr>
                      <th height="25px" with="30px">STT</th>
                      <th with="200px">Tên hàng hóa, dịch vụ</th>
                      <th with="100px">Đơn vị tính</th>
                      <th with="50px">Số lượng</th>
                      <th with="100px">Đơn giá</th>
                      <th with="100px" style="border-right:none">Thành tiền</th>
                    </tr>
                    <tr>
                      <th>A</th>
                      <th>B</th>
                      <th>C</th>
                      <th>1</th>
                      <th>2</th>
                      <th style="border-right:none">3=1x2</th>
                    </tr>
                    <xsl:for-each select="Products/Product">
                      <tr>
                        <td class="stt">
                          <xsl:value-of select="position()"/>
                        </td>
                        <td>
                          <xsl:value-of select="ProdName"/>
                        </td>
                        <td>
                          <xsl:value-of select="ProdUnit"/>
                        </td>
                        <td>
                          <xsl:value-of select="ProdQuantity"/>
                        </td>
                        <td>
                          <xsl:value-of select="ProdPrice"/>
                        </td>
                        <td style="border-right:none">
                          <xsl:value-of select="Amount"/>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <tr style="border-top:1px solid #000">
                      <td colspan="6">
                        <label class="fl-l" style="margin-left:5px">
                          <strong>
                            Cộng tiền bán hàng hóa, dịch vụ: <xsl:value-of select="Amount"/>
                          </strong>
                        </label>
                      </td>
                    </tr>
                    <tr style="border-top:1px solid #000">
                      <td colspan="6">
                        <label class="fl-l" style="margin-left:5px">
                          <strong>
                            Số tiền viết bằng chữ:
                            <xsl:value-of select="Amount_words"/>
                          </strong>
                        </label>
                      </td>
                    </tr>
                  </table>
                </div>
								<div class="main-content" style="margin-top:3px">
									<div class="payment fl-l">
                    <p>
                      <label>Ngày </label>
                      <label class="input-date">
                        <xsl:value-of select="substring(/Invoice/ClientData/Date,1,2)"/>
                      </label>
                      <label>tháng </label>
                      <label class="input-date">
                        <xsl:value-of select="substring(/Invoice/ClientData/Date,4,2)"/>
                      </label>
                      <label>năm 20</label>
                      <label class="input-date">
                        <xsl:value-of select="substring(/Invoice/ClientData/Date,9,2)"/>
                      </label>
                    </p>
										<p>
											<strong>Người mua hàng</strong>
										</p>
										<i>(Ký, ghi rõ họ tên)</i>
                    <p>
                      <xsl:choose>
                        <xsl:when test="imageClient != '' ">
                          <img src="{imageClient/@URI}" height="50px" width="50px"/>
                        </xsl:when>
                      </xsl:choose>
                    </p>
									</div>
									<div class="date fl-r">
                    <p>
                      <label>Ngày </label>
                      <label class="input-date">
                        <xsl:value-of select="substring(SignDate,1,2)"/>
                      </label>
                      <label>tháng </label>
                      <label class="input-date">
                        <xsl:value-of select="substring(SignDate,4,2)"/>
                      </label>
                      <label>năm 20</label>
                      <label class="input-date">
                        <xsl:value-of select="substring(SignDate,9,2)"/>
                      </label>
                    </p>
										<p>
											<strong>Người bán hàng</strong>
										</p>
										<i>(Ký, ghi rõ họ, tên)</i>
                    <p>
                      <xsl:choose>
                        <xsl:when test="image != '' ">
                          <img src="{image/@URI}" height="50px" width="50px"/>
                        </xsl:when>
                      </xsl:choose>
                    </p>
									</div>
                  <xsl:choose>
                    <xsl:when test="/Invoice/convert!=''">

                      <div class="date fl-l">
                        <p>
                          <h3>
                            <xsl:value-of select="/Invoice/convert"/>
                          </h3>
                        </p>
                        <p>
                          <label>Ngày </label>
                          <label class="input-date">
                            <xsl:value-of select="substring(/Invoice/ConvertDate,1,2)"/>
                          </label>
                          <label>tháng </label>
                          <label class="input-date">
                            <xsl:value-of select="substring(/Invoice/ConvertDate,4,2)"/>
                          </label>
                          <label>năm 20</label>
                          <label class="input-date">
                            <xsl:value-of select="substring(/Invoice/ConvertDate,9,2)"/>
                          </label>
                        </p>
                        <p>
                          <strong>Người chuyển đổi</strong>
                        </p>
                        <i>
                          ( Signature of converter )

                        </i>
                      </div>
                    </xsl:when>
                    <xsl:otherwise>

                    </xsl:otherwise>
                  </xsl:choose>
                  
									<div style="padding-top:200px; margin-left:165px"><i>(Cần kiểm tra đối chiếu khi lập, giao, nhận hóa đơn)</i>
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
