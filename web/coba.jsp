<%-- 
    Document   : coba
    Created on : Sep 21, 2011, 11:33:41 AM
    Author     : kpratama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>coba jsp</h1>
        <p>
            ${requestScope.result[0].judul}
            ${requestScope.result[0].nama}
            ${requestScope.result[0].tahun}
            ${requestScope.result[0].dosen1}
            ${requestScope.result[0].dosen2}
            ${requestScope.result[1].judul}
            ${requestScope.result[1].nama}
            ${requestScope.result[1].tahun}
            ${requestScope.result[1].dosen1}
            ${requestScope.result[1].dosen2}
        </p>
    </body>
</html>
