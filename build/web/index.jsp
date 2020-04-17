<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <jsp:include page='./template/head.jsp'>
        <jsp:param name="pageTitle" value="SAHODAR"/>
    </jsp:include>
    <body class="landing">
        <div class="loader"></div>
        <jsp:include page='./template/header.jsp'>
            <jsp:param name="pageTitle" value="HOME"/>
        </jsp:include>
        <!-- One -->
        <section id="one" class="wrapper style1" style="padding-top: 0px;">
            <c:if test="${not empty msg}">
                <div class="row">
                    <div class="col-sm-0 col-md-2"></div>
                    <div class="col-sm-12 col-md-8">
                        ${msg}
                    </div>
                    <div class="col-sm-0 col-md-2"></div>
                </div>
            </c:if>
            <div class="inner" >
                <div class="row ">
                    <div class="col-xs-0 col-md-2"></div>
                    <div class="col-xs-0 col-md-8">
                        <div class="row">
                            <div class="col-xs-12 col-md-6 cardCol">
                                <div class="cardDiv text-center">
                                    <h2 style="margin-bottom: 5px;">Register for seeking help</h2>
                                    <span>
                                        সহায় বিচাৰিবলৈ ৰেজিষ্টাৰ কৰক
                                    </span>
                                    <form action="./Register" method="POST" id="registerSeeker">
                                        <input type="hidden" name="type" value="HELP SEEKER" />
                                        <button type="submit" class="button alt">Register</button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-6 cardCol">
                                <div class="cardDiv text-center">
                                    <h2 style="margin-bottom: 5px;">Register for giving help</h2>
                                    <span>
                                        সহায় আগবঢ়াবলৈ ৰেজিষ্টাৰ কৰক
                                    </span>
                                    <form action="./Register" method="POST" id="registerGiver">
                                        <input type="hidden" name="type" value="HELP GIVER" />
                                        <button type="submit" class="button alt">Register</button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-6 cardCol">
                                <div class="cardDiv text-center">
                                    <h2 style="margin-bottom: 5px;">Search for help Seeker</h2>
                                    <span>
                                        সহায় বিচাৰোতাৰ সন্ধান কৰক
                                    </span>
                                    <form action="./GetSearch" method="POST" id="searchSeeker">
                                        <input type="hidden" name="type" value="HELP SEEKER" />
                                        <button type="submit" class="button alt">Search</button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-6 cardCol">
                                <div class="cardDiv text-center">
                                    <h2 style="margin-bottom: 5px;">Search for help Giver</h2>
                                    <span>
                                        সহায় কৰোতাৰ সন্ধান কৰক 
                                    </span>
                                    <form action="./GetSearch" method="POST"  id="searchGiver">
                                        <input type="hidden" name="type" value="HELP GIVER" />
                                        <button type="submit" class="button alt">Search</button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-6 cardCol">
                                <div class="cardDiv text-center">
                                    <h2 style="margin-bottom: 5px;">Frequently Asked Questions (FAQ)</h2>
                                    <span>
                                        সহজতে জানিব খোজা  প্ৰশ্ন ।
                                    </span>
                                    <form action="./FAQ" method="POST" id="registerSeeker">
                                        <button type="submit" class="button alt">View</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-0 col-md-2"></div>
                </div>
            </div>
        </section>
        <jsp:include page='./template/footer.jsp' />
    </body>
</html>
