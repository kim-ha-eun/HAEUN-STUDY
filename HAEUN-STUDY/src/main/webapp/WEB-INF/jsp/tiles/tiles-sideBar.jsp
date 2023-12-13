<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>
<!--**********************************Sidebar start***********************************-->
<div class="nk-sidebar">
    <div class="nk-nav-scroll">
        <ul class="metismenu" id="menu">
            <li>
                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    <i class="icon-note menu-icon"></i><span class="nav-text">게시판</span>
                </a>
                <ul aria-expanded="false">
                    <li><a href="javascript:void(0);" onclick="moveMenu('/freeBoard/freeBordList.do')">자유게시판</a></li>
                    <li><a href="javascript:void(0);" onclick="moveMenu('/user/userRegForm.do')">회원가입</a></li>
                    <li><a href="javascript:void(0);" onclick="moveMenu('/calender/calenderForm.do')">달력</a></li>
                     <li><a href="javascript:void(0);" onclick="moveMenu('/chatting/chattingForm.do')">채팅방</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!--**********************************Sidebar end***********************************-->