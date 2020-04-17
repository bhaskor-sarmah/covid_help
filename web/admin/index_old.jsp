<%-- 
    Document   : index
    Created on : 7 Apr, 2020, 8:04:19 PM
    Author     : Bhaskor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <jsp:include page='../template/admin/head.jsp'>
        <jsp:param name="pageTitle" value="SAHODAR"/>
    </jsp:include>
    <body class="landing">
        <div class="loader"></div>
        <jsp:include page='../template/admin/header.jsp'>
            <jsp:param name="pageTitle" value="SAHODAR"/>
        </jsp:include>
        <div class="container mainContainerDiv">
            <c:if test="${not empty msg}">
                <div class="row">
                    <div class="col-sm-0 col-md-2"></div>
                    <div class="col-sm-12 col-md-8">
                        ${msg}
                    </div>
                    <div class="col-sm-0 col-md-2"></div>
                </div>
            </c:if>
            <div class="row">
                <div class="col-xs-1 col-sm-3 col-md-4"></div>
                <div class="col-xs-10 col-sm-6 col-md-4">

                    <div class="login-form">
                        <form action="./AdminLogin" method="post">
                            <h2 class="text-center">Log in</h2>       
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Username" required="required" name="username">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Password" required="required" name="password">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-block">Log in</button>
                            </div>
                            <div class="clearfix">
                                <!--<label class="pull-left checkbox-inline"><input type="checkbox"> Remember me</label>-->
                                <a href="#" class="pull-right">Forgot Password?</a>
                            </div>        
                        </form>
                        <!--<p class="text-center"><a href="#">Create an Account</a></p>-->
                    </div>
                </div>
                <div class="col-xs-1 col-sm-3 col-md-4"></div>
            </div>
        </div>
        <jsp:include page='../template/admin/footer.jsp' />
    </body>
</html>