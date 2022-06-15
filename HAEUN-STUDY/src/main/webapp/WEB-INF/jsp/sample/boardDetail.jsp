<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>

<div>
	<form id="frm">
		<input type="hidden" id="IDX" name="IDX" value="${map.IDX }"/>
		<input type="hidden" id="FEIL_IDX" name="FEIL_IDX">
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
					<td colspan="3">${map.TITLE }</td>
				</tr>
				<tr>
					<td colspan="4">${map.CONTENTS }</td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<td colspan="3">
						<c:choose >
						<c:when test="${list.size() > 0}">
							<c:forEach var="row" items="${list }">
								<p>
									<a href="javascript:void(0);" onclick="fn_downloadFile(${row.IDX })" name="file">${row.ORIGINAL_FILE_NAME }</a>
									(${row.FILE_SIZE }kb)
								</p>
							</c:forEach>
						</c:when>
						<c:otherwise>
							첨부파일이 없습니다.
						</c:otherwise>
						</c:choose>
					</td>
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

	function fn_downloadFile(idx){
		$('#FEIL_IDX').val(idx);
		$('#frm')[0].action = '/common/downloadFile.do';
		$('#frm')[0].submit();
	}

</script>
