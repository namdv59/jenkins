<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage< IPagedList<InvCategory>>" %>

<%@ Import Namespace="EInvoice.Core.Domain" %>
<%@ Import Namespace="FX.Utils.MvcPaging" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/grid.css" rel="stylesheet" type="text/css" />
    <div class="widget-header1">
        <%=Resources.Einvoice.Cat_LblTitle%>
    </div>
    <div class="clear"></div>
    <div style="padding: 0px 0px 0px 5px; float: right"><a href="/InvCategory/Create/" title="Create">
        <img alt="" src="/Content/Images/add.jpg" /></a></div>
    <table style="width: 100%; min-width: 700px;" class="grid">
        <thead>
            <tr>
                <th width="30px">
                    <%=Resources.Einvoice.Cat_lblNo%> 
                </th>
                <th width="250px">
                    <%=Resources.Einvoice.Cat_LblName%> 
                </th>
                <th width="150px">
                    <%=Resources.Einvoice.Cat_Pattern%> 
                </th>
                <th width="30px">
                    <%=Resources.Einvoice.LblEdit%> 
                </th>
                <th style="border-right-color: #EEE;width:30px">
                    <%=Resources.Einvoice.LblDelete%> 
                </th>
            </tr>
        </thead>
        <tbody>
            <%                         
                int i = (Model.PageIndex) * Model.PageSize + 1;
                foreach (InvCategory _inv in Model.ToList())
                {
            %>
            <tr>
                <td align="center"><%=i %></td>
                <td><%=Html.Encode(_inv.Name)%></td>
                <td align="center"><%=Html.Encode(_inv.InvPattern) %></td>
                <td style="text-align: center"><a href="/InvCategory/Edit/<%=_inv.id%>" title="Edit">
                    <img alt="" src="/Content/Images/im-edit.jpg" /></a></td>
                <td style="text-align: center"><a href="#" onclick="OnDelete('<%=_inv.id%>')" title="Delete">
                    <img alt="" src="/Content/Images/no.png" /></a></td>
            </tr>
            <%i++;
        }                      
            %>
        </tbody>
    </table>
    <div class="pager" id="pager">
        <%=Html.Pager(Model.PageSize, Model.PageIndex + 1, Model.TotalItemCount)%>
    </div>
    <script type="text/javascript">
        function OnDelete(id) {
            if (!confirm("<%=Resources.Message.Cat_MesConfirmDel%>"))
                return;
            document.location = "/InvCategory/delete?id=" + id;
        }

    </script>
</asp:Content>
