
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Ad"/>
    </jsp:include>
</head>

<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<body>
            <h1>title: ${title}</h1>
            <h1>ad id: ${ad_id}</h1>
            <h1>description: ${getDescription}</h1>
            <h1>posted by: ${getUserId}</h1>






</body>


</html>


<%--request.setAttribute("title", newAd.getTitle());--%>
<%--request.setAttribute("getUserId", newAd.getUserId());--%>
<%--request.setAttribute("getDescription", newAd.getDescription());--%>
<%--request.setAttribute("ad_id", newAd.getId());--%>