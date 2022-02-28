// Script called when a user wants to delete his account

$(function () {
    $("#deleteForm").submit(function (event) {
        event.preventDefault();
        let form = $(this);

        console.log({
            whatDoIDo: "profile_delete",
            data: getFormData(form),
        });

        $.ajax({
            url: "../model/user_management.php",
            type: "post",
            dataType: 'json',
            data: {
                whatDoIDo: "profile_delete",
                data: getFormData(form),
            },
            success: function (result) {
                console.log('===== SUCCESS =====');
                console.log(result);
                window.location.replace("index.html");
            },
            error: function (jqxhr, exception) {
                console.log('===== ERROR =====');
                console.log(jqxhr.responseText);
                console.log("ERROR IN SCRIPT PROFILE DELETE");
                window.location.replace("index.html");
            },
        });
    });
});