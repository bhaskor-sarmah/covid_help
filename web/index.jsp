<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <jsp:include page='./template/head.jsp'>
        <jsp:param name="pageTitle" value="SAHODAR"/>
    </jsp:include>
    <body class="landing">
        <div class="loader"></div>
        <jsp:include page='./template/header.jsp'>
            <jsp:param name="pageTitle" value="HOME"/>
        </jsp:include>
        <!-- One -->
        <!-- One -->
        <section id="one" class="wrapper style1">
            <c:if test="${not empty msg}">
                <div class="row">
                    <div class="col-sm-0 col-md-2"></div>
                    <div class="col-sm-12 col-md-8">
                        ${msg}
                    </div>
                    <div class="col-sm-0 col-md-2"></div>
                </div>
            </c:if>
            <div class="inner">

                <article class="feature">
                    <!-- <span class="image"><img src="images/kindness.svg" alt="" style="height: 150px;padding:8px"/></span> -->
                    <div class="content">
                        <h2>Register for seeking help</h2>
                        <p>
                            <span class="tag-line-block">
                                <span>
                                    সহায় বিচাৰিবৰ বাবে নিবন্ধন কৰক
                                </span>
                            </span>
                        </p>
                        <ul class="actions">
                            <li>
                                <a href="#" class="button alt"> Register </a>
                            </li>
                        </ul>
                    </div>
                </article>
                <article class="feature">
                    <!-- <span class="image"><img src="images/help.svg" alt="hep" style="height: 150px;padding:8px" /></span> -->
                    <div class="content">
                        <h2>Register for giving help</h2>
                        <p>
                            <span class="tag-line-block">
                                <span>
                                    সহায় কৰিবৰ বাবে নিবন্ধন কৰক
                                </span>

                            </span>
                        </p>
                        <ul class="actions">
                            <li>
                                <a href="#" class="button alt"> Register </a>
                            </li>
                        </ul>
                    </div>
                </article>

                <article class="feature">
                    <!-- <span class="image"><img src="images/ser1.svg" alt="" style="height: 150px;padding:8px" /></span> -->
                    <div class="content">
                        <h2> Search for help Seeker </h2>
                        <p>
                            <span class="tag-line-block">
                                <span>
                                    সহায় বিচাৰোতাৰ সন্ধান কৰক
                                </span>

                            </span>
                        </p>
                        <ul class="actions">
                            <li>
                                <a href="#" class="button alt"> Search </a>
                            </li>
                        </ul>
                    </div>
                </article>
                <article class="feature">
                    <!-- <span class="image"><img src="images/phone.svg" alt="" style="height: 150px;padding:8px"/></span> -->
                    <div class="content">
                        <h2>Search for help Giver</h2>
                        <p>
                            <span class="tag-line-block">
                                <span>
                                    সহায়দাতাৰ সন্ধান কৰক
                                </span>

                            </span>
                        </p>
                        <ul class="actions">
                            <li>
                                <a href="#" class="button alt"> Search </a>
                            </li>
                        </ul>
                    </div>
                </article>

            </div>
        </section>
        <!--        <section id="one" class="wrapper style1">
        
                    <div class="inner">
                        <article class="feature left">
                            <span class="image"><img src="images/kindness.svg" alt="" style="height: 150px;padding:8px"/></span>
                            <div class="content">
                                <h2>Register for seeking help</h2>
                                <p>
                                    <span class="tag-line-block">
                                        <span>
                                           সহায় বিচাৰিবলৈ ৰেজিষ্টাৰ কৰক
                                        </span>
                                    </span>
                                </p>
                                <ul class="actions">
                                    <li>
                                        <form action="./Register" method="POST" id="registerSeeker">
                                            <input type="hidden" name="type" value="HELP SEEKER" />
                                            <button type="submit" class="button alt">Register&nbsp;(ৰেজিষ্টাৰ)</button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </article>
                        <article class="feature right">
                            <span class="image"><img src="images/help.svg" alt="hep" style="height: 150px;padding:8px" /></span>
                            <div class="content">
                                <h2>Register for giving help</h2>
                                <p>
                                    <span class="tag-line-block">
                                        <span>
                                            সহায় আগবঢ়াবলৈ ৰেজিষ্টাৰ কৰক
                                        </span>
                                    </span>
                                </p>
                                <ul class="actions">
                                    <li>
                                        <form action="./Register" method="POST" id="registerGiver">
                                            <input type="hidden" name="type" value="HELP GIVER" />
                                            <button type="submit" class="button alt">Register&nbsp;(ৰেজিষ্টাৰ)</button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </article>
        
                        <article class="feature left">
                            <span class="image"><img src="images/ser1.svg" alt="" style="height: 150px;padding:8px" /></span>
                            <div class="content">
                                <h2> Search for help Seeker </h2>
                                <p>
                                    <span class="tag-line-block">
                                        <span>
                                            সহায় বিচাৰোতাৰ সন্ধান কৰক 
                                        </span>
                                    </span>
                                </p>
                                <ul class="actions">
                                    <li>
                                        <form action="./GetSearch" method="POST" id="searchSeeker">
                                            <input type="hidden" name="type" value="HELP SEEKER" />
                                            <button type="submit" class="button alt">Search&nbsp;(অনুসন্ধান)</button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </article>
                        <article class="feature right">
                            <span class="image"><img src="images/phone.svg" alt="" style="height: 150px;padding:8px"/></span>
                            <div class="content">
                                <h2>Search for help Giver</h2>
                                <p>
                                    <span class="tag-line-block">
                                        <span>
                                            সহায় কৰোতাৰ সন্ধান কৰক 
                                        </span>
                                    </span>
                                </p>
                                <ul class="actions">
                                    <li>
                                        <form action="./GetSearch" method="POST"  id="searchGiver">
                                            <input type="hidden" name="type" value="HELP GIVER" />
                                            <button type="submit" class="button alt">Search&nbsp;(অনুসন্ধান)</button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </article>
                        <article class="feature left">
                            <span class="image"><img src="images/kindness.svg" alt="" style="height: 150px;padding:8px"/></span>
                            <div class="content">
                                <h2>Frequently Asked Questions (FAQ) </h2>
                                <p>
                                    <span class="tag-line-block">
                                        <span>
                                            সহজতে জানিব খোজা  প্ৰশ্ন ।
                                        </span>
                                    </span>
                                </p>
                                <ul class="actions">
                                    <li>
                                        <form action="./FAQ" method="POST" id="registerSeeker">
                                            <button type="submit" class="button alt">View&nbsp;(দর্শন)</button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </article>
                    </div>
                </section>-->
        <jsp:include page='./template/footer.jsp' />
    </body>
</html>
