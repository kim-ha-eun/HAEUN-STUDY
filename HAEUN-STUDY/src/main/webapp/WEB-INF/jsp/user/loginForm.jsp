<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>

<h4 style="text-align: center;"><img src="<c:url value='/images/titlelogo-color.png'/>" alt=""></h4>
<form class="mt-5 mb-5 login-input" id="loginForm" name="loginForm" method="post">
    <div class="form-group">
        <input type="email" class="form-control" id="email" name="email" placeholder="이메일">
    </div>
    <div class="form-group">
        <input type="password" class="form-control" id="val-password" name="val-password" placeholder="비밀번호">
    </div>
    <button class="btn login-form__btn submit w-100" id="loginBtn">로그인</button>
</form>
<!-- <p class="mt-5 login-form__footer"><a onclick="fn_userRegForm()" class="text-primary">회원가입</a></p> -->

<script>
$(function() {
	jQuery(".login-input").validate({
		ignore:[],errorClass:"invalid-feedback animated fadeInDown",
		errorElement:"div",
		errorPlacement:function(e,a){jQuery(a).parents(".form-group").append(e)},
		highlight:function(e){jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-invalid")},
		success:function(e){jQuery(e).closest(".form-group").removeClass("is-invalid"),jQuery(e).remove();},
		rules:{"val-email":{required:!0,email:!0},
			   "val-password":{required:!0,minlength:5},

		},
		messages:{"email":"유효한 이메일을 입력하세요",
			      "val-password":{required:"비밀번호를 입력하세요",minlength:"5글자 이상 입력하세요"},
		},
		submitHandler:function(form) {
			fn_login();
		}
	});

})

function fn_userRegForm(){
	location.href = "<c:url value='/user/userRegForm.do' />"
}

function fn_login(){
	AjaxAP.send("<c:url value='/user/login.do' />",$('#loginForm').serialize(),"json",function(data){
		if(data.result === 0) alert( "존재하지 않는 아이디입니다.");
		else if (data.result === -1) alert( "비밀번호를 확인하세요.");
		else if (data.result === 1 ){
			location.href = "<c:url value='/main.do' />"
		}
	})
}

</script>