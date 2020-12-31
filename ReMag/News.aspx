<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Michael Strong News</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="Helper_Code/meStyle.css" />
    <script src="Helper_Code/meJavaScript.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">

        <%-- Nav Bar Start --%>
        <nav class="navbar">
            <span class="open-slide">
                <a href="#" onclick="openSlideMenu()">
                    <svg width="30" height="30">
                        <path d="M0,5 30,5" stroke="#fff" stroke-width="5" />
                        <path d="M0,14 30,14" stroke="#fff" stroke-width="5" />
                        <path d="M0,23 30,23" stroke="#fff" stroke-width="5" />
                    </svg>
                </a>
            </span>

            <ul class="navbar-nav">
                <li><a href="index.aspx">Home</a></li>
                <li><a href="Projects.aspx">Projects</a></li>
                <li><a href="News.aspx">News</a></li>
            </ul>
            <div id="emailtopright">
                <a href="mailto:mike.strong@live.ca"><i class="far fa-envelope"></i>
                    mike.strong@live.ca</a>
            </div>
        </nav>

        <div id="side-menu" class="side-nav">
            <a href="#" class="btn-close" onclick="closeSlideMenu()">&times;</a>
            <a href="index.aspx">Home</a>
            <a href="Projects.aspx">Projects</a>
            <a href="News.aspx">News</a>
        </div>
        <%-- Nav Bar End --%>

        <h1>News</h1>

        <div id="newsFeed" style="display: flex; flex-wrap: wrap; justify-content: center;"></div>

        <script>
            var element = document.getElementById("newsFeed");
            var br = document.createElement("br");

            fetch('https://newsapi.org/v2/top-headlines?country=us&apiKey=b39cf6b4a47542d39286a5ba089a59a6')
                .then(response => response.json())
                .then(data => ProcessItems(data));

            function ProcessItems(data) {
                console.log(data)

                for (x = 0; x <= 10; x++) {
                    var secDiv = document.createElement("div");
                    var tag = document.createElement("div");
                    var text = document.createTextNode(data.articles[x].title);
                    tag.style.backgroundColor = 'rgb(124, 124, 124)';
                    tag.style.color = 'rgb(255, 255, 255)';
                    tag.style.padding = "10px";
                    tag.appendChild(text);
                    secDiv.appendChild(tag);

                    var tag = document.createElement("div");
                    var text = document.createTextNode(data.articles[x].content);
                    tag.style.backgroundColor = 'rgb(124, 124, 124)';
                    tag.style.color = 'rgb(255, 255, 255)';
                    tag.style.padding = "10px";
                    tag.appendChild(text);
                    secDiv.appendChild(tag);

                    var tag = document.createElement("div");
                    var text = document.createTextNode(" - " + data.articles[x].url);
                    tag.style.backgroundColor = 'rgb(124, 124, 124)';
                    tag.style.color = 'rgb(255, 255, 255)';
                    tag.style.padding = "10px";
                    tag.appendChild(text);
                    secDiv.appendChild(tag);

                    var br = document.createElement("br");
                    secDiv.style.width = "400px";
                    secDiv.style.padding = "15px";
                    secDiv.appendChild(br);

                    element.appendChild(secDiv);

                }
            }
        </script>



        <div>
        </div>
    </form>
</body>
</html>
