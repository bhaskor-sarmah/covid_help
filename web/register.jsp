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
        <jsp:param name="pageTitle" value="REGISTER"/>
    </jsp:include>
    <body class="landing">
        <div class="loader"></div>
        <jsp:include page='./template/header.jsp'>
            <jsp:param name="pageTitle" value="HOME"/>
        </jsp:include>
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
                            <label class="eng"><span class="mandetory">*</span>Enter Name<br/>আপোনাৰ নাম লিখক</label>
                            <input type="text" class="form-control" name="name" placeholder="Enter Name" id="name" value="${register.name}"/>
                            <span class="errorSpan" id="nameError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <label class="eng"><span class="mandetory">*</span>Mobile No<br/>আপোনাৰ মবাইল নম্বৰ লিখক</label>
                            <input type="text" class="form-control" name="mobile" placeholder="Enter Mobile No" id="mobile" value="${register.mobile}"/>
                            <span class="errorSpan" id="mobileError"></span>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-6">
                            <label class="ass" style='font-size: small;'><span class="mandetory">*</span>District<br/>আপোনাৰ জিলা বাচক</label>
                            <select class="form-control" name="district" id="district" onchange="doGetThana(this.value);">
                                <option value="-1">--SELECT DISTRICT--</option>
                                <c:forEach var="obj" items="${distList}">
                                    <option value="${obj.distCode}">${obj.distName}</option>
                                </c:forEach>
                            </select>
                            <span class="errorSpan" id="districtError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
<<<<<<< HEAD
                            <span class="mandetory">*</span><label class="eng">Age<br/>আপোনাৰ বয়স লিখক</label>
                            <input type="text" class="form-control" name="age" placeholder="Enter Age" id="age"/>
                            <span class="errorSpan" id="ageError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <label class="ass">State<br/>ৰাজ্য</label><br/>
                            <label id="state">ASSAM</label>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-6">
                            <label class="eng">District: </label>
                            <select class="form-control" name="district" id="district">
                                <option value="-1">--SELECT--</option>
                                <c:forEach var="obj" items="${distList}">
                                    <option value="${obj.distCode}">${obj.distName}</option>
                                </c:forEach>
                            </select>
                            <span class="errorSpan" id="districtError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Pin Code<br/>আপোনাৰ পিন ক'ড লিখক</label>
                            <input type="text" class="form-control" name="pincode" placeholder="Enter Pin Code" id="pincode"/>
                            <span class="errorSpan" id="pincodeError"></span>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Police Station<br/>আপোনাৰ থানা লিখক</label>
                            <input type="text" class="form-control" name="ps" placeholder="Enter PS" id="ps"/>
=======
                            <label class="eng"><span class="mandetory">*</span>Thana<br/>আপোনাৰ থানা বাচক</label>
                            <select class="form-control" name="thana" id="thana">
                                <option value="-1">--SELECT THANA--</option>
                            </select>
>>>>>>> new_ui
                            <span class="errorSpan" id="psError"></span>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-6">
                            <label class="eng"><span class="mandetory">*</span>Address<br/>আপোনাৰ ঠিকনা</label>
                            <input type="text" class="form-control" name="address" placeholder="Enter Address" id="address" value="${register.address}"/>
                            <span class="errorSpan" id="addressError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <label class="eng"><span class="mandetory">*</span>Road/Street<br/>পথ</label>
                            <input type="text" class="form-control" name="road" placeholder="Enter Road/Street" id="road" value="${register.road}"/>
                            <span class="errorSpan" id="roadError"></span>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-6">
                            <label class="eng">House No<br/>ঘৰ নং</label>
                            <input type="text" class="form-control" name="house_no" placeholder="Enter House No" id="house_no" value="${register.house}"/>
                            <span class="errorSpan" id="house_noError"></span>
                        </div>
                        <div class="clearfix"></div> 
                        <div class="col-xs-9 col-md-12" id="helpDiv">
                            <div class="row" id="helpRow_1">
                                <div class="col-sm-12 col-md-4">
                                    <label class="eng"><span class="mandetory">*</span>Type of Help<br/>সহায় কৰাৰ/বিচৰাৰ পদ্ধতি</label>
                                    <select class="form-control" id="type_of_help_1" name="type_of_help">
                                        <c:forEach var="obj" items="${helpList}">
                                            <option value="${obj.id}" <c:if test="${obj.id == '1'}">selected="selected"</c:if>>${obj.helpDetails}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="errorSpan" id="type_of_help_1Error"></span>
                                </div>
                                <div class="col-sm-12 col-md-4">
                                    <label class="eng">Help Details<br/>সাহায্যৰ বিবৰণ</label>
                                    <input type="text" class="form-control" name="help_details" placeholder="Enter Help Details" id="help_details_1"/>
                                    <span class="errorSpan" id="help_details_1Error"></span>
                                </div>
                                <div class="col-sm-12 col-md-4">
                                    <label class="eng">Quantity<br/>পৰিমাণ</label>
                                    <input type="text" class="form-control" name="help_quantity" placeholder="Enter Quantity" id="help_quantity_1"/>
                                    <span class="errorSpan" id="help_quantity_1Error"></span>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-12" id="helpDivBottom">
                            <button type="button" class="btn btn-sm btn-primary" id="btnAddMore" onclick="doAddRow();"><i class="glyphicon glyphicon-plus"></i>&nbsp;Add More</button>&nbsp;
                            <button type="button" class="btn btn-sm btn-danger" id="btnRemove" onclick="doRemoveRow();"><i class="glyphicon glyphicon-minus"></i>&nbsp;Remove</button>
                        </div>
<<<<<<< HEAD
                        <div class="clearfix"></div>
=======
                        <div class="clearfix"></div> 
>>>>>>> new_ui
                        <div class="col-xs-9 col-md-6">
                            <label class="eng"><span class="mandetory">*</span>Enter Captcha<br/>কেপচা লিখক</label>
                            <input type="text" class="form-control" name="captcha" placeholder="Enter Captcha" id="captcha"/>
                            <span class="errorSpan" id="captchaError"></span>
                            <img src="./CaptchaServlet" id="captchaImage"/>&nbsp;<a href="#" onclick="reloadCaptcha();"><i class="glyphicon glyphicon-refresh"></i></a>
                        </div>
                        <input type="hidden" class="form-control" name="type" id="type" value="${type}"/>
                        <input type="hidden" class="form-control" name="helpDivCount" id="helpDivCount" value="1"/>
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
        var helpDivCount = 1;
        var helpList = [];

        $(document).ready(function() {
            $(".errorSpan").hide();
        <c:forEach var="obj" items="${helpList}" varStatus="loop">
            helpList[${loop.index}] = {
                id: '${obj.id}',
                help: '${obj.helpDetails}'
            };
        </c:forEach>
        });
<<<<<<< HEAD

        function doValidateForm() {
            $(".errorSpan").hide();
            if ($("#name").val().length < 2) {
                $("#nameError").html("Enter Name");
=======
        $(document).ajaxStart(function() {
            $(".loader").show();
        });
        $(document).ajaxStop(function() {
            $(".loader").fadeOut('slow');
        });

        function doValidateForm() {
            $(".errorSpan").hide();
            var res = true;
            var msg = "";
            if ($("#name").val() === "") {
                msg = "Enter Name";
                $("#nameError").html(msg);
>>>>>>> new_ui
                $("#nameError").show();
                res = false;
            } else if (!$("#mobile").val().match(/^\d{10}$/)) {
                msg = "Enter a valid Mobile No.";
                $("#mobileError").html(msg);
                $("#mobileError").show();
<<<<<<< HEAD
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
            } else if ($("#district").val() === "-1") {
                $("#districtError").html("Please select district");
                $("#districtError").show();
                return false;
            } else if (!$("#pincode").val().match(/[1-9][0-9]{5}/)) {
                $("#pincodeError").html("Enter a valid Pin Code");
                $("#pincodeError").show();
                return false;
            } else if ($("#ps").val() === "") {
                $("#psError").html("Enter Police Station");
=======
                res = false;
            } else if ($("#district").val() === "-1") {
                msg = "Select District";
                $("#districtError").html(msg);
                $("#districtError").show();
                res = false;
            } else if ($("#thana").val() === "-1") {
                msg = "Select Thana";
                $("#psError").html(msg);
>>>>>>> new_ui
                $("#psError").show();
                res = false;
            } else if ($("#address").val() === "") {
                msg = "Enter Address";
                $("#addressError").html(msg);
                $("#addressError").show();
                res = false;
            } else if ($("#road").val() === "") {
                msg = "Enter Road/Street";
                $("#roadError").html(msg);
                $("#roadError").show();
                res = false;
            } 
//            else if ($("#house_no").val() === "") {
//                msg = "Enter House No";
//                $("#house_noError").html(msg);
//                $("#house_noError").show();
//                res = false;
//            }
            else if ($("#captcha").val() === "" || $("#captcha").val().length != 6) {
                msg = "Enter a valid Captcha Code";
                $("#captchaError").html(msg);
                $("#captchaError").show();
                res = false;
            }
            for (var i = 1; i <= helpDivCount; i++) {
                if ($("#type_of_help_" + i).val() === "") {
                    $("#type_of_help_" + i + "Error").html("Select Type of Help");
                    $("#type_of_help_" + i + "Error").show();
                    res = false;
                }
            }
            if (!res) {
                $.alert({
                    title: "Error",
                    content: msg,
                    type: "red",
                    typeAnimated: true
                });
            }
            return res;
        }

        function reloadCaptcha() {
            $("#captchaImage").attr("src", "./CaptchaServlet?t=" + new Date().getTime());
        }

        function doAddRow() {
            helpDivCount++;
            var str = "<div class=\"row\" id=\"helpRow_" + helpDivCount + "\">\n" +
                    "                                <div class=\"col-sm-12 col-md-4\">\n" +
                    "                                <span class=\"mandetory\">*</span><label class=\"eng\">Type of Help<br/>সহায় কৰাৰ/বিচৰা পদ্ধতি</label>\n" +
                    "                                    <select class=\"form-control\" id=\"type_of_help_" + helpDivCount + "\" name=\"type_of_help\">\n";
            for (var i = 0; i < helpList.length; i++) {
                str += "<option value = \"" + helpList[i].id + "\">" + helpList[i].help + "</option>\n";
            }

            str += "                                    </select>\n" +
                    "                                    <span class=\"errorSpan\" id=\"type_of_help_" + helpDivCount + "Error\"></span>\n" +
                    "                                </div>\n" +
                    "                                <div class=\"col-sm-12 col-md-4\">\n" +
                    "                                <label class=\"eng\">Help Details<br/>সাহায্যৰ বিবৰণ</label>\n" +
                    "                                    <input type=\"text\" class=\"form-control\" name=\"help_details\" placeholder=\"Enter Help Details\" id=\"help_details_" + helpDivCount + "\"/>\n" +
                    "                                    <span class=\"errorSpan\" id=\"help_details_" + helpDivCount + "Error\"></span>\n" +
                    "                                </div>\n" +
                    "                                <div class=\"col-sm-12 col-md-4\">\n" +
                    "                                <label class=\"eng\">Quantity<br/>পৰিমাণ</label>\n" +
                    "                                    <input type=\"text\" class=\"form-control\" name=\"help_quantity\" placeholder=\"Enter Quantity\" id=\"help_quantity_" + helpDivCount + "\"/>\n" +
                    "                                    <span class=\"errorSpan\" id=\"help_quantity_" + helpDivCount + "Error\"></span>\n" +
                    "                                </div>\n" +
                    "                            </div>";
            $("#helpDiv").append(str);
            $("#type_of_help_" + helpDivCount).val(helpList[0].id);
            $("#helpDivCount").val(helpDivCount);
        }

        function doRemoveRow() {
            if (helpDivCount <= 1) {
                $.alert({
                    title: "Error",
                    content: "Last Row",
                    type: "red",
                    typeAnimated: true
                });
                helpDivCount = 1;
            } else {
                $("#helpRow_" + helpDivCount).remove();
                helpDivCount--;
            }
            $("#helpDivCount").val(helpDivCount);
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
