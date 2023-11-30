<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%
    try
    {
        String data=request.getParameter("data1");

        File newFile = new File("C:\\xampp\\tomcat\\webapps\\app\\question12\\file2.txt");
        FileWriter writer = new FileWriter(newFile);
        writer.write(data);
        writer.close();

        out.print("success");
        
    }
    catch(Exception e)
    {
        out.print(e);
    }
%>