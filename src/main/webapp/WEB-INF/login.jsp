<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
    <%--    <link rel="stylesheet" href="src/main/styles/navbar.css">--%>
    <style>
        /*nav bar*/
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
        /*nav bar*/
        /*body*/
        .container{
            position: absolute;
            width: 400px;
            height: 400px;
            /* Center form on page horizontally & vertically */
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #041b31;
        }
        .title{
            text-align: center;
            color: white;
        }
        label{color: white;}
        #new-account{
            margin: 10px 0 5px 0;
            color: white;
        }
        .register{
            color: grey;
            font-size: 14px;
        }
    </style>
</head>
<body>
<%--    <jsp:include page="/WEB-INF/partials/navbar.jsp" />--%>
<header>
    <a class="logo" href="">The Rug Plug</a>
    <nav>
        <ul class="nav-links">

        </ul>
    </nav>
    <a href="" class=""></a>
</header>



<div class="container">

    <% String msg;
        if (session.getAttribute("msg") != null) {
            response.setContentType("text/html");
            PrintWriter output = response.getWriter();
            msg = (String) session.getAttribute("msg");
            output.print("<p style='color:red;'> " + msg + " </p>");
        }
    %>

    <h1 class="title">Log In</h1>
    <p class="title">Please enter your login and password</p>
    <form action="/login" method="POST">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password">
        </div>
        <div>
            <input type="submit" class="btn btn-info btn-block" value="Log In">
            <p id="new-account">Don't have an account?</p>
            <a class="register" href="http://localhost:8080/register">Register Here!</a>
        </div>
    </form>
</div>
</body>
</html>