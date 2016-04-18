<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<jsp:include page="template/header.jsp"/>
<jsp:include page="template/loginLogout.jsp"/>

<div id="homeLogo"><img src="images/fronts.png" /></div>
<div id="itImage"><img src="images/IT.png" /></div>

    <sql:query var="rs" dataSource="jdbc/cita">
    select username from user
    </sql:query>
    
<form name="searchLog" action="search.do" method="POST">
    <select name="nim" size="1">
        <option>guest</option>
        <c:forEach var="row" items="${rs.rows}">
            <c:if test="${row.username != 'admin'}">
                <option>${row.username}</option>
            </c:if>
        </c:forEach>
    </select>
    <input type="submit" value="Search" name="submit" />
</form>

<c:if test="${requestScope.log != null}">
    <table>
        <tr>
            <th>Log Date </th>
            <th>Log Level </th>
            <th>Log Location </th>
            <th>Log Message </th>
        </tr>
        <c:forEach var="logSearch" items="${requestScope.log}">
            <tr>
                <td>${logSearch.log_date}</td>
                <td>${logSearch.log_level}</td>
                <td>${logSearch.log_location}</td>
                <td>${logSearch.log_message}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<jsp:include page="template/footer.jsp"/>