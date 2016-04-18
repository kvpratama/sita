<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<jsp:include page="template/header.jsp"/>
<jsp:include page="template/loginLogout.jsp"/>
<div id="logo"><img src="images/fronts.png" /></div>
<div id="itImage"><img src="images/IT.png" /></div>
<div id="registerForm">
    <sql:query var="rs" dataSource="jdbc/cita">
        select id_dosen, nama_dosen from dosen
    </sql:query>
    <script type="text/javascript">
        function formfocus() {
            document.getElementById('focus').focus();
        }
        window.onload = formfocus;
    </script>
    <form name="registerTA" method="post" enctype="multipart/form-data" action="RegisterTA.do">
        <table>
            <tr>
                <td>Final Project Title: </td>
                <td><input type="text" size="50" name="judul" id="focus" /></td>
            </tr>
            <tr>
                <td>Year: </td>
                <td><input type="text" size="50" name="tahun" />(example : 1990)</td>
            </tr>
            <tr>
                <td>Lecturers 1: </td>
                <td>
                    <select name="dosen">
                        <c:forEach var="row" items="${rs.rows}">
                            <option value="${row.id_dosen}">${row.nama_dosen}</option>
                        </c:forEach>
                    </select>
                    <!--            <select name="dosen">
                                    <option value="101">Alfandi N.Y.</option>
                                    <option value="102">Adi Suryaputra</option>
                                    <option value="103">Alfon Wicaksi</option>
                                    <option value="104">Caecillia Citra</option>
                                    <option value="105">Egawati Panjei</option>
                                    <option value="106">Rinabi Tanamal</option>
                                </select>-->
                </td>
            </tr>
            <tr>
                <td>Lecturers 2: </td>
                <td>
                    <select name="dosen2">
                        <c:forEach var="row" items="${rs.rows}">
                            <option value="${row.id_dosen}">${row.nama_dosen}</option>
                        </c:forEach>
                    </select>
                    <!--                        <option value="101">Alfandi N.Y.</option>
                                            <option value="102">Adi Suryaputra</option>
                                            <option value="103">Alfon Wicaksi</option>
                                            <option value="104">Caecillia Citra</option>
                                            <option value="105">Egawati Panjei</option>
                                            <option value="106">Rinabi Tanamal</option>-->
                </td>
            </tr>
            <tr>
                <td>Abstract: </td>
                <td><textarea rows="20" cols="100" name="abstrak"> </textarea></td>
            </tr>
            <tr>
                <td>Upload Final Project Poster: <br />
                    Maximum 5 MB</td>
                <td><input type="file" name="file" /></td>
            </tr>
            <tr>
                <td><input type="submit" name="submit" value="Submit" /></td>
                <td></td>
            </tr>
        </table> 
    </form>
</div>
<jsp:include page="template/footer.jsp"/>
