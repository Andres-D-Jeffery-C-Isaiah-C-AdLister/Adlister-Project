
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    </style>

</head>

<body class="rugImg4">
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

    <%--update-form starts--%>
    <div class="container">
        <h1>Update Ad</h1>
        <form action="/ads/update" method="post">
            <div class="form-group">
                <h3>current title: ${title}</h3>
                <label for="update-title">Title</label>
                <input id="update-title" name="update-title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <h3>current description: ${description}</h3>
                <label for="update-description">description</label>
                <input id="update-description" name="update-description" class="form-control" type="text">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>
    <%--update-form ends--%>
</body>
</html>
