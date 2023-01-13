<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>

    <style>
        /*navbar starts*/
        header li, a{
            font-size: 16px;
            color: white;
            text-decoration: none;
        }

        header{
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 10%;
            background-color: #041b31;
        }

        .logo{
            cursor: pointer;
            font-weight: bold;
        }

        nav{
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .nav-links{
            padding: 0;
            margin: 0;
            list-style: none;
        }

        .nav-links li{
            display: inline-block;
            padding: 0 20px;
        }

        header a:hover{
            color: #5bc0de;
            text-decoration: none;
            transition: all .3s ease-in;
        }

        .logout{
            padding: 5px 20px  ;
            background-color: #5bc0de;
            border:none;
            border-radius: 50px;
            cursor: pointer;
        }
        /*nav bar ends*/
    </style>
</head>






 <body>
 <%--navbar starts--%>
 <header>
     <a class="logo" href="">The Rug Plug</a>
     <nav>
         <ul class="nav-links">
             <li><a href="/profile">My Profile</a></li>
             <li><a href="/ads">Local Ads</a></li>
         </ul>
     </nav>
     <a href="/logout" ><button class="logout">Logout</button></a>
 </header>
 <%--navbar ends--%>

    <div class="container">


        <% String msg;
            if (session.getAttribute("msg") != null) {
                response.setContentType("text/html");
                PrintWriter output = response.getWriter();
                msg = (String) session.getAttribute("msg");
                output.print("<p style='color:red;'> " + msg + " </p>");
            }
        %>

        <h1>Please fill in your information.</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="r_username">Username</label>
                <input id="r_username" name="username" class="form-control" type="text" required>
            </div>
            <div class="form-group">
                <label for="r_email">Email</label>
                <input id="r_email" name="email" class="form-control" type="text" required>
            </div>
            <div class="form-group">
                <label for="r_password">Password</label>
                <input id="r_password" name="password" class="form-control" type="password" required pattern=".{10,}" title="10 or more characters">
            </div>
            <div class="form-group">
                <label for="r_confirm_password">Confirm Password</label>
                <input id="r_confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>

</body>
</html>
