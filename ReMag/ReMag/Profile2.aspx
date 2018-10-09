<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile2.aspx.cs" Inherits="ReMag.Profile2" %>

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
                    <a href="default.aspx" class="brand-logo">ReMag</a>
                    <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="Profile2.aspx">Profile</a></li>
                        <li><a href="badges.html">Shop</a></li>
                        <li><a href="collapsible.html">Explore</a></li>
                        <li><a class="waves-effect waves-light btn modal-trigger" href="#modal1">Log In</a></li>
                    </ul>
                </div>
            </nav>

            <ul class="sidenav" id="mobile-demo">
                <li><a href="Profile2.aspx">Profile</a></li>
                <li><a href="badges.html">Shop</a></li>
                <li><a href="collapsible.html">Explore</a></li>
                <li><a class="waves-effect waves-light btn modal-trigger" href="#modal1">Log In</a></li>
            </ul>

            <h1>Profile</h1>
            <p>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                        <asp:BoundField DataField="bio" HeaderText="bio" SortExpression="bio" />
                    </Columns>
                </asp:GridView>
            </p>
        </div>
    </form>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnSelecting="SqlDataSource1_Selecting" 
        ConnectionString="<%$ ConnectionStrings:ReMag-DBConnectionString %>" 
        SelectCommand="SELECT * FROM [Profile]"></asp:SqlDataSource>



    <script type="text/javascript">

        $(document).ready(function () {
            $('.sidenav').sidenav();
        });

    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
