<%-- 
    Document   : header
    Created on : Sep 9, 2011, 12:59:44 PM
    Author     : kpratama
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="sita.css" />
        <title>Final Project Information System</title>
    </head>

    <body>
        
        <script type="text/javascript">
            function formfocus() {
                document.getElementById('focus').focus();
            }
            window.onload = formfocus;
        </script>
        
        <c:choose>
            <c:when test="${sessionScope.login == 'admin'}">
                <p>
                    <a href="validateSession.do?c=adminHome">Home | </a>
                    <a href="validateSession.do?c=showLog" > Show Log |</a>
                    <a href="validateSession.do?c=manageUser"> Manage User |</a>
                    <a href="validateSession.do?f=ta"> Manage Final Project |</a>
                    ${sessionScope.login}
                </p>
            </c:when>
            <c:otherwise>
                <p>
                    <a href="index.jsp">Home | </a>
                    <a href="validateSession.do?c=registerTA"> Register Final Project |</a>
                    ${sessionScope.nama}
                </p>
            </c:otherwise>
        </c:choose> 
        <div id="container">
