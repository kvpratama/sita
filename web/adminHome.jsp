<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${sessionScope.role != 'admin'}">
        <jsp:forward page="notAuthorized.jsp"/>
    </c:when>

    <c:otherwise>--%>
        <jsp:include page="template/header.jsp"/>
        <jsp:include page="template/loginLogout.jsp"/>
        <div id="homeLogo"><img src="images/fronts.png" /></div>
        <div id="itImage"><img src="images/IT.png" /></div>
        <h2>Welcome Administrator</h2>
        <jsp:include page="template/footer.jsp"/>
<!--    </c:otherwise>
</c:choose>-->

