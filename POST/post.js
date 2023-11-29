 document.getElementById("save_data").onclick=function()
 {
    var xhr= new XMLHttpRequest();
    var data=
    {
        name:document.getElementById("txtName").value,
        address:document.getElementById("txtAddress").value,
        city : document.getElementById('txtCity').value,
        state : document.getElementById('txtState').value,
        zipCode : document.getElementById('txtZipCode').value,
        phone : document.getElementById('txtPhone').value,
        email : document.getElementById('txtEmail').value,
    }
    xhr.open("POST","post.jsp",true);
    xhr.send(JSON.stringify(data));
    xhr.onload=function()
    {
        if (xhr.status===200)
        {
            alert(xhr.response);    
        }
        
    }
 }
 
//  $(document).ready(function () {
//             $("#save_data").click(function () {
//                 $.ajax({
//                     url: "index.jsp",
//                     type: "post",
//                     data: {
//                         name: $('#txtName').val(),
//                         address: $('#txtAddress').val(),
//                         city: $('#txtCity').val(),
//                         state: $('#txtState').val(),
//                         zipCode: $('#txtZipCode').val(),
//                         phone: $('#txtPhone').val(),
//                         email: $('#txtEmail').val(),
//                     },
//                     success: function (data, result) {
//                         alert(data);
//                     }
//                 }
//                 );
//             });
//         });