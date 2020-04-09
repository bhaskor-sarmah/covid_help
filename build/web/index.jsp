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
<body style="overflow-x: scroll;margin-bottom: 70px;">
    <style type="text/css">
        @media screen and (max-width: 400px) {
            .mainContainerDiv {
                margin-bottom: 10px;
                margin-top: 10px;
            }
        }

        @media screen and (min-width: 800px) {
            .mainContainerDiv {
                margin-bottom: 50px;
                margin-top: 10px;
            }
        }
    </style>
    <div class="loader"></div>
    <jsp:include page="./template/header.jsp"/>
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
        <div class="row">
            <div class="col-sm-0 col-md-2"></div>
            <div class="col-sm-12 col-md-8 mainboxshadow">
                <div class="col-xs-12 col-md-6" style="margin-top:10px;">
                    <form action="./Register" method="POST">
                        <input type="hidden" name="type" value="HELP SEEKER" />
                        <div class="alert alert-danger">
                            <div class="row">
                                <div class="col-sm-12 text-center" style="border-bottom: 1px solid lightgrey;margin-bottom: 10px;">
                                    <label>Register for Seeking help</label><br/>
                                    <label>সহায় বিচাৰিবৰ বাবে নিবন্ধন কৰক</label>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <p>If you need help please fill up the details by clicking "Register" button below and someone might find you from the same locality or district</p>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary">Register</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-xs-12 col-md-6" style="margin-top:10px;">
                    <form action="./Register" method="POST">
                        <input type="hidden" name="type" value="HELP GIVER" />
                        <div class="alert alert-info">
                            <div class="row">
                                <div class="col-sm-12 text-center" style="border-bottom: 1px solid lightgrey;margin-bottom: 10px;">
                                    <label>Register for Giving help</label><br/>
                                    <label>সহায় কৰিবৰ বাবে নিবন্ধন কৰক</label>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <p>If you need want to help please fill up the details by clicking "Register" button below and someone might find you from the same locality or district</p>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary">Register</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-xs-12 col-md-6" style="margin-top:10px;">
                    <form action="./GetSearch" method="POST">
                        <input type="hidden" name="type" value="HELP SEEKER" />
                        <div class="alert alert-info">
                            <div class="row">
                                <div class="col-sm-12 text-center" style="border-bottom: 1px solid lightgrey;margin-bottom: 10px;">
                                    <label>Search for help Seeker</label><br/>
                                    <!--<label>সহায় বিচাৰিবৰ বাবে নিবন্ধন কৰক</label>-->
                                </div>
                                <div class="col-sm-12 text-center">
                                    <p>Search by pincode or by district to view the list of people who wants help</p>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary">Search</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-xs-12 col-md-6" style="margin-top:10px;">
                    <form action="./GetSearch" method="POST">
                        <input type="hidden" name="type" value="HELP GIVER" />
                        <div class="alert alert-danger">
                            <div class="row">
                                <div class="col-sm-12 text-center" style="border-bottom: 1px solid lightgrey;margin-bottom: 10px;">
                                    <label>Search for help Giver</label><br/>
                                    <!--<label>সহায় কৰিবৰ বাবে নিবন্ধন কৰক</label>-->
                                </div>
                                <div class="col-sm-12 text-center">
                                    <p>Search by pincode or by district to view the list of people who wants to give help.</p>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary">Search</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-0 col-md-2"></div>
        </div>
    </div>
    <jsp:include page='./template/footer.jsp' />
    <script type="text/javascript">
        $(document).ready(function() {
        });
    </script>
</body>
</html>
