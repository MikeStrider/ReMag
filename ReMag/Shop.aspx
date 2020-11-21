<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop.aspx.cs" Inherits="ReMag.Shop" %>

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

            <%---BODY---%>
            <h3>Shop</h3>
            <p>List of Mags available to purchase.</p>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="MagID" HeaderText="MagID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='<%# Eval("MagID", "~/images2.aspx?id={0}&vo=Y") %>'>
                                <asp:Image ID="Image1" runat="server" Style="max-width: 120px; max-height: 120px" Height="200" ImageUrl='<%# Eval("image") %>' />
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ReMag-DBConnectionString %>" SelectCommand="SELECT MyMags.MagID, MyMags.title, MyMags.image, MyMags.description, MyMags.type, MyMags.price, Profile.name FROM MyMags INNER JOIN Profile ON Profile.ProfileID = MyMags.[user] WHERE (MyMags.posted = 'Y') AND (MyMags.retired = 'N')"></asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
            <br />
            <%----------%>

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

            <%--Footer--%>
            <footer class="page-footer green lighten-2">
                <div class="footer-copyright">
                    <div class="container">
                        © 2018 Copyright 
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