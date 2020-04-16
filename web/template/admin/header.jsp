<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="navbar navbar-inverse" id="navbarHead" style="margin-bottom: 0px;color: white;">
    <div class="navbar-header" style="width:100%;padding-right: 20px;">
        <div class="row">
            <div class="col-sm-12 col-md-2 text-center" style="padding-left: 50px;">
                <img src="images/logo.jpeg" height="75px"/>
            </div>
            <div class="col-sm-12 col-md-8 navtext" style="" >
                <center class="text-center" style="padding-top: 10px;padding-left: 30px;font-size: small;">
                    <span style="">
                        <b>
                            <span style="font-size: large">An Initiative by Assam Police....</span>&nbsp;&nbsp;<i> Let’s Help Each Other</i>
                            <br/><span style="font-size: large">অসম আৰক্ষীৰ এক পদক্ষেপ……</span>&nbsp;&nbsp;<i> আহক ইজনে সিজনক সহায় কৰো ।</i>
                        </b></span>
                </center>
            </div>
            <div class="col-xs-6 col-md-2 text-center navtext" style="padding-top: 25px;font-size: small;">
            </div>
        </div>
    </div>
</div>
<!--Navbar-->
<nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Welcome <c:out value="${param.user}"/></a>
    </div>
    <div class="collapse navbar-collapse" id="bs-navbar-collapse">
        <ul class="nav navbar-nav">
            <li class="active"><a href="./Home">Home</a></li>
            <li><a href="#">Archive</a></li>
            <li><a href="./Logout">Logout</a></li>
        </ul>
    </div>
</nav>