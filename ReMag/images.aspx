<%@ Page Language="C#" AutoEventWireup="true" CodeFile="images.aspx.cs" Inherits="ReMag.images" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>ReMag - </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="myStyles.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="myJavaScript.js"></script>
    <meta name="description" content="This site is a place to resell your old magazines. It is currently in deveoplment. If you would like to contribute please look me up on GitHub." />
    <meta name="keywords" content="ReMag Michael Strong Resell Magazines" />
    <meta name="author" content="Michael Strong" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>

<body class="green lighten-4">
    <form id="form1" runat="server">
        <div class="container">

          <%--NavBar--%>
            <nav class="nav-extended">
                <div class="nav-wrapper green lighten-2">
                    <a href="default.aspx" class="brand-logo">ReMag</a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li class="active"><a href="default.aspx">Home</a></li>
                        <li><a href="UserProfile.aspx">Profile</a></li>
                        <li><a href="MyMagazines.aspx">My Mags</a></li>
                        <li><a href="Shop.aspx">Shop</a></li>
                        <li><a href="Explore.aspx">Explore</a></li>
                        <li><a href="Chat.aspx">Chat</a></li>
                        <li><a id="loginbtn" runat="server" class="waves-effect waves-light btn modal-trigger" href="#modal1">Log In</a></li>
                    </ul>
                </div>
            </nav>
            <ul class="sidenav" id="mobile-demo">
                <li class="active"><a href="default.aspx">Home</a></li>
                <li><a href="UserProfile.aspx">Profile</a></li>
                <li><a href="MyMagazines.aspx">My Mags</a></li>
                <li><a href="Shop.aspx">Shop</a></li>
                <li><a href="Explore.aspx">Explore</a></li>
                <li><a href="Chat.aspx">Chat</a></li>
                <li><a id="loginbtn2" runat="server" class="waves-effect waves-light btn modal-trigger" href="#modal1">Log In</a></li>
            </ul>
            <%----------%>

            <%--Body--%>
            <div class="row">
                <br />
                <div class="input-field col s7">
                    <i class="material-icons prefix">chrome_reader_mode</i>
                    <input id="title" runat="server" type="text" readonly="Y" />
                    <label for="title">Title</label>
                </div>

                <div class="input-field col s12">
                    <i class="material-icons prefix">assignment</i>
                    <input id="details" runat="server" type="text" readonly="Y" />
                    <label for="details">Details</label>
                </div>

                <div id="useoptions">
                    <div class="input-field col s6">
                        <asp:FileUpload ID="FileUploadControl" runat="server" />
                        <asp:LinkButton ID="LinkButton1" class="waves-effect waves-light btn" runat="server" OnClick="UploadButton_Click">Upload</asp:LinkButton>
                    </div>
                    <div class="input-field col s3">
                        <asp:LinkButton ID="LinkButton2" class="waves-effect waves-light btn" runat="server" OnClick="Button1_Click1">Delete Center Image</asp:LinkButton>
                    </div>
                    <div class="input-field col s3">
                        <asp:LinkButton ID="LinkButton3" class="waves-effect waves-light btn" runat="server" OnClick="LinkButton3_Click">Set As Primary</asp:LinkButton>
                    </div>
                    <input type="hidden" runat="server" id="hiddenID" value="3487" />
                </div>
                <br />
                <br />
                <div class="carousel carousel-slider center" data-indicators="true">
                    <div class="carousel-fixed-item center middle-indicator">
                        <div class="left">
                            <a href="Previo" class="movePrevCarousel middle-indicator-text waves-effect waves-light content-indicator"><i class="material-icons left  middle-indicator-text">chevron_left</i></a>
                        </div>
                        <div class="right">
                            <a href="Siguiente" class=" moveNextCarousel middle-indicator-text waves-effect waves-light content-indicator"><i class="material-icons right middle-indicator-text">chevron_right</i></a>
                        </div>
                    </div>
                    <asp:PlaceHolder ID="ImagePlaceHolder" runat="server" />
                </div>
                <br />
                <br />
                <div id="snackbar">Some text some message..</div>
            </div>
            <%--------%>

            <%--Footer--%>
            <footer class="page-footer green lighten-2">
                <div class="footer-copyright">
                    <div class="container">
                        © 2020 Copyright 
                        <a class="grey-text text-lighten-4 right" href="index.aspx">Michael Strong <u>about me</u></a>
                    </div>
                </div>
            </footer>
            <%--Footer--%>
        </div>
    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>
