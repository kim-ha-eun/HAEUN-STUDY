<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>
<script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/super-build/ckeditor.js"></script>
<style>
            .ti-trash{
			    line-height: normal;
			    height: 100%;
			    text-align: center;
			    text-decoration: none;
			    width: 50px;
			    transition: all 0.2s linear;
			    font-size: 18px;
			    display: flex;
			    right: 0;
            }
            .fa-paperclip{
			   font-size: 18px;
			   margin-right:5px;
            }
            .fc-next-button{
                margin-left: 10px;
			    padding: 5px;
			    position: absolute;
			    left: 125px;
			    top: 26px;
            }
</style>
 <div class="row page-titles mx-0">
     <div class="col p-md-0">
         <ol class="breadcrumb">
             <li class="breadcrumb-item"><a href="javascript:void(0)">게시판</a></li>
             <li class="breadcrumb-item active"><a href="javascript:void(0)">자유게시판</a></li>
         </ol>
     </div>
 </div>
 <!-- row -->
<form class="form-valide" id="frm" naem="frm" method="post" enctype="multipart/form-data">
 <div class="container-fluid">
     <div class="row">
         <div class="col-12">
             <div class="card">
                 <div class="card-body ">
                    <div class="form-group row">
                        <label class="col-form-label" for="TITLE" style="width: 62px; padding: 0.68rem 0.75rem;">제목<span class="text-danger">*</span></label>
                        <div style="position: relative;flex: 1 1 auto;width: 1%;">
                            <input type="text" class="form-control" id="TITLE" name="TITLE" value="${map.TITLE }">
                        </div>
                    </div>
                    <iframe src="<c:url value='/editorUpdate.do?IDX=${map.IDX}' />" id="editorIframe" name="에디터" width="100%" style="height: 696px;border: none;">
					</iframe>
					<input type="hidden" id="CONTENTS" name="CONTENTS" />
                 </div>
             </div>
             <div class="card">
                 <div class="card-body">
                	 <div style="display:flex;border-bottom: 1px solid #ced4da;margin-bottom:10px;">
	                 	 <i class="fa fa-paperclip m-r-5 f-s-18"></i>
					     <h5 class="card-title" for="exampleFormControlFile1">첨부파일</h5>
					     <button type="button" class="fc-next-button fc-button fc-state-default fc-corner-right;" onclick="fn_addFile()">
					     	<span class="ti-plus f-s-12 m-r-5"></span>
					     </button>
                	 </div>
                	 <div id ="fileDiv">
                	 	<c:forEach var="row" items="${list }" varStatus="var">
			                 <div class="form-group" style="display:flex;">
			                 	<input type="hidden" id="IDX_${var.index}" name="IDX_${var.index }" value="${row.IDX }">
			                 	<i class="fa fa-chevron-right" style="padding-top: 7px;margin-right: 6px;"></i>
			                 	<div style="width: 100%">
				                 	<a href="#this" id="name_${var.index }" name="name_${var.index }">${row.ORIGINAL_FILE_NAME }</a>
	<%-- 							    <input type="file" class="form-control-file" id="file_${var.index }" name="file_${var.index }"> --%>
				                 	(${row.FILE_SIZE }kb)
			                 	</div>
							    <a href="javascript:void(0);" class="ti-trash" onclick="fn_deleteFile($(this))"/></a>
							 </div>
						 </c:forEach>
                	 </div>
					 <div style="text-align: center;" class="form-group">
	                     <button id="edit" class="btn btn-info btn-rounded" onclick="fn_list()" type="button">목록</button>
	                     <button id="save" class="btn btn-success btn-rounded">저장</button>
					 </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
</form>
 <!--저장 Modal -->
<!--  <div class="modal fade" id="saveModal"> -->
<!--      <div class="modal-dialog modal-dialog-centered" role="document"> -->
<!--          <div class="modal-content"> -->
<!--              <div class="modal-header"> -->
<!--                  <h5 class="modal-title">저장 확인</h5> -->
<!--                  <button type="button" class="close" data-dismiss="modal"><span>&times;</span> -->
<!--                  </button> -->
<!--              </div> -->
<!--              <div class="modal-body"> -->
<!--                  <p>정말 저장하시겠습니까?</p> -->
<!--              </div> -->
<!--              <div class="modal-footer "> -->
<!--                  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button> -->
<!--                  <button type="button" class="btn btn-primary btn-success" onclick="fn_save()">저장</button> -->
<!--              </div> -->
<!--          </div> -->
<!--      </div> -->
<!--  </div> -->

<!-- <script src="/js/editor.js"></script> -->
<script>
var gfv_count = 1;
$(function() {

	jQuery(".form-valide").validate({
		ignore:[],errorClass:"invalid-feedback animated fadeInDown",
		errorElement:"div",
		errorPlacement:function(e,a){jQuery(a).parents(".form-group > div").append(e)},
		highlight:function(e){jQuery(e).closest(".form-group").removeClass("is-invalid").addClass("is-invalid")},
		success:function(e){jQuery(e).closest(".form-group").removeClass("is-invalid"),jQuery(e).remove();},
		rules:{"TITLE":{required:!0}},
		messages:{"TITLE":"제목을 입력하세요"},
		submitHandler:function(form) {
			fn_save();
		}
	});

})



function fn_list(){
	$('#frm')[0].action = "<c:url value='/freeBoard/freeBordList.do' />";
	$('#frm')[0].submit();
}

function fn_save(){
	var iframe = document.getElementById("editorIframe");
	var iframeDom = iframe.contentWindow||iframe.contentDocuemnt;

	var editorData = iframeDom.editorData();

 	if(editorData != null && editorData != ''){
	 	$('#CONTENTS').val(editorData);

		$('#frm')[0].action = "<c:url value='/freeBoard/insertBoard.do' />";
		$('#frm')[0].submit();
 	}else{
 		alert('내용을 입력해 주세요');
 	}

}

function fn_deleteFile(obj){
	obj.parent().remove();
}

function fn_addFile(){
	var str = ' <div class="form-group" style="display:flex;">'
	 	+'<i class="fa fa-chevron-right" style="padding-top: 7px;margin-right: 6px;"></i>'
	    +'<input type="file" class="form-control-file" id="exampleFormControlFile1" name="file_'+(gfv_count++)+'">'
	    +'<a href="javascript:void(0);" class="ti-trash" onclick="fn_deleteFile($(this))"/></a>'
	 	+'</div>';

	$("#fileDiv").append(str);

}



</script>