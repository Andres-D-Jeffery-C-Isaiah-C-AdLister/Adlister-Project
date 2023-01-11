<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>

    <style>
        /*navbar starts*/
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

        .logout{
            padding: 5px 20px  ;
            background-color: #5bc0de;
            border:none;
            border-radius: 50px;
            cursor: pointer;
        }
        /*navbar ends*/

        #searchAds {
            height: 1em;
            width: 4em;
        }

        .allads-title{
            margin-left: 30px;
        }


        /*ads start*/
        .card{

            display: grid;
            grid-template-columns: auto;
            grid-template-rows: 200px 140px ;
            grid-template-areas: "image" "text";
            background: gainsboro;
            border-radius: 18px;
            text-align: justify;
            color: snow;
            transition: 0.5s;
            cursor: pointer;
            margin: 50px 15px;
            border: 8px solid black;
        }

        .card-text{
            grid-area: text;
            padding: 15px;
            background-color: #041b31;
        }

        .card-text h3, p{
            margin: 0;
        }

        .card-text h3{
            color: #5bc0de;
        }


        #card-btn{
            margin-top: 30px;
            padding: 0;
            height: 20px;
            width: 20px;
            background-color: limegreen;
            border: none;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .itemId{
            display: none;
        }
        /*ads start*/


    </style>
</head>
<body>
<%--<jsp:include page="/WEB-INF/partials/navbar.jsp" />--%>
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

<%--search form starts--%>
<div class="container">
    <form action="/search" method="POST">
        <div class="form-group">
            <label for="search">Search Ads</label>
            <input id="search" name="search" class="form-control" type="text">
        </div>
        <div>
            <input type="submit" class="btn btn-info btn-block" value="Search">
        </div>
    </form>
</div>
<%--search form ends--%>

<%--ads display starts--%>
<div class="container">
    <h2 class="allads-title">All Ads:</h2>

<%--    <label for="site-search">Search the site:</label>--%>
<%--    <input type="search" id="site-search" name="q">--%>

<%--    <button>Search</button>--%>

        <c:forEach var="ad" items="${ads}">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-text">
                        <h3 >${ad.title}</h3>
                        <p>${ad.description}</p>
                        <form   id="${ad.id}" class="itemId" action="/ads/ad-details" method="post">
                        <input class="itemId" type="text" name="ad.id" value="${ad.id}">
                        </form>
                        <button id="card-btn" form="${ad.id}" type="submit">+</button>
                    </div>
                </div>
            </div>
        </c:forEach>

</div>
<%--ads display ends--%>

</body>
</html>
