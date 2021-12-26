<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Michael Strong Main</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Mike Strong, Husband, Father, Tech Support Engineer, Web Developer, Gamer, Hockey Player, Your New Best Friend" />
    <meta name="keywords" content="Mike Strong, Husband, Father, Tech Support Engineer, Web Developer, Gamer, Hockey Player, Your New Best Friend" />
    <meta name="author" content="Michael Strong" />
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
            <div id="section0">
                <div id="box-container1">
                    <div id="abox-1">
                        <img src="Images/46421058012672_n.jpg" id="imgMe" />
                    </div>
                    <div id="abox-2">
                        <div id="title">
                            <br />
                            Mike Strong<br />
                            <br />
                            Husband, Father<br />
                            Tech Support Engineer, Web Developer<br />
                            Gamer, Hockey Player<br />
                            Your New Best Friend<br />
                            <br />
                        </div>
                    </div>
                </div>
            </div>

            <div id="section1">
                <h2>Check me out All over the Web</h2>

                <div id="box-container2">
                    <div id="box-1" class="subscribedbox">
                        <h3>https://github.com/mikestrider</h3>
                        <div class="logosize">
                            <img src="Images/2018-12-03_22-46-35.jpg" height="70" />
                        </div>
                        <a href="https://github.com/MikeStrider" target="_blank" id="btnGitHub" class="button" style="vertical-align: middle"><span>GitHub </span></a>
                    </div>
                    <div id="box-2" class="subscribedbox">
                        <h3>youtube.com/channel/UCzwXzg...</h3>
                        <div class="logosize">
                            <img src="Images/youtube.jpg" height="50" />
                        </div>
                        <a href="https://www.youtube.com/channel/UCzwXzg8FyzREv5uFzwU3ktQ" target="_blank" id="btnYouTube" class="button" style="vertical-align: middle"><span>YouTube </span></a>
                    </div>
                    <div id="box-3" class="subscribedbox">
                        <h3>linkedin.com/in/michael-strong...</h3>
                        <div class="logosize">
                            <img src="Images/linkedin.jpg" height="60" />
                        </div>
                        <a href="https://www.linkedin.com/in/michael-strong-050875142" target="_blank" id="btnLinkedIn" class="button" style="vertical-align: middle"><span>LinkedIn </span></a>
                    </div>
                    <div id="box-5" class="subscribedbox">
                        <h3>mstrong489.medium.com</h3>
                        <div class="logosize">
                            <img src="Images/medium.jpg" height="50" />
                        </div>
                        <a href="https://mstrong489.medium.com/" target="_blank" id="btnMedium" class="button" style="vertical-align: middle"><span>Medium </span></a>
                    </div>
                    <div id="box-4" class="subscribedbox">
                        <h3>https://codepen.io/mikestrider</h3>
                        <div class="logosize">
                            <img src="Images/copepen.png" height="70" />
                        </div>
                        <a href="https://codepen.io/mikestrider/" target="_blank" id="btnCodePen" class="button" style="vertical-align: middle"><span>CodePen </span></a>
                    </div>
                    <div id="box-6" class="subscribedbox">
                        <h3>www.codewars.com/users/mikestrider</h3>
                        <div class="logosize">
                            <img src="Images/codewars.jpg" height="60" />
                        </div>
                        <a href="https://www.codewars.com/users/MikeStrider" target="_blank" id="btnCodeWars" class="button" style="vertical-align: middle"><span>CodeWars </span></a>
                    </div>
                    <div id="box-7" class="subscribedbox">
                        <h3>stackoverflow.com/users/7841454...</h3>
                        <div class="logosize">
                            <img src="Images/stack.jpg" height="70" />
                        </div>
                        <a href="https://stackoverflow.com/users/7841454/michael" target="_blank" id="btnStack" class="button" style="vertical-align: middle"><span>CodeWars </span></a>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <br /><br />
    <div style="margin: auto;width:800px;padding: 20px;background:rgb(124,124,124)">
        <i class="fas fa-exclamation-circle"></i> about this page 
        <br />- this page is responsive because of css style flex-wrap: wrap;
        <br />- this page pulls in icons from fontawesome.com
    </div>
</body>
</html>