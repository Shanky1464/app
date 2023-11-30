$(document).ready(function()
{
    $("#mybutton").click(function()
    {
        $.ajax({
            type:"POST",
            url:"1.jsp",
            data:{
                // <!--  (Empid, EmpName, age, DOB, Designation, email-ID, city). -->
                id:$("#id").val(),
                name:$("#name").val(),
                age:$("#age").val(),
                dob:$("#dob").val(),
                desig:$("#desig").val(),
                email:$("#email").val(),
                city:$("#city").val(),
            },
            success:function(result,data)
            {
                alert("INsertion success");
            }
        })
    });
});