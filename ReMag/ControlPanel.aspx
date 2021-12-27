<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ControlPanel.aspx.cs" Inherits="ControlPanel" %>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>ReMag Control Panel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="myStyles.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="myJavaScript.js"></script>
    <meta name="keywords" content="ReMag Michael Strong Resell Magazines" />
    <meta name="author" content="Michael Strong" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>
        #map {
            height: 700px;
        }

        body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
    <script src="frameworks\js\jquery-3.3.1.min.js"></script>
</head>
<body class="green lighten-4">
    <form id="form2" runat="server">
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

        <div>
            <h3>Control Panel</h3>
        </div>
        <div style="padding-bottom:15px;">
            <table style="border-collapse:inherit">
                <tr style="padding:0px">
                    <td style="padding:0px" width="200px">Number of Mags Active: </td>
                    <td style="padding:0px" width="200px"><input id="magsActive" runat="server" type="text" style="border: 0"/></td>
                    <td style="padding:0px" width="200px">Number of Mags Retired: </td>
                    <td style="padding:0px"width="200px"><input id="magsRetired" runat="server" type="text" style="border: 0"/></td>
                </tr>
                <tr style="padding:0px">
                    <td style="padding:0px" width="200px">Number of Mags Posted: </td>
                    <td style="padding:0px" width="200px"><input id="magsPosted" runat="server" type="text" style="border: 0"/></td>
                    <td style="padding:0px" width="200px">Number of Registered Users: </td>
                    <td style="padding:0px" width="200px"><input id="magUsers" runat="server" type="text" style="border: 0"/></td>
                </tr>
            </table>
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProfileID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ProfileID" HeaderText="ProfileID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="text" runat="server" Text="Name"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" class="class_name" Text='<%# Eval("Name")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Telephone" HeaderText="Telephone" SortExpression="Telephone" />
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="text" runat="server" Text="Address"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" class="class_address" Text='<%# Eval("Address")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="text" runat="server" Text="City"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" class="class_city" Text='<%# Eval("City")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="text" runat="server" Text="State"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" class="class_state" Text='<%# Eval("State")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="text" runat="server" Text="Zip"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" class="class_zip" Text='<%# Eval("Zip")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="text" runat="server" Text="Country"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" class="class_country" Text='<%# Eval("Country")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Bio" HeaderText="Bio" SortExpression="Bio" />
                    <asp:BoundField DataField="GetNewMags" HeaderText="GetNewMagEmails" SortExpression="GetNewMags" />
                    <asp:BoundField DataField="LastLogIn" HeaderText="LastLogIn" SortExpression="LastLogIn" DataFormatString = "{0:yyyy-MM-dd h:mm:ss tt}">
                         <ItemStyle Wrap="False" />
                    </asp:BoundField>
                </Columns>

                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ReMag-DBConnectionString %>" SelectCommand="SELECT Profile.Country, Profile.ProfileID, Profile.Name, Profile.Email, Profile.Address, Profile.Bio, Profile.Telephone, Profile.City, Profile.Zip, Profile.GetNewMags, Profile.State, newTable.LastLogIn FROM Profile FULL OUTER JOIN (SELECT MAX(UDDateTime) AS LastLogIn, UserID FROM Logging GROUP BY UserID) AS newTable ON newTable.UserID = Profile.ProFileID WHERE ProfileID > 0 ORDER BY Profile.ProfileID;"></asp:SqlDataSource>
        </div>

    </form>

    <div id="map"></div>

    <script>

        var alerts = "";
        var showAlerts = 0;

        function geocodeAddress(geocoder, resultsMap) {
            var allAddresses = [];
            var gotAddress = document.getElementsByClassName("class_address");
            var gotCity = document.getElementsByClassName("class_city");
            var gotZip = document.getElementsByClassName("class_zip");
            var gotName = document.getElementsByClassName("class_name");
            var gotState = document.getElementsByClassName("class_state");
            var gotCountry = document.getElementsByClassName("class_country");
            for (var i = 0; i < gotAddress.length; i++) {
                if (gotAddress[i].innerHTML == "") {
                    showAlerts = 1;
                    alerts = alerts + 'Address is missing or invalid for User: ' + gotName[i].innerHTML + "\r\n";
                } else {
                    allAddresses.push(gotAddress[i].innerHTML + ", " + gotCity[i].innerHTML + ", " + gotState[i].innerHTML + ", " + gotZip[i].innerHTML + ", " + gotCountry[i].innerHTML);
                    geocoder.geocode({ 'address': allAddresses[i] }, function (results, status) {
                        if (status === 'OK') {
                            resultsMap.setCenter(results[0].geometry.location);
                            var marker = new google.maps.Marker({
                                map: resultsMap,
                                position: results[0].geometry.location
                            });
                            var content = results[0].formatted_address;
                            var infowindow = new google.maps.InfoWindow();
                            google.maps.event.addListener(marker, 'click', (function (marker, content, infowindow) {
                                return function () {
                                    infowindow.setContent(content);
                                    infowindow.open(map, marker);
                                };
                            })(marker, content, infowindow));
                        } else {
                            showAlerts = 1;
                            alerts = alerts + 'Geocode was not successful for the following reason: ' + status + "\r\n";
                        }
                    });
                }
            }
            if (showAlerts == 1)
            {
                alert(alerts);
            }
        }

        function initMap() {
            var myLatLng = { lat: -25.363, lng: 131.044 };
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 4,
                center: myLatLng
            });
            var geocoder = new google.maps.Geocoder();
            geocodeAddress(geocoder, map);
        }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBFS2eVSx4SfDOXkfxsgTWFjdzOrVMPqXU&callback=initMap"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>
