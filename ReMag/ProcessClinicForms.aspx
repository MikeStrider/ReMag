<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProcessClinicForms.aspx.cs" Inherits="ProcessClinicForms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Michael Strong Projects</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="Helper_Code/meStyle.css" />
    <script src="Helper_Code/meJavaScript.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous" />
    <style>
        body {
            color: white;
        }

        .pointer {cursor: pointer;}

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

        /*Spinner*/
        .lds-spinner {
            display: inline-block;
            position: relative;
            width: 80px;
            height: 80px;
        }
            .lds-spinner div {
                transform-origin: 40px 40px;
                animation: lds-spinner 1.2s linear infinite;
            }
                .lds-spinner div:after {
                    content: " ";
                    display: block;
                    position: absolute;
                    top: 3px;
                    left: 37px;
                    width: 6px;
                    height: 18px;
                    border-radius: 20%;
                    background: #cef;
                }
                .lds-spinner div:nth-child(1) {
                    transform: rotate(0deg);
                    animation-delay: -1.1s;
                }
                .lds-spinner div:nth-child(2) {
                    transform: rotate(30deg);
                    animation-delay: -1s;
                }
                .lds-spinner div:nth-child(3) {
                    transform: rotate(60deg);
                    animation-delay: -0.9s;
                }
                .lds-spinner div:nth-child(4) {
                    transform: rotate(90deg);
                    animation-delay: -0.8s;
                }
                .lds-spinner div:nth-child(5) {
                    transform: rotate(120deg);
                    animation-delay: -0.7s;
                }
                .lds-spinner div:nth-child(6) {
                    transform: rotate(150deg);
                    animation-delay: -0.6s;
                }
                .lds-spinner div:nth-child(7) {
                    transform: rotate(180deg);
                    animation-delay: -0.5s;
                }
                .lds-spinner div:nth-child(8) {
                    transform: rotate(210deg);
                    animation-delay: -0.4s;
                }
                .lds-spinner div:nth-child(9) {
                    transform: rotate(240deg);
                    animation-delay: -0.3s;
                }
                .lds-spinner div:nth-child(10) {
                    transform: rotate(270deg);
                    animation-delay: -0.2s;
                }
                .lds-spinner div:nth-child(11) {
                    transform: rotate(300deg);
                    animation-delay: -0.1s;
                }
                .lds-spinner div:nth-child(12) {
                    transform: rotate(330deg);
                    animation-delay: 0s;
                }
        @keyframes lds-spinner {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }

    </style>
</head>
<body>
    <form id="form2" runat="server">
         <!-- #include file="myheader.html" -->
        <div id="main" style="text-align: center;">
            <a href="#">
                <div id="iconsize">
                    <div class="tooltip">
                        <i class="fas fa-arrow-circle-up"></i><span class="tooltiptext">scroll to top</span>
                    </div>
                </div>
            </a>
            <div id="spinner" style="display:none;" runat="server">
                <div style="color:#cef;">loading, please wait ...</div>
                <div class="lds-spinner"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
            </div>

            <h1>Process Clinic Form</h1>
            
            <div style="margin: auto;width:600px;padding: 20px;background:rgb(124,124,124)">
                <div>Upload the excel file and click submit.</div>
                <input type="text" id="txtMakePDF" runat="server" />
                <asp:Button Text="Make a PDF" runat="server" ID="btnMakePDF" OnClick="btnMakePDF_Click" />
            </div>
            <br /><br />
            
            <div id="myModal" class="modal" runat="server">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <asp:Label style="color: red; font-weight: 600" ID="Label1" runat="server" Text="Error"></asp:Label><br />
                    <asp:Label style="color: red; font-weight: 600" ID="lblErrorMsg" runat="server" Text=""></asp:Label>
                </div>
            </div>

            <script>

                var modal = document.getElementById("myModal");
                //var btn = document.getElementById("myBtn");
                var span = document.getElementsByClassName("close")[0];
                //btn.onclick = function () {
                //    modal.style.display = "block";
                //}
                span.onclick = function () {
                    modal.style.display = "none";
                    window.location.href = "Random.aspx";
                }
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                        window.location.href = "Random.aspx";
                    }
                }

                // use the loading image
                //document.getElementById("btnMakePDF").onclick = function () {
                //    window.scrollTo({ top: 0, behavior: "auto" });
                //    document.getElementById("spinner").style.display = "block";
                //}

            </script>
        </div>
    </form>
    <br /><br /><br /><br />
</body>
</html>
