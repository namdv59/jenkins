<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Unauthorize</title>
</head>
<body>
    <div>
        <%=ViewData["Message"] as string%>
    </div>
</body>
</html>
