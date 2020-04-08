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
    <div class="container" style="margin-top: 5px;">
        <div class="row" style="margin-bottom: 10px;">
            <div class="col-sm-0 col-md-10"></div>
            <div class="col-sm-12 col-md-2">
                <label class="eng">Site Language: </label>
                <label class="ass">Site Language: </label>
                <select class="form-control" id="langSelect" onchange="doChangeRadio(this.value);">
                    <option value="eng">ENGLISH</option>
                    <option value="ass">ASSAMESE</option>
                </select>
            </div>
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
        <div class="row">
            <div class="col-sm-0 col-md-2"></div>
            <div class="col-sm-11 col-md-8 form-div">
                <div class="row">
                    <form action="./RegisterMember" method="POST" onsubmit="return doValidateForm()">
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Enter Name</label>
                            <label class="ass" style='font-size: small;'>Enter Name</label>
                            <input type="text" class="form-control" name="name" placeholder="Enter Name" id="name"/>
                            <span class="errorSpan" id="nameError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Mobile No</label>
                            <label class="ass" style='font-size: small;'>Mobile No</label>
                            <input type="text" class="form-control" name="mobile" placeholder="Enter Mobile No" id="mobile"/>
                            <span class="errorSpan" id="mobileError"></span>
                        </div>
                        
                        <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-6">
                            <label class="eng">Email</label>
                            <label class="ass" style='font-size: small;'>Email</label>
                            <input type="text" class="form-control" name="email" placeholder="Enter Email" id="email"/>
                            <span class="errorSpan" id="emailError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Gender</label>
                            <label class="ass" style='font-size: small;'>Gender</label>
                            <select class="form-control" id="gender" name="gender">
                                <option value="MALE" selected="selected">MALE</option>
                                <option value="FEMALE">FEMALE</option>
                                <option value="OTHER">OTHER</option>
                            </select>
                            <span class="errorSpan" id="genderError"></span>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Age</label>
                            <label class="ass" style='font-size: small;'>Age</label>
                            <input type="text" class="form-control" name="age" placeholder="Enter Age" id="age"/>
                            <span class="errorSpan" id="ageError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Pin Code</label>
                            <label class="ass" style='font-size: small;'>Pin Code</label>
                            <input type="text" class="form-control" name="pincode" placeholder="Enter Pin Code" id="pincode" onblur="doGetState(this.value);"/>
                            <span class="errorSpan" id="pincodeError"></span>
                        </div>
                       <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-6">
                            <label class="eng">State: </label>
                            <label class="ass" style='font-size: small;'>State: </label>
                            <label id="state">---</label>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <label class="eng">District: </label>
                            <label class="ass" style='font-size: small;'>District: </label>
                            <label id="district">---</label>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Address</label>
                            <label class="ass" style='font-size: small;'>Address</label>
                            <textarea name="address" class="form-control" id="address"></textarea>
                            <span class="errorSpan" id="addressError"></span>
                        </div>
                        <div class="col-xs-9 col-md-6">
                            <span class="mandetory">*</span><label class="eng">Type of Help</label>
                            <label class="ass" style='font-size: small;'>Type of Help</label>
                            <select class="form-control" id="type_of_help" name="type_of_help">
                                <option value="FOOD" selected="selected">FOOD</option>
                                <option value="GROCERY">GROCERY</option>
                                <option value="MONEY">MONEY</option>
                            </select>
                            <span class="errorSpan" id="type_of_helpError"></span>
                        </div>
                        <div class="clearfix"></div>
                        <input type="hidden" class="form-control" name="type" id="type" value="${type}"/>
                        <div class="col-xs-9 col-md-12 text-center" style="margin-top: 10px;">
                            <input type="submit" name="submit" class="btn btn-success" value="Register" />
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
            $("#langSelect").val("eng");
            $(".errorSpan").hide();
            $(".ass").hide();
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
            } 
//            else if ($("#gender").val()) {
//                $("#searchError").html("Enter a valid Pin Code");
//                $("#searchError").show();
//                return false;
//            } 
            else if (isNaN($("#age").val())) {
                $("#ageError").html("Enter a valid Age");
                $("#ageError").show();
                return false;
            } else if (Number($("#age").val()) < 0 || Number($("#age").val()) > 120) {
                $("#ageError").html("Enter a valid Age");
                $("#ageError").show();
                return false;
            }else if (!$("#pincode").val().match(/[1-9][0-9]{5}/)) {
                $("#pincodeError").html("Enter a valid Pin Code");
                $("#pincodeError").show();
                return false;
            } else if ($("#address").val().length < 6) {
                $("#addressError").html("Enter a valid Address");
                $("#addressError").show();
                return false;
            } 
            return true;
        }

        function isValidEmail(emailAddress) {
//            return true;
            var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
            return pattern.test(emailAddress);
        }
    </script>
</body>
</html>
