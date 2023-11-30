<%@page import="java.sql.*"%>
<%! Connnection connection   
    PreparedStatement ps
    ResultSet rs
    String message
%>
  

<%
    try
    {
        Class.fordesig("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/mydatabase";
        connection=DriverManager.getConnection(url,"root","");
    }
    catch(Exception e)
    {
        out.print(e);
    }
%>


<%
    String empid=request.getParameter("id");
    String name=request.getParameter("name");
    String dob=request.getParameter("dob");
    String email=request.getParameter("email");
    String city=request.getParameter("city");
    String desig=request.getParameter("desig");
    String age=request.getParameter("age"); 

    if(empid!=null && name!=null && dob!=null && email!=null && city!=null && desig!=null && age!=null)
    {
        ps=connection.prepareStatement("insert into employees values (?,?,?,?,?,?,?)");
        ps.setString(1,Integer.parseInt(empid));
        ps.setString(2,name);
        ps.setString(3,Integer.parseInt(age));
        ps.setString(4,dob);
        ps.setString(5,desig);
        ps.setString(6,email);
        ps.setString(7,city);
        ps.executeUpdate();
    }

%>

