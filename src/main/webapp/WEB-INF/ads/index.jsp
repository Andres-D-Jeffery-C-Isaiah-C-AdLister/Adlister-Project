<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
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

        button{
            padding: 5px 20px  ;
            background-color: #5bc0de;
            border:none;
            border-radius: 50px;
            cursor: pointer;
        }


    </style>
</head>
<body>
<%--<jsp:include page="/WEB-INF/partials/navbar.jsp" />--%>
<header>
    <a class="logo" href="">The Rug Plug</a>
    <nav>
        <ul class="nav-links">
            <li><a href="/profile">My Profile</a></li>
            <li><a href="/ads">Local Ads</a></li>
        </ul>
    </nav>
    <a href="/logout" class="logout"><button>Logout</button></a>
</header>



<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>

</body>
</html>
