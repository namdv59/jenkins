<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ViewKeyStoresModel>" %>

<%@ Import Namespace="EInvoice.SuperAdmin.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    DetailCurrent
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/css/SharedFormElements.css" rel="stylesheet" type="text/css" />
    <style type="text/css">fieldset label{min-width:150px !important}.infstore{border:1px solid #ccc;margin:0 auto;width:500px;border-radius:5px;padding:0px 0px 10px 25px}</style>
    <div style="margin: 20px 50px 20px 100px">
        <div class="widget-header1" style="border-bottom: none">
            Thông tin KeyStore
        </div> 
        <fieldset class="infstore">
            <%
                if (Model.Id <= 0)
                { %>
                  <h4>Bạn chưa cập nhật thông tin KeyStore.Vui lòng click vào tạo mới để cập nhật thông tin.</h4>
               <%}
                else
                {
            %>
            <ol>
            <%if (Model.Type == 0)
              {%>
              <li>
                   <label>Loại KeyStore:</label>P12 KeyStore
             </li>
            <%}
              else if (Model.Type == 1)
              {%>
                 <li>
                     <label>Loại keyStore:</label> JKS KeyStore
                 </li>
            <%}
              else if (Model.Type == 2)
              {%>
                  <li>
                     <label>Loại keyStore:</label> HSM
                  </li>
            <%}
              else if (Model.Type == 3)
              { %>
                 <li>
                     <label>Loại keyStore:</label> PKI Token
                 </li>
            <%}
              else if (Model.Type == 4)
              {%>
                 <li>
                     <label>Loại keyStore:</label> Token
                 </li>
            <%}%>
               <li>
                  <label>Số chứng thư:</label><%=Html.Encode(Model.SerialCert)%>
              </li>
              <li>
                  <label>Tên chủ sở hữu:</label><%=Html.Encode(Model.OwnCA)%>
              </li>
              <li>
                  <label>Ngày bắt đầu sử dụng:</label><%=Model.ValidFrom.ToString("dd/MM/yyyy")%>
              </li>
              <li>
                  <label>Ngày hết hạn:</label><%=Model.ValidTo.ToString("dd/MM/yyyy")%>
              </li>
            </ol>
            <%} %>
        </fieldset>
        <div style="margin-top: 10px; margin-left: 350px">
             <%if (Model.Id > 0)
               {%>
                     <input type="button" onclick="Edit_Onclick(<%=Model.Id%>)" value="Chỉnh sửa" />
               <%}
               else
               { %>
                     <input type="button" onclick="Create_Onclick(<%=Model.Comid%>)" value="Tạo mới" />
               <%} %>
             <input type="button" value="Quay lại" style="margin-left:20px; width:60px;" onclick="document.location = '/Company/index'" />
        </div>
    </div>
    <script language="javascript" type="text/javascript">
        function Edit_Onclick(id) {
            document.location = "/Company/EditKeyStores?id=" + id;
        }
        function Create_Onclick(comid) {
            document.location = "/Company/CreateKeyStores?comID=" + comid;
        }
    </script>
</asp:Content>
