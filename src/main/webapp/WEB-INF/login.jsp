<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>

    <style>
        .container{

            position: absolute;

            width: 400px;
            height: 400px;

            /* Center form on page horizontally & vertically */
            top: 50%;
            left: 50%;
            margin-top: -150px;
            margin-left: -150px;
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
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
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
            <a href="http://localhost:8080/register">Register Here!</a>
            </div>
        </form>
    </div>
</body>
</html>
