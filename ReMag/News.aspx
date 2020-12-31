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
                <li><a href="Random.aspx">Random Things</a></li>
            </ul>
            <div id="emailtopright">
                <a href="mailto:mike.strong@live.ca"><i class="far fa-envelope"></i>mike.strong@live.ca</a>
            </div>
        </nav>

        <div id="side-menu" class="side-nav">
            <a href="#" class="btn-close" onclick="closeSlideMenu()">&times;</a>
            <a href="index.aspx">Home</a>
            <a href="Projects.aspx">Projects</a>
            <a href="News.aspx">News</a>
            <a href="Random.aspx">Random Things</a>
        </div>
        <%-- Nav Bar End --%>

        <div id="main">

            <a href="#">
                <div id="iconsize">
                    <div class="tooltip">
                        <i class="fas fa-arrow-circle-up"></i><span class="tooltiptext">scroll to top</span>
                    </div>
                </div>
            </a>

            <h1>News</h1>
            <h2 style="font-size: 14px; font-weight: 400;">source - <a href="https://newsapi.org" style='color:rgb(255, 255, 255);'>https://newsapi.org</a></h2>

            <div style="text-align: center; color:rgb(255, 255, 255);">
                Search for something specfic <input id="txtSearch" type="text" value="" runat="server"/> <button>Go</button>
            </div>
            
            <div style="text-align: center; padding-top:5px; color:rgb(255, 255, 255);"> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('Transportation')">Transportation</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('Health')">Health</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('Tech')">Tech</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('World')">World</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('Politics')">Politics</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('Canada')">Canada</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('United States')">United States</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('Business')">Business</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('Sports')">Sports</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('Hockey')">Hockey</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('Football')">Football</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('Science')">Science</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('Entertainment')">Entertainment</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('Music')">Music</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('Movies')">Movies</a> / 
                <a style='color:rgb(255, 255, 255);' href="#" onclick="newsGroups('TV')">TV</a> / 
            </div>

            <div id="newsFeed" style="display: flex; flex-wrap: wrap; justify-content: center;"></div>

            <script>
                var element = document.getElementById("newsFeed");
                var br = document.createElement("br");

                if (txtSearch.value == "") {
                    fetch('https://newsapi.org/v2/top-headlines?country=us&apiKey=b39cf6b4a47542d39286a5ba089a59a6')
                        .then(response => response.json())
                        .then(data => ProcessItems(data));
                } else {
                    fetch('https://newsapi.org/v2/everything?q=' + txtSearch.value + '&apiKey=b39cf6b4a47542d39286a5ba089a59a6')
                        .then(response => response.json())
                        .then(data => ProcessItems(data));
                }

                function ProcessItems(data) {
                    console.log(data)

                    for (x = 0; x <= 11; x++) {
                        var secDiv = document.createElement("div");
                        var tag = document.createElement("div");
                        var text = document.createTextNode(data.articles[x].title);
                        tag.style.color = 'rgb(255, 255, 255)';
                        tag.style.padding = "10px";
                        tag.style.fontWeight = "bold";
                        tag.appendChild(text);
                        secDiv.appendChild(tag);

                        var img = document.createElement("img");
                        img.src = data.articles[x].urlToImage;
                        img.style = "display: block; margin-left: auto; margin-right: auto; width: 325px;";
                        secDiv.appendChild(img);

                        var tag = document.createElement("div");
                        var text = document.createTextNode(data.articles[x].content);
                        tag.style.color = 'rgb(255, 255, 255)';
                        tag.style.padding = "10px";
                        tag.appendChild(text);
                        secDiv.appendChild(tag);

                        var a = document.createElement('a');
                        var linkText = document.createTextNode(data.articles[x].url.slice(0, 40) + "...");
                        a.appendChild(linkText);
                        a.href = data.articles[x].url;
                        a.style.padding = "10px";
                        a.style.color = 'rgb(255, 255, 255)';
                        secDiv.appendChild(a);

                        var br = document.createElement("br");
                        secDiv.style.width = "400px";
                        secDiv.style.margin = "30px";
                        secDiv.style.padding = "10px";
                        secDiv.style.backgroundColor = 'rgb(124, 124, 124)';
                        secDiv.appendChild(br);

                        element.appendChild(secDiv);

                    }
                }

                function newsGroups(word) {
                    element.innerHTML = "";
                    txtSearch.value = word
                    fetch('https://newsapi.org/v2/everything?q=' + word + '&apiKey=b39cf6b4a47542d39286a5ba089a59a6')
                        .then(response => response.json())
                        .then(data => ProcessItems(data));
                }
            </script>
        </div>
    </form>
</body>
</html>
