// Script called when connection is NOT required

window.onload = function () {
    $.ajax({
        url: "../model/user_management.php",
        type: "post",
        dataType: 'json',
        data: {
            whatDoIDo: "user_connected_check",
            mustBeConnected: false,
        },
        success: function (result) {
            console.log('===== SUCCESS =====');
            if (result['isConnected'] == true) {
                window.location.replace("profile.html");
            }
        },
        error: function (jqXHR, exception) {
            console.log('===== ERROR =====');
            console.log("ERROR IN SCRIPT CONNECTED - FALSE");
            console.log(jqXHR.responseText);
        },
    });
}
