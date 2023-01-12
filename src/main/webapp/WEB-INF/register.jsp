<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>

<style>


</style>

<body>
    <jsp:include page="partials/navbar.jsp" />

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
