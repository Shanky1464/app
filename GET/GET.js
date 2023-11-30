$(document).ready(function(){
    $("#mybutton").click(function(){
        $.ajax({
            type:"GET",
            url:"newfile.JSON",
            success: function(data,result)
            {
                $("#tell").text(data.name);
            }
        })     
    });
});

