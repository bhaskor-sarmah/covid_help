<%-- 
    Document   : index
    Created on : 7 Apr, 2020, 8:04:19 PM
    Author     : Bhaskor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<jsp:include page='./template/head.jsp'>
    <jsp:param name="pageTitle" value="Register"/>
</jsp:include>
<body style="overflow-x: scroll;margin-bottom: 55px;">
    <div class="loader"></div>
    <jsp:include page="./template/header.jsp"/>
    <div class="container" style="margin-top: 10px;">
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
            <div class="col-sm-0 col-md-1"></div>
            <div class="col-sm-12 col-md-10 text-center">
                ${registerMsg}
            </div>
            <div class="col-sm-0 col-md-1"></div>
        </div>
        <div class="row">
            <div class="col-sm-0 col-md-2"></div>
            <div class="col-sm-11 col-md-8 form-div">
                <div class="row">
                    <form action="./RegisterMember" method="POST" onsubmit="return doValidateForm()"  autocomplete="off">
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Enter Name<br/>আপোনাৰ নাম লিখক</label>
                            <input type="text" class="form-control" name="name" placeholder="Enter Name" id="name"/>
                            <span class="errorSpan" id="nameError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Mobile No<br/>আপোনাৰ মবাইল নম্বৰ লিখক</label>
                            <input type="text" class="form-control" name="mobile" placeholder="Enter Mobile No" id="mobile"/>
                            <span class="errorSpan" id="mobileError"></span>
                        </div>

                        <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-6">
                            <label class="eng">Email<br/>আপোনাৰ ইমেইল লিখক</label>
                            <input type="text" class="form-control" name="email" placeholder="Enter Email" id="email"/>
                            <span class="errorSpan" id="emailError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Gender<br/>আপোনাৰ লিংগ নির্বাচন কৰক</label>
                            <select class="form-control" id="gender" name="gender">
                                <option value="MALE" selected="selected">MALE</option>
                                <option value="FEMALE">FEMALE</option>
                                <option value="OTHER">OTHER</option>
                            </select>
                            <span class="errorSpan" id="genderError"></span>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Age<br/>আপোনাৰ বয়স লিখক</label>
                            <input type="text" class="form-control" name="age" placeholder="Enter Age" id="age"/>
                            <span class="errorSpan" id="ageError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Pin Code<br/>আপোনাৰ পিন ক'ড লিখক</label>
                            <input type="text" class="form-control" name="pincode" placeholder="Enter Pin Code" id="pincode" onblur="doGetState(this.value);"/>
                            <span class="errorSpan" id="pincodeError"></span>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-6">
                            <label class="eng">State: </label>
                            <label class="ass" style='font-size: small;'>State (ৰাজ্য): </label>
                            <label id="state">---</label>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <label class="eng">District: </label>
                            <label class="ass" style='font-size: small;'>District (জিলা): </label>
                            <label id="district">---</label>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Police Station<br/>আপোনাৰ থানা লিখক</label>
                            <input type="text" class="form-control" name="ps" placeholder="Enter PS" id="ps"/>
                            <span class="errorSpan" id="psError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Locality<br/>আপুনি থকা স্থান</label>
                            <input type="text" class="form-control" name="locality" placeholder="Enter Locality" id="locality"/>
                            <span class="errorSpan" id="localityError"></span>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Road/Street<br/>পথ</label>
                            <input type="text" class="form-control" name="road" placeholder="Enter Road/Street" id="road"/>
                            <span class="errorSpan" id="roadError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">House No<br/>ঘৰ নং</label>
                            <input type="text" class="form-control" name="house_no" placeholder="Enter House No" id="house_no"/>
                            <span class="errorSpan" id="house_noError"></span>
                        </div>
                        <div class="clearfix"></div> 
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Type of Help<br/>সহায় কৰাৰ/বিচৰা পদ্ধতি</label>
                            <select class="form-control" id="type_of_help" name="type_of_help">
                                <option value="FOOD" selected="selected">FOOD</option>
                                <option value="MEDICINE">MEDICINE</option>
                                <option value="SHELTER">SHELTER</option>
                            </select>
                            <span class="errorSpan" id="type_of_helpError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <label class="eng">Enter Captcha<br/>কেপচা লিখক</label>
                            <input type="text" class="form-control" name="captcha" placeholder="Enter Captcha" id="captcha"/>
                            <span class="errorSpan" id="captchaError"></span>
                            <img src="./CaptchaServlet" id="captchaImage"/>&nbsp;<a href="#" onclick="reloadCaptcha();"><i class="glyphicon glyphicon-refresh"></i></a>
                        </div>
                        <div class="clearfix"></div>
                        <input type="hidden" class="form-control" name="type" id="type" value="${type}"/>
                        <div class="col-xs-9 col-md-12 text-center" style="margin-top: 10px;">
                            <input type="submit" name="submit" class="btn btn-success" value="Register(ৰেজিষ্টাৰ)" />
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
            $(".errorSpan").hide();
        });
        $(document).ajaxStart(function() {
            $(".loader").show();
        });
        $(document).ajaxStop(function() {
            $(".loader").fadeOut('slow');
        });
        function doGetState(str) {
            $.ajax({
                url: './GetState',
                type: 'POST',
                data: 'pincode=' + str,
                success: function(data) {
                    //called when successful
                    $("#district").html(data.district);
                    $("#state").html(data.state);
                },
                error: function(e) {
                    $("#district").html("");
                    $("#state").html("");
                }
            });
        }

        function doValidateForm() {
            $(".errorSpan").hide();
            if ($("#name").val().length < 5) {
                $("#nameError").html("Enter Name");
                $("#nameError").show();
                return false;
            } else if ($("#email").val() !== "" && !isValidEmail($("#email").val())) {
                $("#emailError").html("Enter a valid Email");
                $("#emailError").show();
                return false;
            } else if (!$("#mobile").val().match(/^\d{10}$/)) {
                $("#mobileError").html("Enter a valid Mobile No.");
                $("#mobileError").show();
                return false;
            } else if ($("#captcha").val() === "" || $("#captcha").val().length != 6) {
                $("#captchaError").html("Enter a valid Captcha Code");
                $("#captchaError").show();
                return false;
            } else if (isNaN($("#age").val())) {
                $("#ageError").html("Enter a valid Age");
                $("#ageError").show();
                return false;
            } else if (Number($("#age").val()) < 0 || Number($("#age").val()) > 120) {
                $("#ageError").html("Enter a valid Age");
                $("#ageError").show();
                return false;
            } else if (!$("#pincode").val().match(/[1-9][0-9]{5}/)) {
                $("#pincodeError").html("Enter a valid Pin Code");
                $("#pincodeError").show();
                return false;
            } else if ($("#ps").val() === "") {
                $("#psError").html("Enter Police Station");
                $("#psError").show();
                return false;
            } else if ($("#locality").val() === "") {
                $("#localityError").html("Enter Locality");
                $("#localityError").show();
                return false;
            } else if ($("#road").val() === "") {
                $("#roadError").html("Enter Road/Street");
                $("#roadError").show();
                return false;
            } else if ($("#house_no").val() === "") {
                $("#house_noError").html("Enter House No");
                $("#house_noError").show();
                return false;
            }
            return true;
        }

        function isValidEmail(emailAddress) {
//            return true;
            var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
            return pattern.test(emailAddress);
        }

        function reloadCaptcha() {
            $("#captchaImage").attr("src", "./CaptchaServlet?t=" + new Date().getTime());
        }
    </script>
</body>
</html>
