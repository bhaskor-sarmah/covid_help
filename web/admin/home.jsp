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
        @media only screen and (max-width: 990px) {
            #searchDiv {
                padding-top: 10px;
            }
        }
        @media only screen and (min-width: 991px) {
            #searchDiv {
                padding-top: 50px;
            }
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
                <form action="./AdminSearch" method="POST">
                    <div class="col-xs-12 col-md-4">
                        <span class="mandetory">*</span><label class="ass" style='font-size: small;'>District<br/>জিলা </label>
                        <select class="form-control" name="district" id="district" onchange="doGetThana(this.value);">
                            <option value="-1">--SELECT DISTRICT--</option>
                            <c:forEach var="obj" items="${distList}">
                                <option value="${obj.distCode}">${obj.distName}</option>
                            </c:forEach>
                        </select>
                        <span class="errorSpan" id="districtError"></span>
                    </div>
                    <div class="col-xs-12 col-md-4">
                        <span class="mandetory">*</span><label class="eng">Police Station<br/>আপোনাৰ থানা লিখক</label>
                        <select class="form-control" name="thana" id="thana">
                            <option value="-1">--SELECT PS--</option>
                        </select>
                        <span class="errorSpan" id="psError"></span>
                    </div>
                    <div class="col-xs-12 col-md-4" id="searchDiv">
                        <input type="submit" name="submit" class="btn btn-success" value="Search" />
                    </div>
                    <div class="clearfix"></div> 
                </form>
            </div>
            <div class="col-sm-0 col-md-1"></div>
        </div>
        <div class="row" id="resultDiv">
            <c:choose>
                <c:when test="${not empty memList}">
                    <table class="table table-striped table-responsive" id="myTable">
                        <thead>
                            <tr>
                                <th>Name<br/>নাম</th>
                                <th>Address<br/>ঠিকনা</th>
                                <th>Mobile<br/></th>
                                <th>Type of Help<br/>সহায় কৰাৰ/বিচৰা পদ্ধতি</th>
                                <th>Remarks<br/></th>
                                <th>
                                    Action
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="obj" items="${memList}">
                                <tr>
                                    <td>${obj.name}</td>
                                    <td>${obj.address}</td>
                                    <td>${obj.mob}</td>
                                    <td>
                                        <select class="form-control" name="remark_${obj.id}" id="remark_${obj.id}">
                                            <option value="-1">--SELECT REMARK--</option>
                                            <option value="0">CONTACTED</option>
                                            <option value="1">PENDING</option>
                                            <option value="3">SOLVED</option>
                                        </select>
                                    </td>
                                    <td>
                                        <c:forEach var="o" items="${obj.help_details}" varStatus="list">
                                            <p>
                                                <b>${list.count}. HELP ${o.type}</b><br>Type : ${o.helpId},<br>Details: ${o.helpDetails},<br>Quantity: ${o.helpQuantity}
                                            </p><br>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-default" onclick="doDone('${obj.id}');">Done</button>
                                        <%--<c:if test="${obj.src == 'APP'}">--%>
                                            <a href="#" onclick="window.open('https://covirudh.in:8443/Map/Map?mno='+encodeURIComponent('${obj.mobile}'), '_blank');return false;" class="btn btn-sm btn-primary">View In Map</a>
                                        <%--</c:if>--%>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="col-sm-12">
                        Select District, Thana and Click search to view records.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <jsp:include page='../template/admin/footer.jsp' />
    <script type="text/javascript">
        $(document).ready(function() {
            $("#myTable").dataTable();
        });
        $(document).ajaxStart(function() {
            $(".loader").show();
        });
        $(document).ajaxStop(function() {
            $(".loader").fadeOut('slow');
        });

        function doGetThana(str) {
            $.ajax({
                url: './GetThana',
                type: 'POST',
                data: 'dist=' + str,
                success: function(data) {
//                    console.log(data);
//                    console.log(JSON.stringify(data));
                    //called when successful
                    var b = "<option value=\"-1\">--SELECT PS--</option>\n";
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
        function doDone(id){
            
        }
    </script>
</body>
</html>
