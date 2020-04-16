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
    <jsp:include page='./template/head.jsp'>
        <jsp:param name="pageTitle" value="SEARCH"/>
    </jsp:include>
    <body class="landing">
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
        <jsp:include page='./template/header.jsp'>
            <jsp:param name="pageTitle" value="HOME"/>
        </jsp:include>
        <div class="container mainContainerDiv">
            <form action="./Search" method="POST" onsubmit="return doValidateForm();" autocomplete="off">
                <div class="row" style="margin-top: 10px;">
                    <c:if test="${not empty msg}">
                        <div class="col-sm-12 col-md-12">
                            <div class="col-sm-0 col-md-2"></div>
                            <div class="col-sm-12 col-md-8 text-center">
                                ${msg}
                            </div>
                            <div class="col-sm-0 col-md-2"></div>
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
                    <div class="col-sm-12 col-md-6  form-div" style="padding-top: 10px;">
                        <div class="row">
                            <input type="hidden" value="${type}" name="type" />
                            <div class="col-xs-9">
                                <label class="ass" style='font-size: small;'><span class="mandetory">*</span>District<br/>আপোনাৰ জিলা বাচক </label>
                                <select class="form-control" name="district" id="district" onchange="doGetThana(this.value);">
                                    <option value="-1">--SELECT DISTRICT--</option>
                                    <c:forEach var="obj" items="${distList}">
                                        <option value="${obj.distCode}">${obj.distName}</option>
                                    </c:forEach>
                                </select>
                                <span class="errorSpan" id="districtError"></span>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-xs-9">
                                <label class="eng">Thana<br/>আপোনাৰ থানা বাচক</label>
                                <select class="form-control" name="thana" id="thana">
                                    <option value="-1">--SELECT THANA--</option>
                                </select>
                                <span class="errorSpan" id="psError"></span>
                            </div>
                            <div class="col-xs-9">
                                <label class="eng"><span class="mandetory">*</span>Enter Your Name<br/>আপোনাৰ নাম লিখক</label>
                                <input type="text" class="form-control" name="name" placeholder="Enter Your Name here" id="name" value="${name}"/>
                                <span class="errorSpan" id="nameError"></span>
                            </div>
                            <div class="col-xs-9">
                                <label class="eng"><span class="mandetory">*</span>Enter Your Mobile<br/>আপোনাৰ মবাইল নম্বৰ লিখক</label>
                                <input type="text" class="form-control" name="mobile" placeholder="Enter Mobile No here" id="mobile" value="${mobile}"/>
                                <span class="errorSpan" id="mobileError"></span>
                            </div>
                            <div class="col-xs-9">
                                <label class="eng"><span class="mandetory">*</span>Enter Captcha<br/>কেপচা লিখক</label>
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
            });
            $(document).ajaxStart(function() {
                $(".loader").show();
            });
            $(document).ajaxStop(function() {
                $(".loader").fadeOut('slow');
            });
            function doValidateForm() {
                if ($("#district").val() === "-1") {
                    $("#districtError").html("Select a District");
                    $("#districtError").show();
                    return false;
                } else if (!$("#mobile").val().match(/^\d{10}$/)) {
                    $("#mobileError").html("Enter a valid Mobile No");
                    $("#mobileError").show();
                    return false;
                } else if ($("#name").val() === "") {
                    $("#nameError").html("Enter your name");
                    $("#nameError").show();
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

            function doGetThana(str) {
                $.ajax({
                    url: './GetThana',
                    type: 'POST',
                    data: 'dist=' + str,
                    success: function(data) {
                        //                    console.log(data);
                        //                    console.log(JSON.stringify(data));
                        //called when successful
                        var b = "<option value=\"-1\">--SELECT THANA--</option>\n";
                        data.forEach(function(obj) {
                            b += "<option value=\"" + obj.code + "\">" + obj.name + "</option>\n";
                        });
                        $("#thana").html(b);
                    },
                    error: function(e) {
                        $.alert({
                            title: "Error",
                            content: "Error fetching Thana List",
                            type: "red",
                            typeAnimated: true
                        });
                    }
                });
            }
        </script>
    </body>
</html>
