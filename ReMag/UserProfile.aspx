 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="ReMag.UserProfile" %>

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
            <h3>Profile</h3>
            <div class="row">
                <div class="input-field col s6">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="name" runat="server" type="text" class="validate" />
                    <label for="name">Name</label>
                </div>
                <div class="input-field col s6">
                    <i class="material-icons prefix">phone</i>
                    <input id="telephone" runat="server" type="tel" class="validate" />
                    <label for="telephone">Telephone</label>
                </div>
                <div class="input-field col s6">
                    <i class="material-icons prefix">email</i>
                    <input id="email" runat="server" type="email" class="validate" />
                    <label for="email">Email</label>
                </div>
                <div class="input-field col s12">
                    <i class="material-icons prefix">location_city</i>
                    <input id="address" runat="server" type="text" class="validate" />
                    <label for="address">AddressLine1</label>
                </div>
                <div style="left: 42px" class="input-field col s12">
                    <input id="city" runat="server" type="text" class="validate" />
                    <label for="city">City</label>
                </div>
                <div style="left: 42px" class="input-field col s6">
                    <input id="state" runat="server" type="text" class="validate" />
                    <label for="state">State</label>
                </div>
                <div style="left: 42px" class="input-field col s6">
                    <input id="zip" runat="server" type="text" class="validate" />
                    <label for="zip">Zip</label>
                </div>
                <div class="input-field col s12">
                    <i class="material-icons prefix">portrait</i>
                    <input id="bio" runat="server" type="text" class="validate" />
                   <label for="bio">Bio</label>
                </div>
                <div class="center input-field col s12">
                    <label>
                        <input type="checkbox" id="chk_emailme" class="filled-in" runat="server" />
                        <span style="color: black">Email Me when a New Mag is Posted</span>
                    </label>
                    <br />
                    <br />
                    <a class="waves-effect waves-light btn" runat="server" onserverclick="Save_ServerClick"><i class="material-icons right">send</i>Save</a>
                </div>
            </div>
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

        </div>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
