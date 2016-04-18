<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="template/header.jsp"/>
<jsp:include page="template/loginLogout.jsp"/>

<div id="homeLogo"><img src="images/fronts.png" /></div>
<div id="itImage"><img src="images/IT.png" /></div>

<table>
    <tr>
        <th>Nim </th>
        <th>Nama </th>
        <th>Judul </th>
        <th>Tahun </th>
        <th>Status </th>
    </tr>
    <c:forEach var="taSearch" items="${requestScope.ta}">
        <tr>
            <td>${taSearch.nim}</td>
            <td>${taSearch.nama_mahasiswa}</td>
            <td>${taSearch.judul}</td>
            <td>${taSearch.tahun}</td>
            <td>${taSearch.status}</td>
            <td><a href="Update.do?nims=${taSearch.nim}&status=${taSearch.status}&ta=1">
                    Change Status</a></td>
        </tr>
    </c:forEach>
</table>
<jsp:include page="template/footer.jsp"/>
