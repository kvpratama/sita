<jsp:include page="template/header.jsp"/>
<jsp:include page="template/loginLogout.jsp"/>

<div id="logo"><img src="images/fronts.png" /></div>
<div id="itImage"><img src="images/IT.png" /></div>
<div id="form">
    
    <form name="createAccount" method="post" action="create.do">
        <table>
            <tr>
                <td>NIM : </td>    
                <td><input class="inputText" type="text" size="30" name="nim" id="focus" /></td>
            </tr>
            <tr>
                <td>Full Name : </td>    
                <td><input class="inputText" type="text" size="30" name="nama" /></td>
            </tr>
            <tr>
                <td>Password : </td>
                <td><input class="inputText" type="password" size="30" name="password" /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Submit"></td>
            </tr>
            <tr>
                <td></td>
                <td class="fail">${requestScope.fail}</td>
            </tr>
        </table>
    </form>
</div>

<jsp:include page="template/footer.jsp"/>
