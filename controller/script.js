// GET AS JSON FILE THE DATAS

function getFormData($form) {
    let unindexed_array = $form.serializeArray();
    let indexed_array = {};

    $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];
    });

    return indexed_array;
}

// SUBSCRIPTION

$(function () {
    $("#subscriptionForm").submit(function (event) {
        event.preventDefault();
        let form = $(this);

        console.log({
            whatDoIDo: "subscription",
            data: getFormData(form),
        });
        $.ajax({
            url: "../model/user_management.php",
            type: "post",
            dataType: 'json',
            data: {
                whatDoIDo: "subscription",
                data: getFormData(form),
            },
            success: function (result) {
                console.log('===== SUCCESS =====');
                window.location.replace("connection.html");
                console.log(result);
            },
            error: function (jqXHR, exception) {
                console.log('===== ERROR =====');
                console.log("ERROR IN SCRIPT SUBSCRIPTION");
                console.log(jqXHR.responseText);
            },
        });
    });
});

// LOGIN

$(function () {
    $("#loginForm").submit(function (event) {
        event.preventDefault();
        let form = $(this);

        console.log({
            whatDoIDo: "login",
            data: getFormData(form),
        });
        $.ajax({
            url: "../model/user_management.php",
            type: "post",
            dataType: 'json',
            data: {
                whatDoIDo: "login",
                data: getFormData(form),
            },
            success: function (result) {
                console.log('===== SUCCESS =====');
                console.log(result);
                window.location.replace("profile.html");
            },
            error: function (jqxhr, exception) {
                console.log('===== ERROR =====');
                console.log("ERROR IN SCRIPT LOGIN");
                console.log(JSON.parse(jqxhr.responseText));
            },
        });
    });
});

// LOG OUT

$(document).ready(function () {
    $("#logout-btn").click(function () {
        console.log('log out');
        $.ajax({
            url: "../model/user_management.php",
            type: "post",
            dataType: 'json',
            data: {
                whatDoIDo: "logOut",
            },
            success: function (result) {
                console.log('===== SUCCESS =====');
                console.log(result);
                window.location.replace("index.html");
            },
            error: function (jqxhr, exception) {
                console.log('===== ERROR =====');
                console.log("ERROR IN SCRIPT LOGIN");
                window.location.replace("index.html");
            },
        });
    });
});

// PROFILE UPDATE

$(function () {
    $("#profileForm").submit(function (event) {
        event.preventDefault();
        let form = $(this);

        console.log({
            whatDoIDo: "profile_update",
            data: getFormData(form),
        });

        $.ajax({
            url: "../model/user_management.php",
            type: "post",
            dataType: 'json',
            data: {
                whatDoIDo: "profile_update",
                data: getFormData(form),
            },
            success: function (result) {
                console.log('===== SUCCESS =====');
                console.log(result);
                window.location.replace("profile.html");
            },
            error: function (jqxhr, exception) {
                console.log('===== ERROR =====');
                console.log(jqxhr.responseText);
                console.log("ERROR IN SCRIPT PROFILE UPDATE");
                window.location.replace("index.html");
            },
        });
    });
});