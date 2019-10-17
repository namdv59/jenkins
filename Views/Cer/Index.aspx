<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<Certificate>>" %>

<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="FX.Utils.MvcPaging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/grid.css" rel="stylesheet" type="text/css" />
    <div class="widget-header1"><%=Resources.Einvoice.Cert_LblTitle %> </div>
    <div style="padding: 10px 5px 10px 5px; float: left; vertical-align: bottom">
        <% 
            IList<Company> listCom = (IList<Company>)ViewData["lstCom"];
            SelectList sl = new SelectList(listCom, "id", "Name", ViewData["ComId"]);
        %>
        <form id="Form1" method="post" action="/Cer/Index">

            <b style="margin: 8px">Công ty:</b>
            <%=Html.DropDownList("ComID", sl, new { style = "width:300px;margin-left: 5px" })%>
            <b><%=Resources.Einvoice.Cert_lblOwnCA %>:</b>
            <input id="ownCA" name="ownCA" type="text" style="width: 200px; margin-left: 10px; margin-right: 10px" value="<%=Html.Encode(ViewData["OwnCA"]) %>" maxlength="200" />
            <input id="btnSearch" type="submit" value="Tìm kiếm" />
        </form>
    </div>
    <div class="clear">
    </div>
    <table style="width: 100%; min-width: 800px" class="grid">
        <thead>
            <tr>
                <th width="20px">STT
                </th>
                <th width="150px">
                    <%=Resources.Einvoice.Cert_LblSerialCert%>
                </th>
                <th width="100px">
                    <%=Resources.Einvoice.Cert_LblStatus%>
                </th>
                <th width="200px">
                    <%=Resources.Einvoice.Cert_lblOwnCA%>
                </th>
                <th width="200px">
                    <%=Resources.Einvoice.Cert_LblOrgName%>
                </th>
                <th>
                    <%=Resources.Einvoice.Cert_LblExpiryDate%>
                </th>
                <th width="60px">
                    <%=Resources.Einvoice.LblDetail%>
                </th>
                <th width="30px">
                    <%=Resources.Einvoice.LblDelete%>
                </th>
            </tr>
        </thead>
        <tbody>
            <%    
                List<Certificate> Cerlst = Model.ToList();
                int i = Model.PageIndex * Model.PageSize + 1;
                foreach (Certificate Cer in Cerlst)
                {
            %>
            <tr>
                <td align="center"><%=i%></td>
                <td><%=Html.Encode(Cer.SerialCert)%></td>
                <td>
                    <%if (Cer.Used == true)
                      {%>
                    <center><%=Resources.Einvoice.Cert_lblUsingStatus%></center>
                    <%}
                      else
                      {%>
                    <center><%=Resources.Einvoice.Cert_lblUnusedStatus%></center>
                    <%} %>
                </td>
                <td><%=Html.Encode(Cer.OwnCA) %></td>
                <td><%=Html.Encode(Cer.OrganizationCA) %></td>
                <td><%= String.Format("{0:dd/MM/yyyy}",Cer.ValidTo)%></td>
                <td style="text-align: center"><a href="/Cer/Detail/<%=Cer.id%>" title="Details">
                    <img alt="" src="/Content/Images/details.png" /></a></td>
                <%if (Cer.Used == true)
                  {%>
                <td style="text-align: center">
                    <img title="Lock" alt="" src="/Content/Images/lock.png" />
                </td>
                <%}
                  else
                  {%>
                <td style="text-align: center"><a href="#" onclick="OnDelete('<%=Cer.id %>')" title="Delete">
                    <img alt="" src="/Content/Images/no.png" /></a></td>
                <%} %>
            </tr>
            <% i++;
        }%>
        </tbody>
    </table>
    <div class="pager">
        <%=Html.Pager(Model.PageSize, Model.PageIndex + 1, Model.TotalItemCount, new
            {
                action = "Index",
                controller = "Cer",
                OwnCA=ViewData["OwnCA"]
            })%>
    </div>
    <script language="javascript" type="text/javascript">
        function OnDelete(id) {
            if (!confirm("<%=Resources.Message.Cert_MesConfirmDel%>"))
                return;
            document.location = "/Cer/delete?id=" + id;
        }               
    </script>
</asp:Content>

