<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<c:choose>
    <c:when test="${sessionScope.role != 'admin'}">
        <jsp:forward page="notAuthorized.jsp"/>
    </c:when>

    <c:otherwise>--%>
<jsp:include page="template/header.jsp"/>
<jsp:include page="template/loginLogout.jsp"/>

<div id="homeLogo"><img src="images/fronts.png" /></div>
<div id="itImage"><img src="images/IT.png" /></div>

<form name="searchLog" action="search.do" method="POST">
    <select name="role" size="1">
        <option>mahasiswa</option>
    </select>
    <input type="submit" value="Search" name="submit" />
</form>

<c:if test="${requestScope.user != null}">
    <table>
        <tr>
            <th>Username </th>
            <th>Role </th>
            <th>Status </th>
            <th>Change </th>
        </tr>
        <c:forEach var="userSearch" items="${requestScope.user}">
            <tr>
                <td>${userSearch.username}</td>
                <td>${userSearch.role_name}</td>
                <td>${userSearch.status}</td>
                <td><a href="Update.do?username=${userSearch.username}&status=${userSearch.status}&role=${requestScope.role}">
                        Change Status</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<jsp:include page="template/footer.jsp"/>

<%--    </c:otherwise>
</c:choose>
--%>