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
        ResultSet rs = st.executeQuery("SELECT * FROM bookinfo");
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
            <input type="text" placeholder="search" id="headsearch"><button class="serchbtn"><i class="fas fa-search"></i></button>
        </div>
        <button class="btn"><a href="Registration.html">Login/SignUp</a></button>
        <button class="btn"><a href="front.html">Home</a></button>
    </div>
    <hr>
    
    <div class="hpstore">
        <%
            while(rs.next())
            {
        %>
        <div class="store">
            <img class="image" src="<%= rs.getString(4) %>" alt="logo">
            <button class="read"><a href="<%= rs.getString(3) %>">Read</a></button>
        </div>
        <%
            }
        %>

        <!-- <div class="store">
            <img class="image" src="Home1/hp2.jpg" alt="logo">
            <button class="read"><a href="https://drive.google.com/file/d/0Bx8RePQCi0zsREtfNE1YRWt6NEk/view?usp=sharing">Read</a></button>
        </div>

        <div class="store">
            <img class="image" src="Home1/hp3.jpg" alt="logo">
            <button class="read"><a href="https://drive.google.com/file/d/0Bx8RePQCi0zsNm9wZGxYR1Z2VnM/view?usp=sharing" >Read</a></button>
        </div>

        <div class="store">
            <img class="image" src="Home1/hp4.jpg" alt="logo">
            <button class="read"><a href="https://drive.google.com/file/d/0Bx8RePQCi0zsYXEzYktCZW1mTVE/view?usp=sharing" >Read</a></button>
        </div> -->
    </div>
    
</body>
<%
        con.close();
      }
      catch(Exception e){out.println(e);}


%>
</html>
