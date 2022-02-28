// Script called when a user updates his datas

$(document).ready(function () {
    $.ajax({
        url: "../model/user_management.php",
        type: "post",
        dataType: 'json',
        data: {
            whatDoIDo: "profile_view",
        },
        success: function (result) {
            console.log('===== SUCCESS =====');
            $("#firstname").val(result['datas']['firstname']);
            $("#lastname").val(result['datas']['lastname']);
            $("#city").val(result['datas']['city']);
        },
        error: function (jqxhr, exception) {
            console.log('===== ERROR =====');
            console.log(jqxhr.responseText);
            console.log("ERROR IN SCRIPT PROFILE UPDATE ");
            window.location.replace("update_profile.html");
        },
    });
});
