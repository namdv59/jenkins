<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Certificate>" %>

<%@ Import Namespace="EInvoice.Core.Domain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Detail
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />
    <link href="/Content/css/redmond/jquery-ui-1.8.12.custom.css" rel="stylesheet" type="text/css" />
    <style type="text/css">fieldset{margin:20px 50px 10px 50px !important}fieldset label{float:left;margin-right:20px;min-width:300px}</style>
    <div>
        <center><b><%=Resources.Einvoice.Cert_DetailInfomation%> </b></center>
    </div>
    <div>
        <fieldset>
            <ol>

                <li>
                    <label>1. <%=Resources.Einvoice.Cert_lblOwnCA %> :</label>
                    <%=Html.Encode(Model.OwnCA) %>
                </li>
                <li>
                    <label>2. <%=Resources.Einvoice.Cert_LblSerialCert %>:</label>
                    <%=Html.Encode(Model.SerialCert) %>
                </li>
                <li>
                    <label>3. <%=Resources.Einvoice.Cert_LblOrgName %>:</label>
                    <%=Html.Encode(Model.OrganizationCA) %>
                </li>
                <li>
                    <label>4. <%=Resources.Einvoice.Cert_LblStatus %></label>
                    <%if (Model.Used == true)
                      {%>
                    <%=Resources.Einvoice.Cert_lblUsingStatus %>
                    <%}
                      else
                      {%>
                    <%=Resources.Einvoice.Cert_lblUnusedStatus %>
                    <%}%>
                </li>
                <%if (!string.IsNullOrEmpty(Model.OwnCA))
                  {%>
                <li>
                    <label>5. <%=Resources.Einvoice.Cert_ValidFrom%>:</label>
                    <%=Model.ValidFrom %>
                </li>
                <li>
                    <label>6. <%=Resources.Einvoice.Cert_LblExpiryDate%>:</label>
                    <%=Model.ValidTo %>
                </li>
                <%} %>
            </ol>
        </fieldset>
    </div>
    <div style="margin-top: 10px; margin-left: 250px">
        <input type="button" onclick="Index_Onclick()" value="<%=Resources.Einvoice.BtnBack%>" />
    </div>
    <script language="javascript" type="text/javascript">
        function Index_Onclick() {
            document.location = "/Cer/Index";
        }
    </script>
</asp:Content>
