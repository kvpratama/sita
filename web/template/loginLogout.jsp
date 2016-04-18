<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="headerLogin">
    <c:choose>
        <c:when test="${sessionScope.login == null}">
            <a href="login.jsp">Login | </a>
            <a href="CreateAccount.jsp">Create Account </a>
        </c:when>
        <c:otherwise>
            <a href="logout.do">Logout | </a>
            <a href="validateSession.do?c=changePassword">Change Password </a>
        </c:otherwise>
    </c:choose>
</div>