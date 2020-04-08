<%-- 
    Document   : index
    Created on : 7 Apr, 2020, 8:04:19 PM
    Author     : Bhaskor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<jsp:include page='./template/head.jsp'>
    <jsp:param name="pageTitle" value="Covid Help"/>
</jsp:include>
<body style="overflow-x: scroll;">
    <div class="loader"></div>
    <jsp:include page="./template/header.jsp"/>
    <div class="container" style="margin-top: 10px;">
        <div class="row">
            <div class="col-sm-0 col-md-3"></div>
            <div class="col-sm-12 col-md-6">
                <div class="alert alert-danger">500 - Internal Server Error ! Please <a href="./Index">Click Here</a> to try again.</div>
            </div>
            <div class="col-sm-0 col-md-3"></div>
        </div>
    </div>
</body>
</html>
