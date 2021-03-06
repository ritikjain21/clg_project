<%@include file="checklogin.jsp"%>
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
            rs = st.executeQuery("SELECT * FROM paidbooks");
        }
        else
        {
            rs=st.executeQuery("SELECT * FROM paidbooks where (AUTHOR = '"+srchbar+"' or NAME= '"+srchbar+"') ");
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
    <script>
        function show()
        {
            alert("successfully logged out");
        }
    </script>
</head>
<body>
    <div class="homeheader">
        <img class="logo" src="logo.png" alt="logo">
        <div>
            <form action="Home2.jsp">
            <input type="text" placeholder="search" id="headsearch" name="srchbar"><button type="submit" name="srchbtn" class="serchbtn"><i class="fas fa-search"></i></button>
            </form>
        </div>
        <div class="btn"><a href="profile.jsp"  >Profile</a></div>
        <div class="btn"><a href="Logout.jsp" onclick="show()">Logout</a></div>
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
                <div class="containerstore">
                <div class="store">
                    <img class="image" src="<%= rs.getString(4) %>" alt="logo">
                    <div class="author">Author:<%= rs.getString(5) %> </div>
                    <div class="bookname">Name:<%= rs.getString(2) %> </div>
                    <div class="read"><a href="<%= rs.getString(3) %>">Read</a></div>
                </div>
                </div>
                <%
            }
            while(rs.next());
        }
        %>
        <!-- <div class="store">
            <img class="image" src="Home2/m2.jpg" alt="logo">
            <button class="read"><a href="https://drive.google.com/file/d/0B0vdR_jt9M--YkVMTjV0eVFMNWc/view?usp=sharing">Read</a></button>
        </div> -->
<!-- 
        <div class="store">
            <img class="image" src="Home2/ls.jpg" alt="logo">
            <button class="read"><a href="https://drive.google.com/file/d/1Yvq27-qsSPOxjJakf1cXpWq76L0F0cu_/view?usp=sharing">Read</a></button>
        </div>

        <div class="store">
            <img class="image" src="Home2/dsa.jpg" alt="logo">
            <button class="read"><a href="https://drive.google.com/file/d/1xy3VXbTSPt9K0JSzEB51JDMOqJmeBMc9/view?usp=sharing" >Read</a></button>
        </div>

        <div class="store">
            <img class="image" src="Home2/dm.jpg" alt="logo">
            <button class="read"><a href="https://drive.google.com/file/d/0B-xGCX-DplrcRmp6T2pKLVg0YVk/view?usp=sharing" >Read</a></button>
        </div> -->
    </div>
    
</body>
<%
        con.close();
      }
      catch(Exception e){out.println(e);}


%>
</html>









<!-- 
<div class="hpstore">
    <div class="store">
        <img class="image" src="Home2/oop.jpg" alt="logo">
        <button class="read"><a href="https://drive.google.com/file/d/0B5tR1YhNBlD2R2hsRnM4bHJYelU/view?usp=sharing" >Read</a></button>
    </div>

    <div class="store">
        <img class="image" src="Home2/me.jpg" alt="logo">
        <button class="read"><a href="https://drive.google.com/file/d/1WZG0l5r-V9KKS8wp_dJlUU7WTFfR0iN0/view?usp=sharing" >Read</a></button>
    </div>

    <div class="store">
        <img class="image" src="Home2/os.jpg" alt="logo">
        <button class="read"><a href="https://drive.google.com/file/d/0B24JIcotKbLUR3lwZ2dKR0RiRDg/view?usp=sharing" >Read</a></button>
    </div>

    <div class="store">
        <img class="image" src="Home2/cn.jpg" alt="logo">
        <button class="read"><a href="https://drive.google.com/file/d/1w7cIECv0VXzAtOmXTB_WtPhQqPhvjiQk/view?usp=sharing">Read</a></button>
    </div>
</div>
<div class="hpstore">
    <div class="store">
        <img class="image" src="Home2/rsa.jpg" alt="logo">
        <button class="read"><a href="https://drive.google.com/file/d/0B2UOWEOhhi7ccFdiTjNqckQtTDg/view?usp=sharing">Read</a></button>
    </div>

    <div class="store">
        <img class="image" src="Home2/ja.jpg" alt="logo">
        <button class="read"><a href="https://drive.google.com/file/d/1yfWRXMwBZoVF07YdKzwe2Jquyy62Es90/view?usp=sharing">Read</a></button>
    </div>

    <div class="store">
        <img class="image" src="Home2/pyt.jpg" alt="logo">
        <button class="read"><a href="https://drive.google.com/file/d/0B2Y-n6IlHYliSXZxMk0xT0NSY1E/view?usp=sharing">Read</a></button>
    </div>

    <div class="store">
        <img class="image" src="Home2/htm.jpg" alt="logo">
        <button class="read" ><a href="https://drive.google.com/file/d/0B-wA8AXTnJv4bW9hZW9XYjdmLTA/view?usp=sharing">Read</a></button>
    </div>
</div> -->