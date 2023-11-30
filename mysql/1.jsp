<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="post">
        Name: <input type="text" name="name"><br><br>
        Regno: <input type="text" name="regno"><br><br>
        <button type="submit">Click</button>
    </form>
    <%! Connection connection;
        PreparedStatement ps;
        ResultSet rs;
        String message;
    %>
    <%
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/student";
            connection=DriverManager.getConnection(url,"root","");
        }
        catch(Exception e)
        {
            out.print(e);
        }
    %>

    <% 
        String val1=request.getParameter("name");
        String val2=request.getParameter("regno");
        if(val1!=null && val2!=null)
        {
            ps= connection.prepareStatement("Insert into student1(name,regno) values(?,?)");
            ps.setString(1,val1);
            ps.setInt(2,Integer.parseInt(val2));
            ps.executeUpdate();
        }
    %>
    <%
        ps=connection.prepareStatement("Select * from student1 order by regno");
        rs=ps.executeQuery();
    %>
    <%
        String id=request.getParameter("id");
        if(id!=null)
        {
            ps=connection.prepareStatement("delete from student1 where id=?");
            ps.setInt(1,Integer.parseInt(id));
            ps.executeUpdate();
        }
    %>
    <%
        String id1=request.getParameter("id1");
        if(id1!=null)
        {
            session.setAttribute("id1",id1);
            response.sendRedirect("update.jsp");
            

        }
    %>
    
    <table border="1px">
        <thead>
            <tr>
                <th>Name</th>
                <th>Regno</th>
                <th>Delete</th>
                <th>Update</th>
            </tr>
        </thead>
        <tbody>
                <%while(rs.next()){%>
                    <tr>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getInt("regno")%></td>
                        <td> 
                            <form method="post"> 
                                <input type="hidden" name="id" value="<%=rs.getInt("id")%>"> 
                                <button type="submit">Delete</button> 
                            </form> 
                        </td>
                        <td>
                            <form method="post"> 
                                <input type="hidden" name="id1" value="<%=rs.getInt("id")%>"> 
                                <button type="submit">Update</button> 
                            </form> 
                        </td>
                    </tr>
                
                <%  }  
                %>
                
        </tbody>
    </table>


</body>
</html>