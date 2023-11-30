<%@ page import = "java.sql.*"%>
<%! Connection connection;
        PreparedStatement ps;
        ResultSet rs;
        String message;
        String id;
        String name;
        int regno;
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
    id= (String) session.getAttribute("id1");
    ps=connection.prepareStatement("select * from student1 where id=?");
    ps.setInt(1,Integer.parseInt(id));
    rs=ps.executeQuery();
    while(rs.next())
    {
        name=rs.getString("name");
        regno=rs.getInt("regno");
    }
%>
<form action="" method="post">
    Name: <input type="text" name="name" value="<%=name%>"><br><br>
    Regno: <input type="text" name="regno" value="<%=regno%>"><br><br>
    <button type="submit">Click</button>
</form>
<% 
    String val1=request.getParameter("name");
    String val2=request.getParameter("regno");
    if(val1!=null && val2!=null)
    {
        ps= connection.prepareStatement("Update student1 set name=? , regno=? where id=?");
        ps.setString(1,val1);
        ps.setInt(2,Integer.parseInt(val2));
        ps.setInt(3,Integer.parseInt(id));
        ps.executeUpdate();
        session.setAttribute("id1",null);
        response.sendRedirect("1.jsp");
    }

%>