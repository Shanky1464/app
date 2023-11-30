$(document).ready(function()
{
    var something;
    // $.ajax({
    //     type:"GET",
    //     url:"file1.txt",
    //     success: function(result,data)
    //     {
    //         console.log(result);
    //         var array=result.split("y");
    //         $("#tell").text(array.join("e"));
    //     }
    // })     
    $.ajax({
        type:"GET",
        url:"file2.txt",
        success: function(result,data)
        {
            var array=result.split("\r\n");
            array=array.slice(0,array.length-1);
            for (let i = 0; i < array.length; i++) 
            {
                array[i]=array[i].trim()
                array[i]=array[i].slice(0,array[i].length-1);
                array[i]+='y';
            }
            something=array.join("\n");
            // console.log(something);
            $("#tell").text(something);
            $.ajax({
                type:"POST",
                url:"12.jsp",
                data:
                {
                    data1:something,
                },
                success: function(result,data)
                {
                    console.log(result);
                }
            })    
        }
    })
     
});

