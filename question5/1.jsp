<%@page import="java.sql.*"%>

<%
    try
    {
        String empid=request.getParameter("id");
        String name=request.getParameter("name");
        String dob=request.getParameter("dob");
        String email=request.getParameter("email");
        String city=request.getParameter("city");
        String desig=request.getParameter("desig");
        String age=request.getParameter("age"); 
        
        Connection connection;   
        PreparedStatement ps;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/mydatabase";
        connection=DriverManager.getConnection(url,"root","");

        ps=connection.prepareStatement("insert into employees values (?,?,?,?,?,?,?)");
        ps.setInt(1,Integer.parseInt(empid));
        ps.setString(2,name);
        ps.setInt(3,Integer.parseInt(age));
        ps.setString(4,dob);
        ps.setString(5,desig);
        ps.setString(6,email);
        ps.setString(7,city);
        out.print("Inserted");
        ps.executeUpdate();  
    }
    catch(Exception e)
    {
        out.print(e);
    }
%>