// Script called when connection is required

window.onload = function () {
    $.ajax({
        url: "../model/user_management.php",
        type: "post",
        dataType: 'json',
        data: {
            whatDoIDo: "user_connected_check",
            mustBeConnected: true,
        },
        success: function (result) {
            console.log('===== USER CONNECTED =====');
            console.log(result);
        },
        error: function (jqXHR, exception) {
            console.log('===== ERROR =====');
            console.log("ERROR IN SCRIPT CONNECTED - TRUE");
            window.location.replace("index.html");
            console.log(jqXHR.responseText);
        },
    });
}