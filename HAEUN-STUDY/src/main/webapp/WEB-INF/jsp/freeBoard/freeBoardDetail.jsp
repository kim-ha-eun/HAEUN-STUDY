<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>
<script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/super-build/ckeditor.js"></script>
<style>
            .ck-editor__editable[role="textbox"] {
                /* editing area */
                min-height: 600px;
            }
            .ck-content .image {
                /* block images */
                max-width: 80%;
                margin: 20px auto;
            }
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
            .form-div{
            	align-items: center;
   			 	display: flex;
            }
            .input-group-text{
            	width:100px;
            }
            .form-group{
	            display:flex;
	            padding:0px;
            }
            .form-group > label{
           		width: 84px;
           		padding: 0.68rem 0.75rem;
            }
            .form-group > div{
	            position: relative;
	            flex: 1 1 auto;
	            width: 1%;
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
<form id="frm" naem="frm" method="post" enctype="multipart/form-data">
	<input type="hidden" id="IDX" name="IDX" value="${map.IDX }"/>
	<input type="hidden" id="FEIL_IDX" name="FEIL_IDX">
	 <div class="container-fluid">
	     <div class="row">
	         <div class="col-12">
	             <div class="card">
	                 <div class="card-body">
	                 	   <div class="row">
		                 	   <div class="form-group col" style="margin-bottom:20px;">
			                       <label class="col-form-label" for="TITLE">글 번호</label>
			                       <div>
		                           		<input type="text" class="form-control" value="${map.IDX}" readonly style="background:none;">
		                           </div>
		                 	   </div>
		                 	   <div class="form-group col" style="margin-bottom:20px;">
			                       <label class="col-form-label" for="TITLE">조회수</label>
			                       <div>
		                           		<input type="text" class="form-control" value="${map.HIT_CNT}" readonly style="background:none;">
		                           </div>
		                 	   </div>
	                 	   </div>
	                 	   <div class="row">
		                 	   <div class="col form-group" style="margin-bottom:20px;">
			                 	   <label class="col-form-label" for="TITLE">작성자</label>
			                       <div>
		                           		<input type="text" class="form-control" value="${map.CREA_ID}" readonly style="background:none;">
		                           </div>
		                 	   </div>

		                 	   <div class="col form-group">
			                 	   <label class="col-form-label" for="TITLE">작성 시간</label>
			                       <div>
		                           		<input type="text" class="form-control" value="${map.CREA_DTM}" readonly style="background:none;">
		                           </div>
		                 	   </div>
	                 	   </div>
		                   <div class="form-group row">
		                        <label class="col-form-label" for="TITLE">제목</label>
		                        <div>
		                            <input type="text" class="form-control" value="${map.TITLE}" readonly style="background:none;">
		                        </div>
		                   </div>
<!-- 	                       <div id="editor" style=" margin-top:20px;padding: 10px;border: 1px solid #ced4da;min-height: 500px;"> -->
<%-- 	                      		 <jsp:include page="/editorView.do"> --%>
<%-- 	                      		 	<jsp:param name="contents" value="${map.CONTENTS }" /> --%>
<%-- 	                      		 </jsp:include> --%>
<!-- 						   </div> -->
						   <div style="border:1px solid #ced4da;">
	                    	   <iframe src="<c:url value='/editorView.do?IDX=${map.IDX}' />" id="editorViewIframe" name="에디터뷰" width="100%" style="height: 696px;border: none;"></iframe>
						   </div>
	                 </div>
	             </div>
	             <div class="card">
	                 <div class="card-body">
	                	 <div style="display:flex;border-bottom: 1px solid #ced4da;margin-bottom:10px;">
		                 	 <i class="fa fa-paperclip m-r-5 f-s-18"></i>
						     <h5 class="card-title" for="exampleFormControlFile1">첨부파일</h5>
	                	 </div>
	                	 <div id ="fileDiv">
							 <c:choose >
								<c:when test="${list.size() > 0}">
									<c:forEach var="row" items="${list }">
										<div class="form-group" style="display:flex;">
											<i class="fa fa-chevron-right" style="padding-top: 4px;margin-right: 6px;"></i>
											<a href="javascript:void(0);" onclick="fn_downloadFile(${row.IDX })" name="file">${row.ORIGINAL_FILE_NAME }</a>
											(${row.FILE_SIZE }kb)
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									첨부파일이 없습니다.
								</c:otherwise>
							</c:choose>
	                	 </div>
						 <div style="text-align: center;">
		                     <button id="editBtn" class="btn btn-info btn-rounded" onclick="fn_list()" type="button">목록</button>
		                     <button id="updateBtn" class="btn btn-success btn-rounded" onclick="fn_update()" type="button">수정</button>
		                     <button id="deleteBtn" class="btn btn-danger btn-rounded" data-toggle="modal" data-target="#deleteModal" type="button">삭제</button>
						 </div>
	                 </div>
	             </div>
	         </div>
	     </div>
	 </div>
</form>

<!-- 삭제 모달 -->

 <!-- Modal -->
 <div class="modal fade" id="deleteModal">
     <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content">
             <div class="modal-header">
                 <h5 class="modal-title">삭제 확인</h5>
                 <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                 </button>
             </div>
             <div class="modal-body">
                 <p>정말 삭제하시겠습니까?</p>
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                 <button type="button" class="btn btn-primary btn-danger" onclick="fn_delete()">삭제</button>
             </div>
         </div>
     </div>
 </div>

<script>

	function fn_list(){
		$('#frm')[0].action = "<c:url value='/freeBoard/freeBordList.do' />";
		$('#frm')[0].submit();
	}

	function fn_downloadFile(idx){
		$('#FEIL_IDX').val(idx);
		$('#frm')[0].action =  "<c:url value='/common/downloadFile.do' />";
		$('#frm')[0].submit();
	}

	function fn_delete(){
		$('#frm')[0].action = "<c:url value='/freeBoard/deleteBoard.do' />";
		$('#frm')[0].submit();
	}

	function fn_update(){
		$('#frm')[0].action =  "<c:url value='/freeBoard/openBoardUpdate.do' />";
		$('#frm')[0].submit();
	}

</script>