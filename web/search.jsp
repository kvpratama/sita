<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sita.domain.TASearchResult"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="template/header.jsp"/>
<jsp:include page="template/loginLogout.jsp"/>
<jsp:include page="template/searchHeader.jsp"/>

<p>
    Ditemukan <b> ${requestScope.row}</b> Hasil Pencarian untuk keyword 
    <b>${requestScope.keyword}</b>
</p>

<c:forEach var="aSearch" items="${requestScope.result}">
    <table class="search">
        <tr>
            <th colspan="2"><a href="searchResult.do?judul=${aSearch.judul}">${aSearch.judul} </a></th>
        </tr>
        <tr>
            <td>Oleh: </td>
            <td>${aSearch.nama}</td>
        </tr>
        <tr>
            <td>Tahun: </td>
            <td>${aSearch.tahun}</td>
        </tr>
        <tr>
            <td>Dosen Pembimbing 1: </td>
            <td>${aSearch.dosen1}</td>
        </tr>
        <tr>
            <td>Dosen Pembimbing 2: </td>
            <td>${aSearch.dosen2}</td>
        </tr>
        <tr>
            <td>Abstrak: </td>
            <td>${aSearch.abstrak}...</td>
        </tr>
    </table>
</c:forEach>


<jsp:include page="template/footer.jsp"/>