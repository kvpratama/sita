<%-- 
    Document   : index
    Created on : Sep 9, 2011, 12:57:57 PM
    Author     : kpratama
--%>



<jsp:include page="template/header.jsp" />
<jsp:include page="template/loginLogout.jsp"/>

<jsp:include page="template/homeHeader.jsp" />
    <div id="searchwrapper">
        <form name="search bar" action="search.do" method="post">
            <input type="text" class="searchbox" name="search" value="" id="focus"/>
            <input type="image" src="images/1.png" class="searchbox_submit" value="" 
                   name="searchButton"/>
        </form>
    </div>
<jsp:include page="template/footer.jsp" />

