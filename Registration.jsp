<html>
<%
String s1=  request.getParameter("u1");
String s2=  request.getParameter("u2");
String s3=  request.getParameter("u3");
String s4=  request.getParameter("u4");
if(s1==null) s1 = "";
if(s2==null) s2 = "";
if(s3==null) s3 = "";
if(s4==null) s4 = "";
%>
<head>
    <link rel="stylesheet" href="login2.css">

    
    <script>
        function show()
        {
            alert("Email Already Exists");
        }

        function validateForm(frm)
        {
                let nn=frm.name.value.trim();
                if(nn.length==0){
                        alert("Name required");
                        frm.name.focus();
                        return false;
                }
                let mm=frm.contact.value.trim();
                if(mm.length==0){
                        alert("Contact required");
                        frm.contact.focus();
                        return false;
                }
                let oo=frm.login.value.trim();
                if(oo.length==0){
                        alert("Email required");
                        frm.login.focus();
                        return false;
                }
                let pp=frm.password.value.trim();
                if(pp.length==0){
                        alert("Password required");
                        frm.password.focus();
                        return false;
                }
                return true;
        }
</script>
</head>
<%
String error = request.getParameter("error");
if(error == null) out.println("<body>");
else out.println("<body onload='show()'>");
    %>
    <div class="wrapper fadeInDown">
        <div id="formContent">
            <a href="Login.html">
                <h2 class="active"> Sign In </h2>
            </a>
            <h2> | </h2>
            <h2 class="inactive underlineHover">Sign Up </h2>
        </div>
        <div class="account">
            <p>Create Account Here</p>
        </div>
        <div class="formclass">
            <form action="regis" method="GET" onsubmit="return validateForm(this)" >
                <input type="text" id="name" class="fadeIn secondfourth" name="u1" placeholder="Name" value="<%=s1%>" /><br>
                <input type="text" id="contact" class="fadeIn secondfivth" name="u2" placeholder="Contact" value="<%=s2%>"/><br>
                <input type="email" id="login" class="fadeIn second" name="u3" placeholder="Email" value="<%=s3%>" /><br>
                <input type="password" id="password" class="fadeIn third" name="u4" placeholder="Password" value="<%=s4%>" /><br>
                <input type="submit" class="fadeIn fourth" value="SignIn" />
            </form>
        </div>
    </div>
</body>

</html>