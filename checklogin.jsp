<%
session = request.getSession();
//if(session == null) response.sendRedirect("Login.html");
if(session.getAttribute("email") == null)response.sendRedirect("Login.html");
%>