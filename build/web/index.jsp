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
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 text-center" style="border-bottom: 1px solid lightgrey;margin-bottom: 10px;">
                                    <label>Register for Giving help</label><br/>
                                    <label>সহায় কৰিবৰ বাবে নিবন্ধন কৰক</label>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <p>If you are willing to help please fill up the details by clicking "Register" button below and someone might find you from the same locality or district</p>
                                    <p>আপুনি যদি কাৰোবাক সহায় কৰিব বিচাৰে তেনেহলে, অনুগ্ৰহ কৰি তলত দিয়া "ৰেজিষ্টাৰ" বুটামটো ক্লিক কৰি আপোনাৰ সৱিশেষ জনাওক । তেতিয়া একে অঞ্ছলৰে বা একে জিলাৰে  কোনোবাই আপোনাক বিচাৰি পাব পাৰে</p>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary">Register</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-md-6" style="margin-top:10px;">
                    <form action="./GetSearch" method="POST">
                        <input type="hidden" name="type" value="HELP SEEKER" />
                        <div class="alert alert-danger">
                            <div class="row">
                                <div class="col-sm-12 text-center">
                                    <img src="./images/search_help_transparent.png" height="70px;"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 text-center" style="border-bottom: 1px solid lightgrey;margin-bottom: 10px;">
                                    <label>Search for help Seeker</label><br/>
                                    <label>সহায় বিচাৰোতাৰ সন্ধান কৰক</label>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <p>Search by pincode or by district to view the list of people who are in need of help</p>
                                    <p>পিন ক'ডৰ জৰিয়তে বা জিলাৰ নামেৰে সহায় বিচাৰোতাৰ তালিকা সন্ধান কৰক ।</p>
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
                        <div class="alert alert-info">
                            <div class="row">
                                <div class="col-sm-12 text-center">
                                    <img src="./images/search_help_transparent.png" height="70px;"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 text-center" style="border-bottom: 1px solid lightgrey;margin-bottom: 10px;">
                                    <label>Search for help Giver</label><br/>
                                    <label>সহায়দাতাৰ সন্ধান কৰক</label>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <p>Search by pincode or by district to view the list of people who are willing to help.</p>
                                    <p>পিন ক'ডৰ জৰিয়তে বা জিলাৰ নামেৰে সহায়দাতাৰ তালিকা সন্ধান কৰক ।</p>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary">Search</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-xs-12 col-md-12" style="margin-top:10px;display: none;">
                    <h2>Android Application Installation Instruction</h2>
                    <ul>
                        <li>While the App is being published on <pre>Play Store</pre> you can download the Android App from our server</li>
                        <li>Downloading App from our server might show warning on your device <pre>This file might be harmful to your device.</pre> 
                            <b>Please be assured we respect your privacy, no harm will be done to your device and personal information collected are those only user allows or provides.</b></li>
                        <li>Once downloaded open the Settings app on your Android device.</li>
                        <li>Tap <pre>Security</pre> This will open the Security menu.</li>
                        <li>Scroll down and check the <pre>Unknown sources</pre> box. Tap "OK" to confirm that you want to enable this.</li>
                        <li>Tap the APK file. This will immediately open the installer for the app</li>
                        <li>Tap "Install" to install the app. </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page='./template/footer.jsp' />
    <script type="text/javascript">
        $(document).ready(function() {
        });
    </script>
</body>
</html>
