<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>

<div>
	<form id="frm">
		 <table class="board_view">
		 	<colgroup>
			 	<col width="15%">
			 	<col width="35&"/>
			 	<col width="15%">
			 	<col width="35%">
		 	</colgroup>
		 	<caption>게시글 상세</caption>
		 	<tbody>
		 		<tr>
		 			<th scope="row">글 번호</th>
					<td>${map.TITLE }</td>
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
					<td colspan="3">${map.TITLE }</td>
				</tr>
				<tr>
					<td colspan="4">${map.CONTENTS }</td>
				</tr>
		 	</tbody>
		 </table>
		 <a href="#this" class="btn" id="list">목록으로</a>
		 <a href="#this" class="btn" id="update">수정하기</a>
	</form>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$("#list").on("click", function(e){
			fn_openBoardList();
		})

		$("#update").on("click", function(e){
			fn_openBoardUpdate();
		})

	});

	function fn_openBoardList(){
		$('#frm')[0].action = '/sample/openSampleBoardList.do';
		$('#frm')[0].submit();

	}

	function fn_openBoardUpdate(){
		$('#frm')[0].action = '/sample/openBoardUpdate.do';
		$('#frm')[0].submit();
	}
</script>
