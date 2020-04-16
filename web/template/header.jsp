<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- Header -->
    <header id="header" class="alt">
        <h1><a href="./Index" style="color:#385E5F"><c:out value="${param.pageTitle}"/></a></h1>
        <a href="#nav" style="color: #385E5F">Menu</a>
    </header>

    <!-- Nav -->
    <nav id="nav">
        <ul class="links">
            <li><a href="./Index">Home</a></li>
            <li><a href="./Register?type=HELP SEEKER">Register for seeking help</a></li>
            <li><a href="./Register?type=HELP GIVER">Register for giving help</a></li>
            <li><a href="./GetSearch?type=HELP SEEKER">Search for help seeker</a></li>
            <li><a href="./GetSearch?type=HELP GIVER">Search for help giver</a></li>
            <li><a href="./FAQ">FAQ</a></li>
        </ul>
    </nav>

    <!-- Banner -->
    <section id="banner">
        <img src="./images/logo.jpeg" />

        <span class="tag-line-block">
            <span>
                An Initiative by Assam Police | Let’s Help Each Other
            </span>
            <span>
                অসম আৰক্ষী এক প্ৰচেষ্টা…… আহক ইজনে সিজনক সহায় কৰো ।
            </span>
        </span>
    </section>
    <section id="zero" class="wrapper style0">

        <i class="fa fa-mobile fa-2x"></i><a href="./DownloadApk" style="font-size: x-large;"><span class="label">Download our mobile app</span></a>
        <!--</a>-->
    </section>