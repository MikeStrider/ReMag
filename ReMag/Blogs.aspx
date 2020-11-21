<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Blogs.aspx.cs" Inherits="Blogs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Michael Strong</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="Helper_Code/meStyle.css" />
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">

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
                <li><a href="Blogs.aspx">Blogs</a></li>
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
            <a href="Blogs.aspx">Blogs</a>
        </div>

        <div id="main">
            <a href="#">
                <div id="iconsize">
                    <div class="tooltip">
                        <i class="fas fa-arrow-circle-up"></i><span class="tooltiptext">scroll to top</span>
                    </div>
                </div>
            </a>
            <div id="loadingdiv">
                <i class="fas fa-spinner"></i>
            </div>
            <div id="iframediv">
                <iframe onload="onLoadHandler();" src="https://medium.com/@michaelstrong_83904"></iframe>
            </div>
            <a href="https://medium.com/@michaelstrong_83904" target="_blank">
                <div id="overlay"></div>
            </a>
        </div>

        <script>
            function openSlideMenu() {
                document.getElementById('side-menu').style.width = '250px';
                document.getElementById('main').style.marginLeft = '250px';
                document.getElementById('iframediv').style.marginLeft = '250px';
                document.getElementById('overlay').style.marginLeft = '250px';
            }

            function closeSlideMenu() {
                document.getElementById('side-menu').style.width = '0px';
                document.getElementById('main').style.marginLeft = '0px';
                document.getElementById('iframediv').style.marginLeft = '0px';
                document.getElementById('overlay').style.marginLeft = '0px';
            }
            document.getElementById("overlay").style.display = "block";
            function onLoadHandler() {
                document.getElementById("loadingdiv").style.display = "none";
            }
        </script>

    </form>
</body>
</html>
