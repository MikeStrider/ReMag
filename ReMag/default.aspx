<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="ReMag._default" %>

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
                        <li><a href="Shop.aspx">Shop</a></li>
                        <li><a href="collapsible.html">Explore</a></li>
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
                <li><a href="collapsible.html">Explore</a></li>
                <li><a href="Chat.aspx">Chat</a></li>
                <li><a id="loginbtn2" runat="server" class="waves-effect waves-light btn modal-trigger" href="#modal1">Log In</a></li>
            </ul>
            <%----------%>


            <%--Body--%>
            <h3>Welcome to ReMag</h3>
            <p>we have a lot to do</p>
            <p>
                Sell you magazines and look for mags to buy.  You can buy single issues or sign up for monthly.  The seller will ship monthly. <br />
                You will need an account.  Once created you can update your Profile.<br />
                The My Mags page allows you to post magazines available for sale.<br />
                Shop is a list of mags available to buy.<br />
                Explore has reviews and features articles.<br />
                <br />

                Page uses Materialize from google.  SQL, ASP.NET, JavaScript, etc.<br /><br />

                Katan Board can be found on GitHub.  Slack chat room is available to discuss the Project.<br /><br />

                We are using "Toasts" to update when the user as they navigate the site.<br /><br />

                Service Workers will be used later in the project.
            </p><br /><br />
            <div id="snackbar">Some text some message..</div>
            <%--------%>

            <%--Log Out Box--%>
            <div id="modal2" class="modal">
                <div class="modal-content">
                    <ul class="collapsible">
                        <li class="active">
                            <div class="collapsible-header"><i class="material-icons">filter_drama</i>Log Out</div>
                            <div class="collapsible-body">
                                <div class="modal-footer">
                                    <a runat="server" class="modal-close waves-effect waves-green btn-flat" onserverclick="Logout_ServerClick">Confirm</a>
                                    <a class="modal-close waves-effect waves-green btn-flat">Cancel</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <%---------------%>

            <%--Login / Register Box--%>
            <div id="modal1" class="modal">
                <div class="modal-content">
                    <ul class="collapsible">
                        <li>
                            <div class="collapsible-header" id="logindiv"><i class="material-icons">filter_drama</i>Login</div>
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
                                    <a runat="server" class="modal-close waves-effect waves-green btn-flat" onserverclick="Login_ServerClick">Login</a>
                                    <a class="modal-close waves-effect waves-green btn-flat">Cancel</a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header" id="regdiv"><i class="material-icons">card_membership</i>Register</div>
                            <div class="collapsible-body">
                                <div class="input-field col s12">
                                    <input runat="server" id="username1" type="text" class="validate" />
                                    <label for="username1">User Name</label>
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
                                    <a runat="server" class="modal-close waves-effect waves-green btn-flat" onserverclick="Register_ServerClick">Register</a>
                                    <a class="modal-close waves-effect waves-green btn-flat">Cancel</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <%------------------------%>

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
