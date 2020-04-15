<%-- 
    Document   : index
    Created on : 7 Apr, 2020, 8:04:19 PM
    Author     : Bhaskor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<jsp:include page='../template/admin/head.jsp'>
    <jsp:param name="pageTitle" value="Login"/>
</jsp:include>
<body style="overflow-x: scroll;margin-bottom: 70px;">
    <style type="text/css">
        .login-form {
            width: 340px;
            margin: 50px auto;
        }
        .login-form form {
            margin-bottom: 15px;
            background: #f7f7f7;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            padding: 30px;
        }
        .login-form h2 {
            margin: 0 0 15px;
        }
        .form-control, .btn {
            min-height: 38px;
            border-radius: 2px;
        }
        .btn {        
            font-size: 15px;
            font-weight: bold;
        }
    </style>
    <div class="loader"></div>
    <div class="navbar navbar-inverse" id="navbarHead" style="margin-bottom: 0px;color: white;">
        <div class="navbar-header" style="width:100%;padding-right: 20px;">
            <div class="row">
                <div class="col-sm-12 col-md-2 text-center" style="padding-left: 50px;">
                    <img src="images/logo.jpeg" height="75px"/>
                </div>
                <div class="col-sm-12 col-md-8 navtext" style="" >
                    <center class="text-center" style="padding-top: 10px;padding-left: 30px;font-size: small;">
                        <span style="">
                            <b>
                                <span style="font-size: large">An Initiative by Assam Police....</span>&nbsp;&nbsp;<i> Let’s Help Each Other</i>
                                <br/><span style="font-size: large">অসম পুলিচৰ এক প্ৰচেষ্টা……</span>&nbsp;&nbsp;<i> আহক ইজনে সিজনক সহায় কৰো ।</i>
                            </b></span>
                    </center>
                </div>
                <div class="col-xs-6 col-md-2 text-center navtext" style="padding-top: 25px;font-size: small;">
                </div>
            </div>
        </div>
    </div>
    <div class="container mainContainerDiv" style="margin-top: 30px;">
        <c:if test="${not empty msg}">
            <div class="row">
                <div class="col-sm-0 col-md-2"></div>
                <div class="col-sm-12 col-md-8">
                    ${msg}
                </div>
                <div class="col-sm-0 col-md-2"></div>
            </div>
        </c:if>
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
    <jsp:include page='../template/admin/footer.jsp' />
    <script type="text/javascript">
        $(document).ready(function() {
        });
    </script>
</body>
</html>
