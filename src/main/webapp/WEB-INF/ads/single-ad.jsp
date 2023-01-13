
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Ad"/>
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

    /*.delete-btn{*/
    /*    padding: 5px 20px  ;*/
    /*    background-color: red;*/
    /*    color: white;*/
    /*    border:none;*/
    /*    border-radius: 50px;*/
    /*    cursor: pointer;*/
    /*}*/
    </style>
</head>
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

<body class="rugImg4">

            <h1>ad id: ${ad_id}</h1>
            <h1>title: ${title}</h1>
            <h1>description: ${getDescription}</h1>
            <h1>posted by: ${getUserId}</h1>

</body>


</html>


<%--request.setAttribute("title", newAd.getTitle());--%>
<%--request.setAttribute("getUserId", newAd.getUserId());--%>
<%--request.setAttribute("getDescription", newAd.getDescription());--%>
<%--request.setAttribute("ad_id", newAd.getId());--%>