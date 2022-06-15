<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>

<div>
	<form id="frm" naem="frm" method="post" enctype="multipart/form-data">
		 <table class="board_view">
		 	<colgroup>
			 	<col width="15%">
			 	<col width="*"/>
		 	</colgroup>
		 	<caption>게시글 작성</caption>
		 	<tbody>
		 		<tr>
		 			<th scope="row">제목</th>
		 			<td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
		 		</tr>
		 		<tr>
		 			<td colspan="2" class="view_text">
		 				<textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
		 			</td>
		 		</tr>
		 	</tbody>
		 </table>
		 <div id="fileDiv">
			<p>
				<input type="file" id="file" name="file_0">
				<a href="#this" class="btn" id="delete" name="delete">삭제</a>
			</p>
		</div>
		 <br/><br/>
		 <a href="#this" class="btn" id="addFile">파일 추가</a>
		 <a href="javascript:void(0);" class="btn" id="write" >작성하기</a>
		 <a href="javascript:void(0);" class="btn" id="list" >목록으로</a>
	</form>
</div>

<script type="text/javascript">
	var gfv_count = 1;

	$(document).ready(function(){
		$("#list").on("click", function(e){
			fn_openBoardList();
		})

		$("#write").on("click", function(e){
			fn_insertBoard();
		})

		$("#addFile").on("click", function(e){ //파일 추가 버튼
			fn_addFile();
		});

		$("a[name='delete']").on("click", function(e){ //삭제 버튼
			fn_deleteFile($(this));
		});

	});

	function fn_openBoardList(){
		$('#frm')[0].action = '/sample/openSampleBoardList.do';
		$('#frm')[0].submit();

	}

	function fn_insertBoard(){
		$('#frm')[0].action = '/sample/insertBoard.do';
		$('#frm')[0].submit();
	}

	function fn_addFile(){
		var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
		$("#fileDiv").append(str);
		$("a[name='delete']").on("click", function(e){ //삭제 버튼
			fn_deleteFile($(this));
		});
	}

	function fn_deleteFile(obj){
		obj.parent().remove();
	}
</script>
