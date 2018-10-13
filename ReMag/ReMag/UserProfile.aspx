<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="ReMag.UserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReMag</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="myStyles.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
                        <li><a href="default.aspx">Home</a></li>
                        <li><a href="UserProfile.aspx">Profile</a></li>
                        <li><a href="MyMagazines.aspx">My Mags</a></li>
                        <li><a href="badges.html">Shop</a></li>
                        <li><a href="collapsible.html">Explore</a></li>
                        <li><a id="loginbtn" runat="server" class="waves-effect waves-light btn modal-trigger" href="#modal1">Log In</a></li>
                    </ul>
                </div>
            </nav>
            <ul class="sidenav" id="mobile-demo">
                <li><a href="default.aspx">Home</a></li>
                <li><a href="UserProfile.aspx">Profile</a></li>
                <li><a href="MyMagazines.aspx">My Mags</a></li>
                <li><a href="badges.html">Shop</a></li>
                <li><a href="collapsible.html">Explore</a></li>
                <li><a id="loginbtn2" runat="server" class="waves-effect waves-light btn modal-trigger" href="#modal1">Log In</a></li>
            </ul>
            <%----------%>

            <%--Body--%>
            <h1>Profile</h1>
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
                    <label for="icon_city">State</label>
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
                    <a class="waves-effect waves-light btn" runat="server" onserverclick="Save_ServerClick"><i class="material-icons right">send</i>Save</a>
                </div>
            </div>
            <div id="snackbar">Some text some message..</div>
            <%--------%>
        </div>

        <script type="text/javascript">

            $(document).ready(function () {
                $('.sidenav').sidenav();
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

            if ($.urlParam('sc') == 'Y') {
                var x = document.getElementById("snackbar");
                x.innerText = "success - profile has been saved";
                x.className = "show";
                setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
            }

        </script>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
