<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>

<h4 style="text-align: center;"><img src="<c:url value='/images/titlelogo-color.png'/>" alt=""></h4>
<form class="mt-5 mb-5 login-input" id="frm" name="frm">
    <div class="form-group">
        <input type="text" class="form-control" id="val-name" name="val-name" placeholder="이름" >
    </div>
    <div class="form-group">
        <input type="email" class="form-control" id="val-email" name="val-email" placeholder="이메일" >
    </div>
    <div class="form-group">
        <input type="password" class="form-control" id="val-password" name="val-password" placeholder="비밀번호" >
    </div>
    <div class="form-group">
        <input type="password" class="form-control" id="val-confirm-password" name="val-confirm-password" placeholder="비밀번호 확인" >
    </div>
    <div class="form-group">
        <input type="text" class="form-control" id="val-phone" name="val-phone" placeholder="번호" >
    </div>
    <button type="submit" class="btn login-form__btn submit w-100">회원가입</button>
</form>
<p class="mt-5 login-form__footer"><a onclick="fn_loginForm()" class="text-primary">로그인</a></p>
<script>
$(function() {

	jQuery(".login-input").validate({
		ignore:[],errorClass:"invalid-feedback animated fadeInDown",
		errorElement:"div",
		errorPlacement:function(e,a){jQuery(a).parents(".form-group").append(e)},
		highlight:function(e){jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-invalid")},
		success:function(e){jQuery(e).closest(".form-group").removeClass("is-invalid"),jQuery(e).remove();},
		rules:{"val-name":{required:!0,minlength:2},
			   "val-email":{required:!0,email:!0},
			   "val-password":{required:!0,minlength:5},
			   "val-confirm-password":{required:!0,equalTo:"#val-password"},
			   "val-phone":{required:!0}

		},
		messages:{"val-name":{required:"이름을 입력하세요",minlength:"2글자 이상 입력하세요"},
			      "val-email":"유효한 이메일을 입력하세요",
			      "val-password":{required:"비밀번호를 입력하세요",minlength:"5글자 이상 입력하세요"},
			      "val-confirm-password":{required:"비밀번호 확인을 입력하세요",minlength:"5글자 이상 입력하세요",equalTo:"비밀번호와 같지 않습니다"},
			      "val-phone":"핸드폰 번호를 입력하세요"
		},
		submitHandler:function(form) {
			fn_save();
		}
	});

})

function fn_loginForm(){
	location.href = "<c:url value='/user/loginForm.do' />"
}

function fn_save(){
	$('#frm')[0].action = "<c:url value='/user/insertUserInfo.do' />";
	$('#frm')[0].submit();
}

</script>