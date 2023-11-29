<%
    int p=Integer.parseInt(request.getParameter("p"));
    int t=Integer.parseInt(request.getParameter("t"));
    int r=Integer.parseInt(request.getParameter("r"));

    int si=(p*t*r)/100;
    out.print(si);
%>