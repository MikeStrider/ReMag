<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LearningAjax.aspx.cs" Inherits="Blogs" %>

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
            <h1>Learning Ajax</h1>
            <div style="margin: auto;width:900px;padding: 20px;background:rgb(124,124,124)">
                Async Javascript and XML allows you to load in data without making the entire page reload.  2 examples being: <br /> - If a request will take some time, you do 
                not want your users to wait.  <br /> - Sometimes you only want to load a small piece of the page.<br /> It allows the website to be more dynamic, instead of button
                click and the entire page reloads.<br />
                It also allows you to get data from anywhere and return it to the one page.<br /><br />This example loads data from c# code behind, using Web Methods. The video is 
                playing to show the entire page is not reloading.
            </div><br />
            <div style="margin: auto;width:900px;padding: 20px;background:rgb(124,124,124)">
                <iframe width="100%" height="315" src="https://www.youtube.com/embed/BHACKCNDMW8?controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div><br />
          <div style="margin: auto;width:900px;padding: 20px;background:rgb(124,124,124)">
              Enter something here to send to the server. <asp:TextBox ID="txtUserName" runat="server" Width="189px"></asp:TextBox> <br />
              Do it the Ajax way. <input id="btnGetTime" type="button" value="Submit" onclick="ShowCurrentTime()" /> <br /> 
              Do it the, load entire page way. <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" /><br /><br />
              <asp:Label ID="Label1" runat="server" Text="--- This here will change. ---"></asp:Label>
          </div>


        </div>
    </form>

    <script type="text/javascript">
        function ShowCurrentTime() {
            var name = document.getElementById("<%=txtUserName.ClientID%>").value;
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
