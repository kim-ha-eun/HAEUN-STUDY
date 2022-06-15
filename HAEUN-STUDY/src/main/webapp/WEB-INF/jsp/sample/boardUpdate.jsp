<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>

<div>
	<form id="frm" name="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="IDX" name="IDX" value="${map.IDX }"/>
		<table class="board_view">
		 	<colgroup>
			 	<col width="15%">
			 	<col width="35&"/>
			 	<col width="15%">
			 	<col width="35%">
		 	</colgroup>
		 	<caption>게시글 수정</caption>
		 	<tbody>
		 		<tr>
		 			<th scope="row">글 번호</th>
					<td>${map.IDX }</td>
					<th scope="row">조회수</th>
					<td>${map.HIT_CNT }</td>
		 		</tr>
		 		<tr>
					<th scope="row">작성자</th>
					<td>${map.CREA_ID }</td>
					<th scope="row">작성시간</th>
					<td>${map.CREA_DTM }</td>
		 		</tr>
		 		<tr>
					<th scope="row">제목</th>
					<td colspan="3"><input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${map.TITLE }"/></td>
				</tr>
				<tr>
					<td colspan="4" class="view_text"><textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS">${map.CONTENTS }</textarea></td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<td colspan="3">
						<div id="fileDiv">
							<c:forEach var="row" items="${list }" varStatus="var">
								<p>
									<input type="hidden" id="IDX_${var.index}" name="IDX_${var.index }" value="${row.IDX }">
									<a href="#this" id="name_${var.index }" name="name_${var.index }">${row.ORIGINAL_FILE_NAME }</a>
									<input type="file" id="file_${var.index }" name="file_${var.index }">
									(${row.FILE_SIZE }kb)
									<a href="#this" class="btn" id="delete_${var.index }" name="delete_${var.index }">삭제</a>
								</p>
							</c:forEach>
						</div>
					</td>
				</tr>
		 	</tbody>
		 </table>
		 <a href="#this" class="btn" id="addFile">파일 추가</a>
		 <a href="#this" class="btn" id="list">목록으로</a>
		 <a href="#this" class="btn" id="update">수정하기</a>
		 <a href="#this" class="btn" id="delete">삭제하기</a>
	</form>
</div>

<script type="text/javascript">
	var gfv_count = '${fn:length(list)+1}';
	$(document).ready(function(){
		$("#list").on("click", function(e){
			fn_openBoardList();
		})

		$("#update").on("click", function(e){
			fn_updateBoard();
		})

		$("#delete").on("click", function(e){ //삭제하기 버튼
			fn_deleteBoard();
		});

		$("#addFile").on("click", function(e){ //파일 추가 버튼
			fn_addFile();
		});

		$("a[name^='delete']").on("click", function(e){ //삭제 버튼
			fn_deleteFile($(this));
		});

		function fn_addFile(){
			var str = "<p>" +
					"<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"+
					"<a href='#this' class='btn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a>" +
				"</p>";
			$("#fileDiv").append(str);
			$("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼
				fn_deleteFile($(this));
			});
		}

		function fn_deleteFile(obj){
			obj.parent().remove();
		}

	});

	function fn_openBoardList(){
		$('#frm')[0].action = '/sample/openSampleBoardList.do';
		$('#frm')[0].submit();

	}

	function fn_updateBoard(){
		$('#frm')[0].action = '/sample/updateBoard.do';
		$('#frm')[0].submit();
	}

	function fn_deleteBoard(){
		$('#frm')[0].action = '/sample/deleteBoard.do';
		$('#frm')[0].submit();
	}
</script>
