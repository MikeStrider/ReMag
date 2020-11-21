<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="Projects" %>

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
            <div id="border-top">
                <img id="theimage" src="Images/projects.jpg" />
            </div>
            <div class="proj-container">
                <div class="col1">
                    <img class="col1image" src="Images/2018-12-07_22-42-49.jpg" />
                </div>
                <div class="col2">
                    <h4>TMS Next Level Web App</h4>
                    C# / ASP.NET / JavaScript<br />
                    I have built a full transportation management software.  Create loads, add contacts, add trucks, track trucks, and so much more.  This SAAS web app was built from the ground up as I was learning a variety of languages.  It includes a web service, MySQL, Quartz.NET processor, and googles API for routes and tracking.  Check out the tutorial video on the login page for an overview of what this software does.
                </div>
                </div>
            <div class="proj-container">
                <div class="col1">
                    <img class="col1image" src="Images/2018-12-07_22-43-25.jpg" />
                </div>
                <div class="col2">
                    <h4>TMS Next Level Mobile App</h4>
                    Xamarin Android<br />
                    I have created a mobile app that sends tracking information to the Web Site at set intervals.  It runs as a service meaning you can close the app and it works in the background.  This app also sends truck availability to the web site using a web service.  Microsoft recently bought Xamain Studios and it is now free to develop with.
                </div>
                </div>
            <div class="proj-container">
                <div class="col1">
                    <img class="col1image" src="Images/2018-12-07_22-43-54.jpg" />
                </div>
                <div class="col2">
                    <h4>Shopping Cart / Online Store</h4>
                    OpenCart.NET<br />
                    OpenCart is Open Source software in which a developer can implement for a client.  I was able to do this for craftybusiness.net.  The implementation was easy, as long as you know how to host a website.  In this case we hosted using Yahoo.
                </div>
                </div>
            <div class="proj-container">
                <div class="col1">
                    <img class="col1image" src="Images/2018-12-07_22-44-20.jpg" />
                </div>
                <div class="col2">
                    <h4>Index Searching</h4>
                    Lucene.NET<br />
                    This project can be found on GitHub.  It have used the Lucene.NET libaray to index Word Documents. Users can then search for keywords and results will be displayed based on a score.  The results are also filtered with brief descriptions and keywords highlighted.
                </div>
                </div>
            <div class="proj-container">
                <div class="col1">
                    <img class="col1image" src="Images/2018-12-07_22-51-55.jpg" />
                </div>
                <div class="col2">
                    <%--Needs some logic here to tst if DEV vs PROD--%>
                    <h4>ReMag</h4>
                    ASP.NET / Materialize / JavaScript<br />
                    My latest creation where a user can create a new account and post there old magazines.  Site is currently being hosted and availble for demo.  <a id="remaglink" href="default.aspx">Click here to view.</a>
                </div>
            </div>
        </div>

        <script>
            function openSlideMenu() {
                document.getElementById('side-menu').style.width = '250px';
                document.getElementById('main').style.marginLeft = '250px';
            }

            function closeSlideMenu() {
                document.getElementById('side-menu').style.width = '0px';
                document.getElementById('main').style.marginLeft = '0px';
            }
            window.onload = function(){
                var realWidth = document.getElementById('border-top').offsetWidth;
                var picWidth = document.getElementById('theimage').offsetWidth;
                var moveLeft = (realWidth - picWidth) / 2;
                document.getElementById('border-top').style.left = moveLeft + "px";
            }

        </script>

    </form>
</body>
</html>
