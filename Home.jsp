<!DOCTYPE html>
<html lang="en">
    <%@ page import = "java.sql.*" %>
    <%
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/clg_project?allowPublicKeyRetrieval=true&useSSL=false",
            "root", "root");
        Statement st = con.createStatement();

        ResultSet rs =null;
        String srchbar = request.getParameter("srchbar");
        if(srchbar==null || srchbar.trim().equals(""))
        {
            rs = st.executeQuery("SELECT * FROM bookinfo");
        }
        else
        {
            rs=st.executeQuery("SELECT * FROM bookinfo where (AUTHOR = '"+srchbar+"' or NAME= '"+srchbar+"') ");
        }

    %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/cbc9066eb9.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="Home.css">
    <title>Document</title>
</head>

<body>
    <div class="homeheader">
        <img class="logo" src="logo.png" alt="logo">
        <div>
            <form>
            <input type="text" placeholder="search" id="headsearch" name="srchbar"><button type="submit" name="srchbtn" class="serchbtn"><i class="fas fa-search"></i></button>
            </form>
        </div>
        <div class="btn"><a href="Registration.jsp">Login/SignUp</a></div>
        <div class="btn"><a href="front.html">Home</a></div>
    </div>
    <hr>
    
    <div class="hpstore">
        <%
            if(rs.next() == false)
            {
                %>
                    <h2>No Books Found from the Name or Author Given...</h2>
                <%
            }
            else
            {
            do
            {
                %>
                <div class="store">
                        <img class="image" src="<%= rs.getString(4) %>" alt="logo">
                        <div class="author">Author:<%= rs.getString(5) %> </div>
                        <div class="bookname">Name:<%= rs.getString(2) %> </div>
                        <div class="read"><a href="<%= rs.getString(3) %>">Read</a></div>
                </div>
                <%
            }
            while(rs.next());
        }
        %>

    </div>
    <!-- Footer -->

</body>
<%
        con.close();
      }
      catch(Exception e){out.println(e);}


%>
</html>
