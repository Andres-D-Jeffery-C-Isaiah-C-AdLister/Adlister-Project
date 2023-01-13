<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>

    <style>
        li, a{
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
    </style>
</head>
<body>
<%--    <jsp:include page="/WEB-INF/partials/navbar.jsp" />--%>
<header>
    <a class="logo" href="/ads">The Rug Plug</a>
    <nav>
        <ul class="nav-links">
            <li><a href="/login">Login</a></li>
        </ul>
    </nav>
    <a href="https://www.disneyclips.com/goodies/images/aladdinwallpaper32.jpg" class="logout">We can show you the world</a>
</header>


    <div class="container">
        <h1>Hey kid, want to buy some rugs?!</h1>
    </div>
</body>
</html>
