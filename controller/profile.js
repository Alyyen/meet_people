// Script called when a user is connected and access to his profile

$(document).ready(function () {
    $.ajax({
        url: "../model/user_management.php",
        type: "post",
        dataType: 'json',
        data: {
            whatDoIDo: "profile",
        },
        success: function (result) {
            console.log('===== SUCCESS =====');
            $('#user-data').append('<p>Firstname : ' + result['datas']['firstname'] + '</p>');
            $('#user-data').append('<p>Lastname : ' + result['datas']['lastname'] + '</p>');
            $('#user-data').append('<p>Birthdate : ' + result['datas']['birthdate'] + '</p>');
            $('#user-data').append('<p>City : ' + result['datas']['city'] + '</p>');
            $('#user-data').append('<p>Mail : ' + result['datas']['mail'] + '</p>');
            $('#user-data').append('<p>Gender : ' + result['datas']['genre'] + '</p>');
            $('#user-data').append('<p>Hobby : ' + result['datas']['name'] + '</p>');
        },
        error: function (jqxhr, exception) {
            console.log('===== ERROR =====');
            console.log(jqxhr.responseText);
            console.log("ERROR IN SCRIPT PROFILE");
            window.location.replace("index.html");
        },
    });
});
