<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>

</head>

<body id="rugImg">
<jsp:include page="partials/navbar.jsp" />
<div class="container">
    <% String msg;
        if (session.getAttribute("msg") != null) {
            response.setContentType("text/html");
            PrintWriter output = response.getWriter();
            msg = (String) session.getAttribute("msg");
            output.print("<p style='color:white; background-color:#900C3F'> " + msg + " </p>");
        }
    %>

    <h1>Please fill in your information.</h1>
    <form action="/register" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" name="email" class="form-control" type="text" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password" required pattern=".{1,}" title="10 or more characters" onkeyup='passConfirm();'>
        </div>
        <div class="form-group">
            <label for="confirm_password">Confirm Password</label>
            <input id="confirm_password" name="confirm_password" class="form-control" type="password" onkeyup='passConfirm();'>
        </div>
        <span id="Message" ></span>
        <input type="submit" class="btn btn-primary btn-block">
    </form>
</div>

</body>
</html>
