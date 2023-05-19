<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>

<h4 style="text-align: center;"><img src="<c:url value='/images/titlelogo-color.png'/>" alt=""></h4>
<form class="mt-5 mb-5 login-input">
    <div class="form-group">
        <input type="email" class="form-control" placeholder="이메일">
    </div>
    <div class="form-group">
        <input type="password" class="form-control" placeholder="비밀번호">
    </div>
    <button class="btn login-form__btn submit w-100">로그인</button>
</form>
<p class="mt-5 login-form__footer"><a onclick="fn_userRegForm()" class="text-primary">회원가입</a></p>

<script>
$(function() {


})

function fn_userRegForm(){
	location.href = "<c:url value='/user/userRegForm.do' />"
}

</script>