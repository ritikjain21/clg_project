<%@include file="checklogin.jsp"%>
<!doctype html>
<html lang="en">


  <%@ page import = "java.sql.*" %>
  <%
  String mail = null;
  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/clg_project?allowPublicKeyRetrieval=true&useSSL=false",
        "root", "root");
    Statement st = con.createStatement();
    session = request.getSession();
    String email =(String)session.getAttribute("email");
    String q = "select * from registereduser where EMAIL='"+email+"' ";
    ResultSet rs = st.executeQuery(q);
    if(rs.next())
    {
      mail = rs.getString("EMAIL");
  %>



<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
  <link rel="stylesheet" href="profile.css">
  <title>Profile2</title>
<script>
  function show()
        {
          if(x)
          {
             alert()
          }
          else{

          }
        }
</script>

</head>

<body>
  <div class="nav-buttton">
    <a href="Home2.jsp" >&nbsp;&nbsp;Back&nbsp;&nbsp; </a>
    <a href="Logout.jsp" onclick="show()">Logout</a>
  </div>
  <div class="container">
    <div class="row">
      <div class="col-lg-4">
        <div class="profile-card-4 z-depth-3">
          <div class="card">
            <div class="card-body text-center bg-primary rounded-top">
              <div class="user-box" id="abc">
                <%
                if(rs.getBytes("IMAGE")!=null && rs.getBytes("IMAGE").length!=0)
                {
                  %>
                <img src=<%="showdp?email="+mail%> >
                <%
                }
                else
                {
                %>
                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" >
                <%
                }
                %>

              </div>
              <h5 class="mb-1 text-white" id="pName"></h5>
              <h6 class="text-light"> <% if(rs.getString(1)!=null) out.println(rs.getString(1)); %></h6>
            </div>
            <div class="card-body">
              <ul class="list-group shadow-none">
                <li class="list-group-item">
                  <div class="list-icon">
                    <i class="fa fa-phone-square"></i>
                  </div>
                  <div class="list-details">
                    <span id="pMob"><% if(rs.getString(2)!=null) out.println(rs.getString(2)); %></span>
                    <small>Mobile Number</small>
                  </div>
                </li>
                <li class="list-group-item">
                  <div class="list-icon">
                    <i class="fa fa-envelope"></i>
                  </div>
                  <div class="list-details">
                    <span id="pEmail"><% if(rs.getString(3)!=null) out.println(rs.getString(3)); %></span>
                    <small>Email</small>
                  </div>
                </li>

                <li class="list-group-item">
                  <div class="list-icon">
                    <i class="fa fa-envelope"></i>
                  </div>
                  <div class="list-details">
                    <span id="pAddress"><% if(rs.getString(5)!=null) out.println(rs.getString(5)); %></span>
                    <small>Address</small>
                  </div>
                </li>
                <li class="list-group-item">
                  <div class="list-icon">
                    <i class="fa fa-envelope"></i>
                  </div>
                  <div class="list-details">
                    <span id="pCity"><% if(rs.getString(6)!=null ) out.println(rs.getString(6)); %> </span>
                  <small>City</small>
                  </div>
                </li>
                
                <li class="list-group-item">
                  <div class="list-icon">
                    <i class="fa fa-envelope"></i>
                  </div>
                  <div class="list-details">
                    <span id="pState">
                      <% if(rs.getString(7)!=null ) out.println(rs.getString(7));%> </span>
                  <small>State</small>
                  </div>
                </li>
              </ul>
            </div>

          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card z-depth-3">
          <div class="card-body">

            <ul class="nav nav-pills nav-pills-primary nav-justified">
              <li class="nav-item">
                <a href="javascript:void();" data-target="#edit" data-toggle="pill" class="nav-link"><i
                    class="icon-note"></i> <span class="hidden-xs">Edit</span></a>
              </li>
            </ul>

            <div class="tab-pane" id="edit">
              <form action="updateProfile" method="POST" enctype="multipart/form-data" >
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label">First name</label>
                  <div class="col-lg-9">
                    <input class="form-control" type="text" value='<%= rs.getString(1) %>' id="textName" name="u1" >
                  </div>
                </div>
                 
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label">Mobile</label>
                  <div class="col-lg-9">
                    <input class="form-control" id="textMob" type="text" name="u2"  value='<%= rs.getString(2) %>'>
                  </div>
                  
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label">Email</label>
                  <div class="col-lg-9">
                    <input class="form-control  emailip" id="textEmail" type="email" name="u3" value='<%= rs.getString(3) %>'readonly>
                  </div>
                </div>
                
                </div>
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label">Change profile</label>
                  <div class="col-lg-9">
                    <input class="form-control" type="file" name="u8">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label">Address</label>
                  <div class="col-lg-9">
                    <input class="form-control" id="textStreet" type="textStreet" value='<% if(rs.getString(5)!=null ) out.println(rs.getString(5));%>' name="u4"
                      placeholder="Street">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label"></label>
                  <div class="col-lg-6">
                    <input class="form-control" id="textCity" type="textCity" value='<% if(rs.getString(6)!=null ) out.println(rs.getString(6));%>' name="u5" placeholder="City">
                  </div>
                  <div class="col-lg-3">
                    <input class="form-control" id="textState" type="textState" value='<% if(rs.getString(7)!=null ) out.println(rs.getString(7));%>' name="u6" placeholder="State">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label">Password</label>
                  <div class="col-lg-9">
                    <input class="form-control" type="password" name="u7" value='<%= rs.getString(4) %>'>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-lg-3 col-form-label form-control-label"></label>
                  <div class="col-lg-9">
                    <input type="reset" class="btn btn-secondary" value="Cancel">
                    <input type="submit" class="btn btn-primary" value="Save Changes" id="btnSave">
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
  </div>

  <!-- Optional JavaScript; choose one of the two! -->

  <!-- Option 1: Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
    crossorigin="anonymous"></script>

  <!-- Option 2: Separate Popper and Bootstrap JS -->
  <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    -->
</body>
<%
    }
    else{
      out.println("Some internal Issue please Login Again");
    }
con.close();
  }
  catch(Exception e)
  {
    out.println("Error"+e);
  }
%>
</html>