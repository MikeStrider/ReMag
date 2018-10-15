$(document).ready(function () {
    $('.sidenav').sidenav();
    $('.modal').modal();
    $('.modal2').modal();
    $('.collapsible').collapsible();
    $('select').formSelect();

    $.urlParam = function (name) {
        var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
        if (results == null) {
            return null;
        }
        else {
            return decodeURI(results[1]) || 0;
        }
    }

    var x = document.getElementById("snackbar");
    if ($.urlParam('ln') == 'Y') {
        x.innerText = "success - you are now logged in";
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
    }
    if ($.urlParam('lo') == 'Y') {
        x.innerText = "success - you are now logged out";
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
    }
    if ($.urlParam('reg') == 'Y') {
        x.innerText = "success - you are now registered and logged in";
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
    }
    if ($.urlParam('lf') == 'Y') {
        x.innerText = "fail - invalid credentials";
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
    }
    if ($.urlParam('ex') == 'Y') {
        x.innerText = "fail - unable to create user, please check required fields";
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
    }
    if ($.urlParam('dn') == 'Y') {
        x.innerText = "fail - navigation denied, please login first";
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
    }
    if ($.urlParam('sc') == 'Y') {
        x.innerText = "success - profile has been saved";
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
    }

});



