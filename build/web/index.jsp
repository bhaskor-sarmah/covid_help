<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<jsp:include page='./template/head.jsp'>
    <jsp:param name="pageTitle" value="Home"/>
</jsp:include>
<body style="margin-bottom: 70px;">
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
            <div class="col-sm-12 col-md-8">
                <div class="alert alert-warning text-center">
                    <!--<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>-->
                    <strong>This facility for help is being provided for the people who are currently living in Assam.</strong><br/>
                    <strong>এই সুবিধা সমুহ, বৰ্তমান সময়ত, কেৱল অসমত থকা মানুহসকলৰ বাবেহে আগবঢ়োৱা হৈছে ।</strong>
                </div>
            </div>
            <div class="col-sm-0 col-md-2">
                <form action="./DownloadApk" method="POST">
                    <button class="btn btn-primary" id="mobileApp" type="submit"><i class="glyphicon glyphicon-phone"></i>&nbsp;Download Mobile App</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-0 col-md-2"></div>
            <div class="col-sm-12 col-md-8">
                <div class="alert alert-warning alert-dismissable text-center">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Please Note that the portal will accept data in English Language Only.</strong><br/>
                    <strong>মন কৰিব, এই ৱেব পৰ্টেল টোত কেৱল মাত্ৰ ইংৰাজী ভাষাতহে তথ্য লিখিব পাৰিব ।</strong>
                </div>
            </div>
            <div class="col-sm-0 col-md-2"></div>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-12 mainboxshadow">
                <div class="col-xs-12 col-md-6" style="margin-top:10px;">
                    <form action="./Register" method="POST">
                        <input type="hidden" name="type" value="HELP SEEKER" />
                        <div class="alert alert-danger">
                            <div class="row">
                                <div class="col-sm-12 text-center">
                                    <img src="./images/seeking_help_transparent.png" height="70px;"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 text-center" style="border-bottom: 1px solid lightgrey;margin-bottom: 10px;">
                                    <label>Register for Seeking help</label><br/>
                                    <label>সহায় বিচাৰিবৰ বাবে নিবন্ধন কৰক</label>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <p>If you need help please fill up the details by clicking "Register" button below and someone might find you from the same locality or district</p>
                                    <p>আপোনাক যদি সহায়ৰ প্ৰয়োজন, তেনেহলে, অনুগ্ৰহ কৰি তলত দিয়া "ৰেজিষ্টাৰ" বুটামটো ক্লিক কৰি আপোনাৰ সৱিশেষ জনাওক । তেতিয়া একে অঞ্ছলৰে বা একে জিলাৰে  কোনোবাই আপোনাক বিচাৰি পাব পাৰে  </p>
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
                                <div class="col-sm-12 text-center">
                                    <img src="./images/giving_help_transparent.png" height="70px;"/>
=======
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
>>>>>>> new_ui
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
