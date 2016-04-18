
<jsp:include page="template/header.jsp"/>
<jsp:include page="template/loginLogout.jsp"/>

<div id="logo"><img src="images/fronts.png" /></div>
<div id="itImage"><img src="images/IT.png" /></div>
<div id="form1">
    
    <form name="login" method="post" action="validateLogin.do">
        <table>
            <tr>
                <td>NIM: </td>
                <td><input class="inputText" type="text" size="30" name="username" id="focus" /></td>
            </tr>

            <tr>
                <td>Password: </td>
                <td><input class="inputText" type="password"  size="30" name="password" /></td>
            </tr>
            <tr>
<!--                <input type="image" src="images/buttonLogin.png" value="" class="buttonLogin"/>-->
                <td><input type="submit" value="Submit"/></td>        
                <td class="fail">${requestScope.fail}</td>        
            </tr>
        </table> 
    </form>
</div>

<jsp:include page="template/footer.jsp" />
