<%
    int i1=Integer.parseInt(request.getParameter("num1"));
    int i2=Integer.parseInt(request.getParameter("num2"));
    out.print("{\"power\":" + i2*i1+ ',' + " \"fact\":" + (i1+i2) +"}");
%>
