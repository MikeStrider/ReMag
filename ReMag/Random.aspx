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
    <style>
        body {
            color: white;
        }

        .pointer {cursor: pointer;}

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

        /*Spinner*/
        .lds-spinner {
            display: inline-block;
            position: relative;
            width: 80px;
            height: 80px;
        }
            .lds-spinner div {
                transform-origin: 40px 40px;
                animation: lds-spinner 1.2s linear infinite;
            }
                .lds-spinner div:after {
                    content: " ";
                    display: block;
                    position: absolute;
                    top: 3px;
                    left: 37px;
                    width: 6px;
                    height: 18px;
                    border-radius: 20%;
                    background: #cef;
                }
                .lds-spinner div:nth-child(1) {
                    transform: rotate(0deg);
                    animation-delay: -1.1s;
                }
                .lds-spinner div:nth-child(2) {
                    transform: rotate(30deg);
                    animation-delay: -1s;
                }
                .lds-spinner div:nth-child(3) {
                    transform: rotate(60deg);
                    animation-delay: -0.9s;
                }
                .lds-spinner div:nth-child(4) {
                    transform: rotate(90deg);
                    animation-delay: -0.8s;
                }
                .lds-spinner div:nth-child(5) {
                    transform: rotate(120deg);
                    animation-delay: -0.7s;
                }
                .lds-spinner div:nth-child(6) {
                    transform: rotate(150deg);
                    animation-delay: -0.6s;
                }
                .lds-spinner div:nth-child(7) {
                    transform: rotate(180deg);
                    animation-delay: -0.5s;
                }
                .lds-spinner div:nth-child(8) {
                    transform: rotate(210deg);
                    animation-delay: -0.4s;
                }
                .lds-spinner div:nth-child(9) {
                    transform: rotate(240deg);
                    animation-delay: -0.3s;
                }
                .lds-spinner div:nth-child(10) {
                    transform: rotate(270deg);
                    animation-delay: -0.2s;
                }
                .lds-spinner div:nth-child(11) {
                    transform: rotate(300deg);
                    animation-delay: -0.1s;
                }
                .lds-spinner div:nth-child(12) {
                    transform: rotate(330deg);
                    animation-delay: 0s;
                }
        @keyframes lds-spinner {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }

    </style>
</head>
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

            <div id="spinner" style="display:none;" runat="server">
                <div style="color:#cef;">loading, please wait ...</div>
                <div class="lds-spinner"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
            </div>

            <h1>Random Things</h1>
            <h2>APIs</h2>
            <div style="margin: auto;width:800px;padding: 20px;background:rgb(124,124,124)">
                <b>Dad Joke, random joke, an API calling out to <a style="color: white;" class="pointer"href="https://icanhazdadjoke.com">icanhazdadjoke.com</a></b>
                <br /><br />
                <div id="divJoke"></div>
            </div>
            <br />
            <div style="margin: auto;width:800px;padding: 20px;background:rgb(124,124,124)">
                <b>Inspiring Quote, random quote from a json file provided by <a style="color: white;" class="pointer" href="https://forum.freecodecamp.org/t/free-api-inspirational-quotes-json-with-code-examples/311373">FreeCodeCamp.com</a></b>
                <br /><br />
                <div id="divQuote" runat="server"></div>
            </div>
            <br />
            <div style="color:lightgray">Reload the page for more randomness.</div>
            <br /><br />
            <div style="margin: auto;width:600px;padding: 20px;background:rgb(124,124,124)">
                <b>Save a Website to PDF</b>
                <p>3rd party .NET library from <a style="color: white;" class="pointer" href="https://selectpdf.com">selectpdf.com</a></p>
                <input type="text" id="txtMakePDF" runat="server" />
                <asp:Button Text="Make a PDF" runat="server" ID="btnMakePDF" OnClick="btnMakePDF_Click" />
            </div>

            <div id="myModal" class="modal" runat="server">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <p style="color: red; font-weight: 600">Error creating PDF. URL is invalid.</p>
                </div>
            </div>

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

                var modal = document.getElementById("myModal");
                //var btn = document.getElementById("myBtn");
                var span = document.getElementsByClassName("close")[0];
                //btn.onclick = function () {
                //    modal.style.display = "block";
                //}
                span.onclick = function () {
                    modal.style.display = "none";
                    window.location.href = "Random.aspx";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                        window.location.href = "Random.aspx";
                    }
                }

                var btnMakePDF = document.getElementById("btnMakePDF");
                btnMakePDF.onclick = function () {
                    document.getElementById("spinner").style.display = "block";
                }

            </script>
        </div>
    </form>
</body>
</html>
