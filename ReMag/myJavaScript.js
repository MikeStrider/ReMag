function ShowFailedToast(message) {
    var x = document.getElementById("snackbar");
    x.innerText = message;
    x.className = "show";
    x.style.backgroundColor = "rgb(220,45,45)";
    setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
}

function ShowSuccessToast(message) {
    var x = document.getElementById("snackbar");
    x.innerText = message;
    x.className = "show";
    x.style.backgroundColor = "rgb(95,174,42)";
    setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
}

$(document).ready(function () {
    $('.modal').modal();
    $('.collapsible').collapsible();
    $('select').formSelect();
    $('.sidenav').sidenav();
    $('.carousel').carousel({
        fullWidth: false,
        indicators: true,
        padding: 50,
        onCycleTo: function (data) {
            document.getElementById("hiddenID").value = data.children[0].getAttribute('src');;
        }
    });

    $('.moveNextCarousel').click(function (e) {
        e.preventDefault();
        e.stopPropagation();
        $('.carousel').carousel('next');
    });

    $('.movePrevCarousel').click(function (e) {
        e.preventDefault();
        e.stopPropagation();
        $('.carousel').carousel('prev');
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
    if ($.urlParam('ad') == 'Y' && document.getElementById("Label1").innerText == "Label") {
        x.innerText = "success - magazine has been added";
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
    }
    if ($.urlParam('up') == 'Y') {
        x.innerText = "success - image has been uploaded";
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
    }
    if ($.urlParam('up') == 'N') {
        x.innerText = "failed - see stack for more info";
        x.className = "show";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
    }
    if ($.urlParam('vo') == 'Y') {
        document.getElementById("useoptions").style.display = "none";
    }
    if ($.urlParam('pt') == 'Y') {
        x.innerText = "mag has been posted";
        x.className = "show";
        x.style.backgroundColor = "rgb(95,174,42)";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
    }
    if ($.urlParam('pt') == 'N') {
        x.innerText = "mag has been unposted";
        x.className = "show";
        x.style.backgroundColor = "rgb(95,174,42)";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
    }
    if ($.urlParam('idr')) {
        x.innerText = "mag has been retired";
        x.className = "show";
        x.style.backgroundColor = "rgb(95,174,42)";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
    }
    if ($.urlParam('nodelete')) {
        x.innerText = "cannot delete last image";
        x.className = "show";
        x.style.backgroundColor = "rgb(220,45,45)";
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 4000);
    }
    if (($.urlParam('vo') == 'Y') && (window.location.pathname == "/images2.aspx")) {
        document.getElementById("useoptions").style.display = "none";
        document.getElementById("buyit").style.display = "inline-block";
    } else if (window.location.pathname == "/images.aspx2") {
        document.getElementById("useoptions").style.display = "inline-block";
        document.getElementById("buyit").style.display = "none";
    }
});