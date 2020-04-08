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
    <div class="container mainContainerDiv">

        <form action="./SearchByPin" method="POST" onsubmit="return doValidateForm();" autocomplete="off">
            <div class="row">
                <div class="col-xs-12 col-md-6 text-center">
                    <div class="alert alert-info">
                        <label>You Need Help (Select the radio button below)<br/>আপোনাক সহায়ৰ প্ৰয়োজন</label>
                        <p><input type="radio" id="needHelp" value="HELP SEEKER" name="type" />&nbsp;Search for Help by Pin Code<br/>পিন ক'ডৰ জৰিয়তে সহায় বিচাৰিবলৈ বাচি লওঁক </p>
                    </div>
                </div>
                <div class="col-xs-12 col-md-6 text-center">
                    <div class="alert alert-info">
                        <label>You Are a Help Provider (Select the radio button below)<br/>আপুনি এজন সহায়কাৰী</label>
                        <p><input type="radio" id="giveHelp" value="HELP GIVER" name="type" />&nbsp;Search for Help Seekers by Pin Code<br/>পিন ক'ডৰ জৰিয়তে সহায় বিচাৰোতাৰ সন্ধান কৰিবলৈ নিৰ্ব্বাচন কৰক</p>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12" class="errorSpan" id="radionErrorDiv">
                    <div class="col-sm-0 col-md-2"></div>
                    <div class="col-sm-12 col-md-10">
                        <span class="errorSpan" id="radioError"></span>
                    </div>
                    <div class="col-sm-0 col-md-2"></div>
                </div>
                <div class="col-sm-0 col-md-3"></div>
                <div class="col-sm-12 col-md-6">
                    <div class="row">
                        <div class="col-xs-9">
                            <label class="eng">Enter Pin Code<br/>পিন ক'ডটো লিখক</label>
                            <input type="text" class="form-control" name="search" placeholder="Type the Pin Code here" id="search"/>
                            <span class="errorSpan" id="searchError"></span>
                        </div>
                        <div class="col-xs-9">
                            <label class="eng">Enter Captcha<br/>কেপচা লিখক</label>
                            <input type="text" class="form-control" name="captcha" placeholder="Enter Captcha" id="captcha"/>
                            <span class="errorSpan" id="searchError"></span>
                            <img src="./CaptchaServlet" id="captchaImage"/>&nbsp;<a href="#" onclick="reloadCaptcha();"><i class="glyphicon glyphicon-refresh"></i></a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="btn btn-primary" value="Go" style="width:50px;">
                        </div>
                    </div>
                </div>
                <div class="col-sm-0 col-md-3"></div>
            </div>
            <c:if test="${not empty msg}">
                <div class="row">
                    <div class="col-sm-0 col-md-3"></div>
                    <div class="col-sm-12 col-md-6">
                        ${msg}
                    </div>
                    <div class="col-sm-0 col-md-3"></div>
                </div>
            </c:if>

        </form>
        <div class="row"  style="margin-top: 50px;">
            <div class="col-sm-0 col-md-3"></div>
            <div class="col-sm-12 col-md-6">
                <form action="./Register" method="POST">
                    <input type="hidden" name="type" value="HELP SEEKER" />
                    <div class="col-xs-12 col-md-6">
                        <button type="submit" class="btn btn-primary" style="height:100px;width:200px;">
                            <span>
                                <p>Register for Seeking help</p>
                                <p class="ass">সহায় বিচাৰিবৰ<br/>বাবে নিবন্ধন কৰক</p>
                            </span>
                        </button>
                    </div>
                </form>
                <form action="./Register" method="POST">
                    <input type="hidden" name="type" value="HELP GIVER" />
                    <div class="col-xs-12 col-md-6" style="margin-top:10px;">
                        <button type="submit" class="btn btn-primary" style="height:100px;width:200px;">
                            <span>
                                <p>Register for Giving help</p>
                                <p class="ass">সহায় কৰিবৰ<br/>বাবে নিবন্ধন কৰক</p>
                            </span>
                        </button>
                    </div>
                </form>
            </div>
            <div class="col-sm-0 col-md-3"></div>
        </div>
    </div>
    <jsp:include page='./template/footer.jsp' />
    <script type="text/javascript">
        $(document).ready(function() {
            $(".errorSpan").hide();
            $("#needHelp").prop("checked", true);
//            $("#langSelect").val("eng");
//            $(".ass").hide();
        });
//        function doChangeRadio(str) {
//            $(".loader").show();
//            if (str === "eng") {
//                $(".eng").show();
//                $(".ass").hide();
//            } else {
//                $(".eng").hide();
//                $(".ass").show();
//            }
//            $(".loader").hide();
//        }
        function doValidateForm() {
            if (!$("#search").val().match(/[1-9][0-9]{5}/)) {
                $("#searchError").html("Enter a valid Pin Code");
                $("#searchError").show();
                return false;
            } else if ($("#captcha").val() === "" || $("#captcha").val().length != 6) {
                $("#captchaError").html("Enter a valid Captcha Code");
                $("#captchaError").show();
                return false;
            } else if (!$('#needHelp').is(':checked') && !$('#giveHelp').is(':checked')) {
                $("#radioError").html("Please select if you want to search for Help Seeker or Help Giver");
                $("#radionErrorDiv").show();
                return false;
            } else {
                $(".errorSpan").hide();
            }
            return true;
        }
        function reloadCaptcha() {
            $("#captchaImage").attr("src", "./CaptchaServlet?t=" + new Date().getTime());
        }
    </script>
</body>
</html>
