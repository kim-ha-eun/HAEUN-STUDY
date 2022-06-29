<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>

<form id="frm">
	<input type="hidden" id="IDX" name="IDX"/>
	<div>
		<h2>글 목록</h2>
		<table style="border:1px solid #ccc;width: 100%;">
			<colgroup>
				<col width="10%"/>
				<col width="*"/>
				<col width="15%"/>
				<col width="20%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">조회수</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach items="${list }" var="row">
							<tr>
								<td>${row.IDX }</td>
								<td><a href="javascript:void(0);" onclick="fn_openBoardDetail(${row.IDX })">${row.TITLE }</a></td>
								<td>${row.HIT_CNT }</td>
								<td>${row.CREA_DTM }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<a href="javascript:void(0);" class="btn" id="writeForm">글작성</a>
	</div>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		$("#writeForm").on("click", function(e){
			fn_openBoardWrite();
		})
	})

	function fn_openBoardWrite(){
		$('#frm')[0].action = "<c:url value='/sample/openBoardWrite.do' />";
		$('#frm')[0].submit();
	}

	function fn_openBoardDetail(idx){
		$('#IDX').val(idx);
		$('#frm')[0].action = "<c:url value='/sample/openBoardDetail.do' />";
		$('#frm')[0].submit();
	}

</script>


