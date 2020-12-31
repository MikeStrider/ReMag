<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Random.aspx.cs" Inherits="Random" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Michael Strong Projects</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="Helper_Code/meStyle.css" />
    <script src="Helper_Code/meJavaScript.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous" />
</head>
    <style>
        body{
            color:white;
        }
    </style>
<body>
    <form id="form2" runat="server">

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
        <div id="main" style="text-align: center;">
            <h1>Random Things</h1>
            <br />
            <p><b>Dad Joke, API calling out to <a style="color:white;" href="https://icanhazdadjoke.com">icanhazdadjoke.com</a></b></p>
            <div id="divJoke"></div>
            <br />
            <p><b>Inspiring Quote, json file provided by <a style="color:white;" href="https://forum.freecodecamp.org/t/free-api-inspirational-quotes-json-with-code-examples/311373">FreeCodeCamp.com</a></b></p>
            <div id="divQuote" runat="server"></div>
            <br /> <br /> <br />
            <div>Reload the page for more randomness.</div>

            <script>
                var dadJokeElement = document.getElementById("divJoke");
                var quoteElement = document.getElementById("divQuote");

                var myHeaders = new Headers();
                myHeaders.append("Accept", "application/json");
                var requestOptions = {
                    method: 'GET',
                    headers: myHeaders
                };
                fetch("https://icanhazdadjoke.com", requestOptions)
                  .then(response => response.json())
                  .then(result => ProcessItems(result, dadJokeElement))
                  .catch(error => console.log('error', error));  

                function ProcessItems(data, element) {
                    console.log(data);
                    element.innerHTML = data.joke;  
                }
            </script>
        </div>
    </form>
</body>
</html>
