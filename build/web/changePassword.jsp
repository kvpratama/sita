<jsp:include page="template/header.jsp"/>
<jsp:include page="template/loginLogout.jsp"/>
<div id="logo"><img src="images/fronts.png" /></div>
<div id="itImage"><img src="images/IT.png" /></div>
<div id="form2">
    <form name="login" method="post" action="changePassword.do">
        <table>
            <tr>
                <td>Old Password: </td>
                <td><input class="inputText" type="password" size="30" name="oldPassword" /></td>
            </tr>
            <tr>
                <td>New Password: </td>
                <td><input class="inputText" type="password" size="30" name="newPassword1" /></td>
            </tr>
            <tr>
                <td>Retype New Password: </td>
                <td><input class="inputText" type="password" size="30" name="newPassword2" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="Submit"/></td>
                <td class="fail">${requestScope.fail}</td>
            </tr>
        </table> 
    </form>
</div>

<jsp:include page="template/footer.jsp" />
