<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ControlPanel.aspx.cs" Inherits="ControlPanel" %>

<!DOCTYPE html>

<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>ReMag - Admin Control Panel</title>
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
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <asp:Label ID="text" runat="server" Text="Name"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" class="class_name" Text='<%# Eval("Name")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
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
                    <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                    <asp:BoundField DataField="Bio" HeaderText="Bio" SortExpression="Bio" />
                    <asp:BoundField DataField="GetNewMags" HeaderText="GetNewMagEmails" SortExpression="GetNewMags" />
                    <asp:BoundField DataField="LastLogIn" HeaderText="LastLogIn" SortExpression="LastLogIn" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ReMag-DBConnectionString %>" SelectCommand="SELECT Profile.Id, Profile.Name, Profile.Email, Profile.Address, Profile.Bio, Profile.Phone, Profile.City, Profile.Zip, Profile.GetNewMags, Profile.State, newTable.LastLogIn FROM Profile FULL OUTER JOIN (SELECT MAX(UDDateTime) AS LastLogIn, Username FROM Logging GROUP BY Username) AS newTable ON newTable.Username = Profile.Name ORDER BY Profile.ID"></asp:SqlDataSource>
        </div>

    </form>

    <div id="map"></div>

    <script>

        function geocodeAddress(geocoder, resultsMap) {
            var allAddresses = [];
            var gotAddress = document.getElementsByClassName("class_address");
            var gotCity = document.getElementsByClassName("class_city");
            var gotName = document.getElementsByClassName("class_name");
            var gotState = document.getElementsByClassName("class_state");
            for (var i = 0; i < gotAddress.length; i++) {
                if (gotAddress[i].innerHTML == "") {
                    alert('Address is missing or invalid for User: ' + gotName[i].innerHTML);
                } else {
                    allAddresses.push(gotAddress[i].innerHTML + ", " + gotCity[i].innerHTML + ", " + gotState[i].innerHTML);
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
                            alert('Geocode was not successful for the following reason: ' + status);
                        }
                    });
                }
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

</body>
