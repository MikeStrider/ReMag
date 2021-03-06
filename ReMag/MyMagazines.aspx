﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyMagazines.aspx.cs" Inherits="ReMag.MyMagazines" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReMag MyMags</title>
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
                        <li><a href="default.aspx">Home</a></li>
                        <li><a href="UserProfile.aspx">Profile</a></li>
                        <li class="active"><a href="MyMagazines.aspx">My Mags</a></li>
                        <li><a href="Shop.aspx">Shop</a></li>
                        <li><a href="Explore.aspx">Explore</a></li>
                        <li><a href="Chat.aspx">Chat</a></li>
                        <li><a href="Admin.aspx">Admin Area</a></li>
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
                <li><a href="Admin.aspx">Admin Area</a></li>
                <li><a id="loginbtn2" runat="server" class="waves-effect waves-light btn modal-trigger" href="#modal1">Log In</a></li>
            </ul>
            <div id="txtUserId" runat="server"></div>
            <style>
                #txtUserId {
                    float: right;
                }
            </style>
            <%----------%>

            <%--Body--%>
            <h3>My Magazines</h3>
            <p>List of Mags you are wanting to sell.</p>
            <div class="row">
                <div runat="server" id="Label1">Label</div>
                <div class="input-field col s6">
                    <asp:DropDownList ID="ddl_Retired" runat="server" OnSelectedIndexChanged="itemSelected" AutoPostBack="True">
                        <asp:ListItem Text="Showing Active Mags" Value="N"></asp:ListItem>
                        <asp:ListItem Text="Showing Expired Mags" Value="Y"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="input-field center-align col s6">
                    <a runat="server" class="waves-effect waves-light btn modal-trigger" href="#modal3"><i class="material-icons right">add_circle_outline</i>Add New Magazine</a>
                </div>
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="MagID" HeaderText="MagID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='<%# Eval("MagID", "~/images2.aspx?id={0}") %>'>
                                <asp:Image ID="Image1" runat="server" Style="max-width: 120px; max-height: 120px" Height="200" ImageUrl='<%# Eval("image") %>' />
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                    <asp:BoundField DataField="posted" HeaderText="posted" SortExpression="posted" />
                    <asp:BoundField DataField="retired" HeaderText="retired" SortExpression="retired" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:TemplateField>
                        <ItemTemplate>
<%--                            <asp:HyperLink ID="HyperLink1" runat="server" class="waves-effect waves-light btn" NavigateUrl='<%# Eval("MagID", "~/MyMagazines.aspx?ret={0}") %>' Text="retire"></asp:HyperLink>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
<%--                            <asp:HyperLink ID="HyperLink1" runat="server" class="waves-effect waves-light btn" NavigateUrl='<%# Eval("MagID", "~/MyMagazines.aspx?pid={0}") %>' Text="post"></asp:HyperLink>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ReMag-DBConnectionString %>"
                SelectCommand="SELECT MagID, title, posted, retired, image, description, type, [user], price FROM MyMags WHERE ([user] = @userID) and retired = @retired ORDER BY MagID DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="userID" SessionField="LoggedInID" />
                    <asp:ControlParameter ControlID="ddl_Retired" Name="retired" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <div id="snackbar">Some text some message..</div>
            <%--------%>

            <%--Add New Mag Box--%>
            <div id="modal3" class="modal">
                <div class="modal-content">
                    <ul class="collapsible">
                        <li class="active">
                            <div class="collapsible-header"><i class="material-icons">filter_drama</i>Add New Magazine</div>
                            <div class="collapsible-body">
                                <div class="input-field col s12">
                                    <input runat="server" id="txtTitle" type="text" class="validate" />
                                    <label for="txtTitle">Title</label>
                                </div>
                                <div class="input-field col s12">
                                    <input runat="server" id="txtDescription" type="text" class="validate" />
                                    <label for="txtDescription">Description</label>
                                </div>
                                <p>
                                    <label>
                                        <input id="chksingle" runat="server" class="with-gap" name="group1" type="radio" />
                                        <span>Single Issue</span>
                                    </label>
                                </p>
                                <p>
                                    <label>
                                        <input class="with-gap" name="group1" type="radio" />
                                        <span>Subscription</span>
                                    </label>
                                </p>
                                <div class="input-field col s12">
                                    <input runat="server" id="txtPrice" type="text" class="validate" />
                                    <label for="txtPrice">Price</label>
                                </div>
                                <div class="modal-footer">
                                    <a runat="server" class="modal-close waves-effect waves-green btn-flat" onserverclick="AddNewMag_ServerClick">Confirm</a>
                                    <a class="modal-close waves-effect waves-green btn-flat">Cancel</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <%------------------%>

            <%--Log Out Box--%>
            <div id="modal2" class="modal">
                <div class="modal-content">
                    <ul class="collapsible">
                        <li class="active">
                            <div class="collapsible-header"><i class="material-icons">filter_dramarama</i>Log Out</div>
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

