<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>
<!--**********************************Nav header start***********************************-->
<div class="nav-header">
    <div class="brand-logo">
        <a href="javascript:void()" onclick="moveMenu('/main.do')">
            <b class="logo-abbr"><img src="<c:url value='/images/logo.png'/>" alt=""> </b>
            <span class="logo-compact"><img src="<c:url value='/images/logo-compact.png'/>" alt=""></span>
            <span class="brand-title">
                <img src="<c:url value='/images/titlelogo-text.png'/>" alt="">
            </span>
        </a>
    </div>
</div>
<!--**********************************Nav header end***********************************-->

<!--**********************************Header start***********************************-->
<div class="header">
    <div class="header-content clearfix">

        <div class="nav-control">
            <div class="hamburger">
                <span class="toggle-icon"><i class="icon-menu"></i></span>
            </div>
        </div>
<!--         <div class="header-left"> -->
<!--             <div class="input-group icons"> -->
<!--                 <div class="input-group-prepend"> -->
<!--                     <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span> -->
<!--                 </div> -->
<!--                 <input type="search" class="form-control" placeholder="Search Dashboard" aria-label="Search Dashboard"> -->
<!--                 <div class="drop-down animated flipInX d-md-none"> -->
<!--                     <form action="#"> -->
<!--                         <input type="text" class="form-control" placeholder="Search"> -->
<!--                     </form> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
        <div class="header-right">
            <ul class="clearfix">

                <li class="icons dropdown custom-dropdown">
                	<a href="javascript:void(0)" data-toggle="dropdown" class="custom-dropdown">
	                    <div class="user-img c-pointer position-relative">
	                        <span class="activity active"></span>
	                        <img src="<c:url value='/images/user/1.png'/>" height="40" width="40" alt="">
	                    </div>
	                </a>
                    <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                        <div class="dropdown-content-body">
                            <ul>
                                <li>
                                    <a href="javascript:void()" onclick="moveMenu('/profile.do')"><i class="icon-user"></i> <span>Profile</span></a>
                                </li>

                                <hr class="my-2">
                                <li>
                                    <a href="page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                </li>
                                <li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<!--**********************************Header end ti-comment-alt***********************************-->