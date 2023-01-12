<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LearningAsync.aspx.cs" Inherits="Blogs" Async="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Michael Strong AJax</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="Helper_Code/meStyle.css" />
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous" />
    <link rel="stylesheet" href="Helper_Code/meStyle.css" />
    <script src="Helper_Code/meJavaScript.js"></script>
    <style>
            body {
        color: white;
    }
    </style>
</head>

<body>
    <form id="form1" runat="server">
              <!-- #include file="myheader.html" -->
        <div id="main">
            <a href="#">
                <div id="iconsize">
                    <div class="tooltip">
                        <i class="fas fa-arrow-circle-up"></i><span class="tooltiptext">scroll to top</span>
                    </div>
                </div>
            </a>
            <h1>Learning Async and Await</h1>
            <div style="margin: auto;width:900px;padding: 20px;background:rgb(124,124,124)">
               blah blah<br />
                <asp:Label ID="lblCount" runat="server" Text="Label"></asp:Label><br />
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            </div><br />
            


        </div>
    </form>

    <script type="text/javascript">
        function ShowCurrentTime() {
            <%--var name = document.getElementById("<%=txtUserName.ClientID%>").value;--%>
            var name = document.getElementById("txtUserName").value;
            var request;
            if (window.XMLHttpRequest) { // New browsers
                request = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) { // Old browsers and IE.
                 request = new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (request != null) {
                request.open("POST", "LearningAjax.aspx/GetCurrentTime", false);
                var params = "{name: '" + name + "'}";
                request.setRequestHeader("Content-Type", "application/json");
                request.onreadystatechange = function () {
                    if (request.readyState == 4 && request.status == 200) {
                        document.getElementById("Label1").innerText = JSON.parse(request.responseText).d
                    }
                };
                request.send(params);
            }
        }
    </script>
    <br /><br /><br />
</body>
</html>
