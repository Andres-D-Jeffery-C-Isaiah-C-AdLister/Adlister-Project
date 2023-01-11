<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
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


        .box{
            width: 50%
        }

        .sell{
            padding: 5px 20px  ;
            background-color: #FFB200;
            border:none;
            border-radius: 50px;
            cursor: pointer;
            color: black;
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
            height: 100%
        }

        .card-text h2, p{
            margin: 0;
        }

        .card-text h2{
            color: #5bc0de;
        }

        #cardbtn{
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
<%--    <jsp:include page="/WEB-INF/partials/navbar.jsp" />--%>
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


<%--ads display starts--%>
    <div class="container">
        <div>
            <div class="box">
                <h1>Welcome, ${sessionScope.user.username}!</h1>
            </div>
            <div class="box">
                <a href="/profile/update"><button class="sell">Update Profile</button></a>
            </div>
            <div class="box">
                <h2>Here are your ads:</h2>
            </div>
            <div class="box">
                <a href="/ads/create"><button class="sell">Sell</button></a>
            </div>

        </div>

<%--        <c:forEach var="ad" items="${userAds}">--%>
<%--            <div class="col-md-3">--%>
<%--                <div class="card">--%>
<%--                    <div class="card-text">--%>
<%--                        <h2>${ad.title}</h2>--%>
<%--                        <p>${ad.description}</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
        <h2>My Ads:</h2>
        <c:forEach var="ad" items="${userAds}">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-text">
                        <h2 >${ad.title}</h2>
                        <p>${ad.description}</p>
                        <form   id="${ad.id}" class="itemId" action="/ads/profile-ad-details" method="post">
                            <input class="itemId" type="text" name="myAd.id" value="${ad.id}">
                        </form>
                        <button id="cardbtn" form="${ad.id}" type="submit">+</button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>


<%--ads display ends--%>




</body>
</html>
