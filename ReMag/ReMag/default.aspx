<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ReMag._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReMag</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>
        #snackbar {
            visibility: hidden;
            min-width: 250px;
            margin-left: -125px;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 2px;
            padding: 16px;
            position: fixed;
            z-index: 1;
            left: 50%;
            bottom: 30px;
            font-size: 17px;
        }

            #snackbar.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 3.5s;
                animation: fadein 0.5s, fadeout 0.5s 3.5s;
            }

        @-webkit-keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }

            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }

            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @-webkit-keyframes fadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }

            to {
                bottom: 0;
                opacity: 0;
            }
        }

        @keyframes fadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }

            to {
                bottom: 0;
                opacity: 0;
            }
        }
    </style>


</head>
<body class="green lighten-4">
    <form id="form1" runat="server">
        <div class="container">
            <%--NavBar--%>
            <nav class="nav-extended">
                <div class="nav-wrapper green lighten-2">
                    <a href="default.aspx" class="brand-logo"> ReMag</a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="Profile2.aspx">Profile</a></li>
                        <li><a href="badges.html">Shop</a></li>
                        <li><a href="collapsible.html">Explore</a></li>
                        <li><a id="loginbtn" runat="server" class="waves-effect waves-light btn modal-trigger" href="#modal1">Log In</a></li>
                    </ul>
                </div>
            </nav>
            <ul class="sidenav" id="mobile-demo">
                <li><a href="Profile2.aspx">Profile</a></li>
                <li><a href="badges.html">Shop</a></li>
                <li><a href="collapsible.html">Explore</a></li>
                <li><a id="loginbtn2" runat="server" class="waves-effect waves-light btn modal-trigger" href="#modal1">Log In</a></li>
            </ul>
            <%----------%>

            <h1>Welcome to ReMag</h1>
            <p>we have a lot to do</p>
            <p>
                scope<br />
                create a profile page<br />
                create mission page<br />
                create a way to post your mag<br />
                - users will post a price<br />
            </p>
            <div id="snackbar">Some text some message..</div>

            <%--Log Out Box--%>
            <div id="modal2" class="modal">
                <div class="modal-content">
                    <ul class="collapsible">
                        <li class="active">
                            <div class="collapsible-header"><i class="material-icons">filter_drama</i>Log Out</div>
                            <div class="collapsible-body">
                                <div class="modal-footer">
                                    <a href="#!" runat="server" class="modal-close waves-effect waves-green btn-flat" onserverclick="Logout_ServerClick">Confirm</a>
                                    <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cancel</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <%---------------%>


            <%--Login / Regsiter Box--%>
            <div id="modal1" class="modal">
                <div class="modal-content">
                    <ul class="collapsible">
                        <li>
                            <div class="collapsible-header"><i class="material-icons">filter_drama</i>Login</div>
                            <div class="collapsible-body">
                                <div class="input-field col s12">
                                    <input runat="server" id="username" type="text" class="validate" />
                                    <label for="username">User Name</label>
                                </div>
                                <div class="input-field col s12">
                                    <input runat="server" id="password" type="password" class="validate" />
                                    <label for="password">Password</label>
                                </div>
                                <div class="modal-footer">
                                    <a href="#!" runat="server" class="modal-close waves-effect waves-green btn-flat" onserverclick="Login_ServerClick">Login</a>
                                    <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cancel</a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">card_membership</i>Register</div>
                            <div class="collapsible-body">
                                <div class="input-field col s12">
                                    <input runat="server" id="username1" type="text" class="validate" />
                                    <label for="username">User Name</label>
                                </div>
                                <div class="input-field col s12">
                                    <input runat="server" id="email1" type="email" class="validate" />
                                    <label for="email1">Email</label>
                                    <span class="helper-text" data-error="please enter valid email"></span>
                                </div>
                                <div class="input-field col s12">
                                    <input runat="server" id="password1" type="password" class="validate" />
                                    <label for="password1">Password</label>
                                </div>
                                <div class="modal-footer">
                                    <a href="#!" runat="server" class="modal-close waves-effect waves-green btn-flat" onserverclick="Register_ServerClick">Register</a>
                                    <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cancel</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <%------------------------%>
        </div>

        <script>
            $(document).ready(function () {
                $('.sidenav').sidenav();
                $('.modal').modal();
                $('.modal2').modal();
                $('.collapsible').collapsible();
            });

            $.urlParam = function (name) {
                var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
                if (results == null) {
                    return null;
                }
                else {
                    return decodeURI(results[1]) || 0;
                }
            }

            if ($.urlParam('ln') == 'Y') {
                var x = document.getElementById("snackbar");
                x.innerText = "Log In Success";
                x.className = "show";
                setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
            }

            if ($.urlParam('lo') == 'Y') {
                var x = document.getElementById("snackbar");
                x.innerText = "You Are Now Logged Out";
                x.className = "show";
                setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
            }

            if ($.urlParam('reg') == 'Y') {
                var x = document.getElementById("snackbar");
                x.innerText = "Registered Success / You Are Logged In";
                x.className = "show";
                setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
            }

            if ($.urlParam('lf') == 'Y') {
                var x = document.getElementById("snackbar");
                x.innerText = "Log In Failed / Incorrect Credentials";
                x.className = "show";
                setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
            }

        </script>

    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>
