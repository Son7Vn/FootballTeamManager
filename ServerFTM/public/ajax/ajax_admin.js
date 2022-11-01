
$(document).ready(function() {
    const url = "https://ftm1112022.herokuapp.com"
    $("#selPic").on("change", function() {
        var data = new FormData();
        jQuery.each(jQuery('#selPic')[0].files, function(i, file) {
            console.log('avatar');
            data.append('avatar', file);
        });

        jQuery.ajax({
            url: 'https://ftm1112022.herokuapp.com/user/upload',
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST', // For jQuery < 1.9
            success: function(data){
                if(data.result==1){
                    // $("#imgAvatar").attr("src","upload/" + data.file);
                    const urlImg = url + "/upload/avatar/" + data.message.filename
                    
                    console.log(data.message.filename)
                    $("#imgTest").attr("src", urlImg)
                    
                }else{
                    alert("Upload fail!");
                }
            }
        });
    });
});