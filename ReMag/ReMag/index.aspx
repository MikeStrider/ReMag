<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ReMag.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReMag</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body class="green lighten-4">
    <form id="form1" runat="server">
        <div class="container">

            <nav class="nav-extended">
                <div class="nav-wrapper green lighten-2">
                    <a href="#!" class="brand-logo">ReMag</a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="sass.html">Profile</a></li>
                        <li><a href="badges.html">Shop</a></li>
                        <li><a href="collapsible.html">Explore</a></li>
                        <li><a class="waves-effect waves-light btn modal-trigger" href="#modal1">Log In</a></li>
                    </ul>
                </div>
            </nav>

            <ul class="sidenav" id="mobile-demo">
                <li><a href="sass.html">Profile</a></li>
                <li><a href="badges.html">Shop</a></li>
                <li><a href="collapsible.html">Explore</a></li>
                <li><a class="waves-effect waves-light btn modal-trigger" href="#modal1">Log In</a></li>
            </ul>

            <h1>Welcome to ReMag</h1>
            <p>we have a lot to do</p>
            <p>
                scope<br />
                create a profile page<br />
                create mission page<br />
                create a way to post your mag<br />
                - users will post a price
            </p>

            <div id="modal1" class="modal">
                <div class="modal-content">
                    <h4>Login</h4>
                    <div class="input-field col s12">
                        <input id="email" type="email" class="validate" />
                        <label for="email">Email</label>
                    </div>
                    <div class="input-field col s12">
                        <input id="password" type="password" class="validate" />
                        <label for="email">Password</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#!" class="modal-close waves-effect waves-green btn-flat">Login</a>
                    <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cancel</a>
                </div>
            </div>


        </div>
    </form>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>



    <script type="text/javascript">

        $(document).ready(function () {
            $('.sidenav').sidenav();
        });

        $(document).ready(function () {
            $('.modal').modal();
        });

    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
