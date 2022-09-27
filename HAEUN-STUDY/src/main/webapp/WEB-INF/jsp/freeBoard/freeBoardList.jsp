<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>

<div class="row page-titles mx-0">
    <div class="col p-md-0">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0)">게시판</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0)">자유게시판</a></li>
        </ol>
    </div>
</div>
<!-- row -->

<form id="frm">
	<input type="hidden" id="IDX" name="IDX"/>
	<div class="container-fluid">
	    <div class="row">
	        <div class="col-12">
	            <div class="card">
	                <div class="card-body">
						<div style="display:flex;flex-direction: row-reverse;padding: 0 31px;">
	<!-- 						<div style="flex:auto;"> -->
	<!-- 		                    <h4>자유게시판</h4> -->
	<!-- 						</div> -->
							<div>
			                    <button type="button" class="btn mb-1 btn-primary" id="writeForm">글작성</button>
							</div>
						</div>
	                    <div class="table-responsive">
	                        <table class="table table-bordered zero-configuration" id="freeTable">
	                            <colgroup>
									<col width="10%"/>
									<col width="*"/>
									<col width="15%"/>
									<col width="20%"/>
								</colgroup>
					            <thead>
	                                <tr>
	                                    <th>글번호</th>
	                                    <th>제목</th>
	                                    <th>조회수</th>
	                                    <th>작성일</th>
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
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</form>

<script>
	$(document).ready(function () {
	    $('#freeTable').DataTable({
	    	"lengthChange": false,
	    	"searching": false,
	    	"pageLength": 20,
	    	"order": [[0,'desc']]
	    });

	    $("#writeForm").on("click", function(e){
			fn_openBoardWrite();
		})
	});

	function fn_openBoardWrite(){
		$('#frm')[0].action = "<c:url value='/freeBoard/openFreeBoardWrite.do' />";
		$('#frm')[0].submit();
	}

	function fn_openBoardDetail(idx){
		$('#IDX').val(idx);
		$('#frm')[0].action = "<c:url value='/freeBoard/openFreeBoardDetail.do' />";
		$('#frm')[0].submit();
	}

</script>
