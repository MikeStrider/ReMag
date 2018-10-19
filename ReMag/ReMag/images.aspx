<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="images.aspx.cs" Inherits="ReMag.images" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>ReMag</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="myStyles.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="myJavaScript.js"></script>
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
                        <li><a href="badges.html">Shop</a></li>
                        <li><a href="collapsible.html">Explore</a></li>
                        <li><a id="loginbtn" runat="server" class="waves-effect waves-light btn modal-trigger" href="#modal1">Log In</a></li>
                    </ul>
                </div>
            </nav>
            <ul class="sidenav" id="mobile-demo">
                <li class="active"><a href="default.aspx">Home</a></li>
                <li><a href="UserProfile.aspx">Profile</a></li>
                <li><a href="MyMagazines.aspx">My Mags</a></li>
                <li><a href="badges.html">Shop</a></li>
                <li><a href="collapsible.html">Explore</a></li>
                <li><a id="loginbtn2" runat="server" class="waves-effect waves-light btn modal-trigger" href="#modal1">Log In</a></li>
            </ul>
            <%----------%>

            <%--Body--%>
            <h3>Images</h3>

            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />

                <asp:FileUpload ID="FileUploadControl" runat="server" />
                <asp:LinkButton ID="LinkButton1" class="waves-effect waves-light btn" runat="server" OnClick="UploadButton_Click">Upload</asp:LinkButton>
            <br />
            <br />
            <asp:PlaceHolder ID="ImagePlaceHolder" runat="server" />

            <div class="carousel carousel-slider center" data-indicators="true">
                <a class="carousel-item" href="#one!"><img src="/images/alkmaps.png" /></a>
                <a class="carousel-item" href="#two!"><img src="/images/Edit_Device.png" /></a>
                <a class="carousel-item" href="#three!"><img src="/images/Save_Success.png" /></a>
            </div>

            <br />
            <br />
            <div id="snackbar">Some text some message..</div>
            <%--------%>

            <%--Footer--%>
            <footer class="page-footer green lighten-2">
                <div class="footer-copyright">
                    <div class="container">
                        © 2018 Copyright 
                        <a class="grey-text text-lighten-4 right" href="https://mikestrong7.wixsite.com/about">Michael Strong</a>
                    </div>
                </div>
            </footer>
            <%--Footer--%>
        </div>
    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>
