<%-- 
    Document   : index
    Created on : 7 Apr, 2020, 8:04:19 PM
    Author     : Bhaskor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<jsp:include page='../template/admin/head.jsp'>
    <jsp:param name="pageTitle" value="Home"/>
</jsp:include>
<body style="margin-bottom: 70px;">
    <style type="text/css">
        .login-form {
            width: 340px;
            margin: 50px auto;
        }
        .login-form form {
            margin-bottom: 15px;
            background: #f7f7f7;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            padding: 30px;
        }
        .login-form h2 {
            margin: 0 0 15px;
        }
        .form-control, .btn {
            min-height: 38px;
            border-radius: 2px;
        }
        .btn {        
            font-size: 15px;
            font-weight: bold;
        }
    </style>
    <div class="loader"></div>
    <jsp:include page='../template/admin/header.jsp'>
        <jsp:param name="user" value="${fn:toUpperCase(fn:substring(username, 0, 1))}${fn:toLowerCase(fn:substring(username, 1,fn:length(username)))}"/>
    </jsp:include>
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
            <div class="col-sm-0 col-md-1"></div>
            <div class="col-sm-12 col-md-10 borderDiv">
                <div class="col-sm-12 col-md-4">
                    <label>Search By District</label>
                    <div class="input-group">
                        <select class="form-control" id="district" name="district">
                            <option value="-1">--SELECT--</option>
                            <option value="Barpeta">Barpeta</option>
                            <option value="Bongaigaon">Bongaigaon</option>
                            <option value="Cachar">Cachar</option>
                            <option value="Darrang">Darrang</option>
                            <option value="Dhemaji">Dhemaji</option>
                            <option value="Dhubri">Dhubri</option>
                            <option value="Dibrugarh">Dibrugarh</option>
                            <option value="Goalpara">Goalpara</option>
                            <option value="Golaghat">Golaghat</option>
                            <option value="Hailakandi">Hailakandi</option>
                            <option value="Jorhat">Jorhat</option>
                            <option value="Kamrup">Kamrup</option>
                            <option value="Karbi Anglong">Karbi Anglong</option>
                            <option value="Karimganj">Karimganj</option>
                            <option value="Kokrajhar">Kokrajhar</option>
                            <option value="Lakhimpur">Lakhimpur</option>
                            <option value="Marigaon">Marigaon</option>
                            <option value="Nagaon">Nagaon</option>
                            <option value="Nalbari">Nalbari</option>
                            <option value="North Cachar Hills">North Cachar Hills</option>
                            <option value="Sibsagar">Sibsagar</option>
                            <option value="Sonitpur">Sonitpur</option>
                            <option value="Tinsukia">Tinsukia</option>
                        </select>
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button" id="districtSearch"><i class="glyphicon glyphicon-search"></i>&nbsp; Go!</button>
                        </span>
                    </div>
                </div>
                <div class="col-sm-12 col-md-4">
                    <label>Search By Pin Code</label>
                    <div class="input-group">
                        <input type='text' class="form-control" id='pincode' name="pin" placeholder="Enter Pin Code to search"/>
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button" id="pinSearch"><i class="glyphicon glyphicon-search"></i>&nbsp; Go!</button>
                        </span>
                    </div>
                </div>
                <div class="col-sm-12 col-md-4">
                    <label>Search By Date</label>
                    <div class="input-group">
                        <input type='text' class="form-control" id='datepicker' name="date" readonly="readonly" placeholder="Select Date to search"/>
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="button" id="dateSearch"><i class="glyphicon glyphicon-search"></i>&nbsp; Go!</button>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-sm-0 col-md-1"></div>
        </div>
        <div class="row" id="resultDiv">

        </div>
    </div>
    <jsp:include page='../template/admin/footer.jsp' />
    <script type="text/javascript">
        $(document).ready(function() {
        });
        $(document).ajaxStart(function() {
            $(".loader").show();
        });
        $(document).ajaxStop(function() {
            $(".loader").fadeOut('slow');
        });
    </script>
</body>
</html>
