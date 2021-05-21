<%
session = request.getSession();
session.invalidate();
response.sendRedirect("Login.html");
%>