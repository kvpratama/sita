<jsp:include page="template/header.jsp" />
<jsp:include page="template/loginLogout.jsp"/>
<div id="logo"><img src="images/fronts.png" /></div>
<div id="itImage"><img src="images/IT.png" /></div>
<table class="search">
    <tr>
        <td></td>
        <td><img src="uploadImage/${requestScope.path}" width="200" height="200"</td>
    </tr>
    <tr>
        <td>Nama: </td>
        <td>${requestScope.nama}</td>
    </tr>
    <tr>
        <td>Judul: </td>
        <td>${requestScope.judul}</td>
    </tr>
    <tr>
        <td>Tahun: </td>
        <td>${requestScope.tahun}</td>
    </tr>
    <tr>
        <td>Dosen Pembimbing 1: </td>
        <td>${requestScope.dosen1}</td>
    </tr>
    <tr>
        <td>Dosen Pembimbing 2: </td>
        <td>${requestScope.dosen2}</td>
    </tr>
    <tr>
        <td>Abstrak: </td>
        <td>${requestScope.abstrak}</td>
    </tr>
</table>
<!--        <a href="">download</a><br/>-->
<jsp:include page="template/footer.jsp" />
