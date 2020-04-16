<%-- 
    Document   : index
    Created on : 7 Apr, 2020, 8:04:19 PM
    Author     : Bhaskor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<jsp:include page='./template/head.jsp'>
    <jsp:param name="pageTitle" value="Search"/>
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
    <div class="container mainContainerDiv">
        <form action="./SearchByPin" method="POST" onsubmit="return doValidateForm();" autocomplete="off">
            <div class="row" style="margin-top: 10px;">
                <c:if test="${not empty msg}">
                    <div class="row">
                        <div class="col-sm-0 col-md-3"></div>
                        <div class="col-sm-12 col-md-6">
                            ${msg}
                        </div>
                        <div class="col-sm-0 col-md-3"></div>
                    </div>
                </c:if>
                <div class="col-sm-12 col-md-12">
                    <div class="col-sm-0 col-md-2"></div>
                    <div class="col-sm-12 col-md-8 text-center">
                        ${helpMsg}
                    </div>
                    <div class="col-sm-0 col-md-2"></div>
                </div>
                <div class="col-sm-0 col-md-3"></div>
                <div class="col-sm-12 col-md-6 borderDiv">
                    <div class="row">
                        <input type="hidden" value="${type}" name="type" />
                        <div class="col-xs-9" style="margin-top: 10px;">
                            <input type="radio" id="pinRadio" value="PINCODE" name="state" onclick="handleClick(this);"/>&nbsp<label class="eng">Search by pin code<br/>পিন কোডৰে অনুসন্ধান কৰক</label><br/>
                            <input type="radio" id="districtRadio" value="DISTRICT" name="state" onclick="handleClick(this);"/>&nbsp<label class="eng">Search by pin code District <br/>পিন ক'ডৰ জিলাৰে অনুসন্ধান কৰক</label>
                            <select class="form-control" name="district" id="district" style="display:none;">
                                <option value="-1">--SELECT--</option>
                                <c:forEach var="obj" items="${distList}">
                                    <option value="${obj.distCode}">${obj.distName}</option>
                                </c:forEach>
                            </select>
                            <span class="errorSpan" id="radioError"></span>
                        </div>
                        <div class="col-xs-9">
                            <label class="eng">Enter Pin Code<br/>পিন ক'ডটো লিখক</label>
                            <input type="text" class="form-control" name="search" placeholder="Type the Pin Code here" id="search"/>
                            <span class="errorSpan" id="searchError"></span>
                        </div>
                        <div class="col-xs-9">
                            <label class="eng">Enter Your Name<br/>আপোনাৰ নাম লিখক</label>
                            <input type="text" class="form-control" name="name" placeholder="Enter Your Name here" id="name"/>
                            <span class="errorSpan" id="nameError"></span>
                        </div>
                        <div class="col-xs-9">
                            <label class="eng">Enter Your Mobile<br/>আপোনাৰ মবাইল নম্বৰ লিখক</label>
                            <input type="text" class="form-control" name="mobile" placeholder="Enter Mobile No here" id="mobile"/>
                            <span class="errorSpan" id="mobileError"></span>
                        </div>
                        <div class="col-xs-9">
                            <label class="eng">Enter Captcha<br/>কেপচা লিখক</label>
                            <input type="text" class="form-control" name="captcha" placeholder="Enter Captcha" id="captcha"/>
                            <span class="errorSpan" id="captchaError"></span>
                            <img src="./CaptchaServlet" id="captchaImage"/>&nbsp;<a href="#" onclick="reloadCaptcha();"><i class="glyphicon glyphicon-refresh"></i></a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="btn btn-primary" value="Search (সন্ধান)" >
                        </div>
                    </div>
                </div>
                <div class="col-sm-0 col-md-3"></div>
            </div>

        </form>
    </div>
    <jsp:include page='./template/footer.jsp' />
    <script type="text/javascript">
        $(document).ready(function() {
            $(".errorSpan").hide();
            $("#pinRadio").prop("checked", true);
            $("#district").hide();
        });
        function doValidateForm() {
            if (!$("#search").val().match(/[1-9][0-9]{5}/)) {
                $("#searchError").html("Enter a valid Pin Code");
                $("#searchError").show();
                return false;
            } else if (!$("#mobile").val().match(/^\d{10}$/)) {
                $("#mobileError").html("Enter a valid Mobile No");
                $("#mobileError").show();
                return false;
            } else if ($("#name").val() === "") {
                $("#nameError").html("Enter your name");
                $("#nameError").show();
                return false;
            } else if(("#districtRadio").is(':checked') && $("#district").val() === "-1"){
                $("#radioError").html("Please select a district");
                $("#radioError").show();
                return false;
            } else if ($("#captcha").val() === "" || $("#captcha").val().length != 6) {
                $("#captchaError").html("Enter a valid Captcha Code");
                $("#captchaError").show();
                return false;
            } else {
                $(".errorSpan").hide();
            }
            return true;
        }
        function reloadCaptcha() {
            $("#captchaImage").attr("src", "./CaptchaServlet?t=" + new Date().getTime());
        }

        function handleClick() {
            if ($("#pinRadio").is(':checked')) {
                $("#district").hide();
            } else if ($("#districtRadio").is(':checked')) {
                $("#district").show();
            } else {
                $("#district").hide();
            }
        }
    </script>
</body>
</html>
