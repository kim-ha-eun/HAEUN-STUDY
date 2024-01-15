<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>
<script src="<c:url value='/plugins/nouislider/nouislider.min.js'/>"></script>
<script src="<c:url value='/plugins/wnumb/wNumb.js'/>"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>
<link rel="stylesheet" href="<c:url value='/plugins/nouislider/nouislider.min.css'/>">
<link rel="stylesheet" href="<c:url value='/plugins/toastr/css/toastr.min.css'/>">

<style>
.checked::after {
  content: "\f00c";
  font-family: 'fontAwesome';
  display: block;
  left: 1px;
  position: absolute;
  top: -17px;
  z-index: 2;
  color: #162336; }

.lineThrough {
  text-decoration: line-through;
  position: relative; }
.fc-event {
    cursor: pointer !important;
}
</style>
 <div class="row page-titles mx-0">
     <div class="col p-md-0">
         <ol class="breadcrumb">
             <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
             <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
         </ol>
     </div>
 </div>

 <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 col-xl-7">
                        <div id="msgAreaDiv" class="card" style="height:500px; overflow:auto;">
                            <div class="card-body" id="msgArea">
                                <c:forEach items="${msgList }" var="msgList">
                                	<c:if test="${msgList.REGIST_NAME eq userName }">
	                                	<div class="media media-reply">
	                                		<div class="media-body" style="text-align: right;    background: #7571f92b;color: black;">
	                                			<div class="d-sm-flex justify-content-between mb-2" style="flex-direction: row-reverse;">
	                                				<h5 class="mb-sm-0">${msgList.REGIST_NAME }<small class="text-muted ml-3">${msgList.REGIST_DATE }</small></h5>
	                                			</div>
	                                			<p>${msgList.MESSAGE }</p>
	                                		</div>
	                                		<img class="ml-3 circle-rounded" src="images/avatar/2.jpg" width="50" height="50" alt="Generic placeholder image">
	                                	</div>
                                	</c:if>
                                	<c:if test="${msgList.REGIST_NAME ne userName }">
	                                	<div class="media media-reply">
	                                		<img class="ml-3 circle-rounded" src="images/avatar/2.jpg" width="50" height="50" alt="Generic placeholder image">
	                                		<div class="media-body">
	                                			<div class="d-sm-flex justify-content-between mb-2">
	                                				<h5 class="mb-sm-0">${msgList.REGIST_NAME }<small class="text-muted ml-3">${msgList.REGIST_DATE }</small></h5>
	                                			</div>
	                                			<p>${msgList.MESSAGE }</p>
	                                		</div>
	                                	</div>
                                	</c:if>
                                </c:forEach>
                       	 	</div>
                        </div>

                        <div class="card">
                            <div class="card-body">
                                <form id="frm" naem="frm" method="post" class="form-profile">
                                    <div class="form-group">
										<input type ="text" class="form-control" id="msg" />
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <ul class="mb-0 form-profile__icons">
                                            <li class="d-inline-block">
                                                <button type="button" class="btn btn-transparent p-0 mr-3"><i class="fa fa-paper-plane"></i></button>
                                            </li>
                                        </ul>
                                        <button type="button" class="btn btn-primary px-3 ml-4" id="sendBtn" onclick="fn_send()" >전송</button>
                                        <div class="card-body" style="padding:20px 10px 0 30px">
	                                        <div id="basic-slider"></div>
	                                        <span class="example-val" id="slider-step-value"></span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>


                    </div>

                      <div class="col-lg-6 col-xl-5">
                        <div class="card">
                            <div class="card-body">
                                <div id="accordion-two" class="accordion">
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseThree4" aria-expanded="true" aria-controls="collapseThree4"><i class="fa" aria-hidden="true"></i>접속중인 사람</h5>
                                        </div>
                                        <div id="collapseThree4" class="collapse show" data-parent="#accordion-two">
                                            <div class="card-body">
                                                <ul id="user_list">
	                                                 <c:forEach items="${userList }" var="userList">
														<li><input type="checkbox" name="chattingUserIdx" style="display: none;" value="${userList.SESSION_ID }"><i class="fa fa-user" style="float: left;margin-top: 3px;color: blueviolet;"></i><span style="margin-left:10px;">${userList.USER_NAME }</span></li>
	                                                 </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="mb-0" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="false" aria-controls="collapseOne1"><i class="fa" aria-hidden="true"></i> To do List</h5>
                                        </div>
                                        <div id="collapseOne1" class="collapse" data-parent="#accordion-two">
                                            <div class="card-body">
			                                    <div class="todo-list">
			                                        <div class="tdl-holder">
			                                            <div class="tdl-content">
			                                                <ul id="todo_list">
			                                                 <c:forEach items="${todoList }" var="todoList">
			                                                 	<c:if test="${todoList.COMPLETE_YN eq 'Y' }">
				                                                 	<li class="complete"><label><input type="checkbox" name="complete" value="${todoList.TODO_IDX }"><i class="checked"></i><span class="lineThrough">${todoList.TODO_CN }</span><a href='#' class="ti-trash"></a></label></li>
			                                                 	</c:if>
			                                                 	<c:if test="${todoList.COMPLETE_YN eq 'N' }">
			                                                 		<li><label><input type="checkbox" name="complete" value="${todoList.TODO_IDX }"><i></i><span>${todoList.TODO_CN }</span><a href='#' class="ti-trash"></a></label></li>
			                                                 	</c:if>
			                                                 </c:forEach>
			                                                </ul>
			                                            </div>
			                                            <div class="px-4">
			                                                <input type="text" class="tdl-new form-control" placeholder="Write new item and hit 'Enter'...">
			                                            </div>
			                                        </div>
			                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo2"><i class="fa" aria-hidden="true"></i> 메모장</h5>
                                        </div>
                                        <div id="collapseTwo2" class="collapse" data-parent="#accordion-two">
                                            <div class="card-body">
							                    <iframe src="<c:url value='/editorForChatting.do' />" id="editorIframe" name="에디터" width="100%" style="height: 500px;border: none;">
												</iframe>
												<input type="hidden" id="CONTENTS" name="CONTENTS" />
												<div style="text-align: center;">
	                                           		<button type="button" class="btn btn-primary px-3" id="saveBtn" onclick="fn_save()" >저장</button>
	                                           		<button type="button" class="btn btn-danger px-3" id="resetBtn" onclick="fn_reset()" >초기화</button>
												</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header calenderHeader">
                                            <h5 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseThree3" aria-expanded="false" aria-controls="collapseThree3"><i class="fa" aria-hidden="true"></i> 달력</h5>
                                        </div>
                                        <div id="collapseThree3" class="collapse" data-parent="#accordion-two">
                                            <div class="card-body">
                                            	<div id="calendar"></div>
                                            </div>
                                        </div>

                                        <!-- BEGIN MODAL -->
			                           <div class="modal fade none-border" id="select-event">
			                              <div class="modal-dialog">
			                                  <div class="modal-content">
			                                      <div class="modal-header">
			                                          <h4 class="modal-title"><strong>이벤트 추가</strong></h4>
			                                      </div>
			                                      <div class="modal-body">
			                                          <form>
			                                              <div class="row">
			                                                  <div class="col-md-6">
			                                                      <label class="control-label">이벤트 명</label>
			                                                      <input class="form-control form-white" type="text" name="title">
			                                                  </div>
			                                                  <div class="col-md-6">
			                                                      <label class="control-label">카테고리</label>
			                                                      <select class="form-control form-white" name="category" id="category" onclick="fn_selectCategoryAjax()">
			                                                      	  <c:forEach items="${list }" var="category">
			                                                      	  	 <option value="bg-${category.CATEGORY_COLOR }">${category.CATEGORY_NAME }</option>
			                                                      	  </c:forEach>
			                                                      </select>
			                                                  </div>
			                                              </div>
			                                          </form>
			                                      </div>
			                                      <div class="modal-footer">
			                                          <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">닫기</button>
			                                          <button type="button" class="btn btn-success save-event waves-effect waves-light"><i class='fa fa-check'></i>저장</button>
			                                      </div>
			                                  </div>
			                              </div>
			                           </div>

			                          <!-- EDIT MODAL -->
			                          <div class="modal fade none-border" id="edit-event">
			                              <div class="modal-dialog">
			                                  <div class="modal-content">
			                                      <div class="modal-header">
			                                          <h4 class="modal-title"><strong>이벤트 수정</strong></h4>
			                                      </div>
			                                      <div class="modal-body">
			                                       		<form>
															<div class="input-group">
																<input type="text" class="form-control form-white" />
															</div>
														</form>
			                                      </div>
			                                      <div class="modal-footer">
			                                          <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">닫기</button>
			                                          <button type="button" class="btn btn-success save-event waves-effect waves-light"><i class='fa fa-check'></i>저장</button>
			                                          <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">삭제</button>
			                                      </div>
			                                  </div>
			                              </div>
			                          </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

<script src="<c:url value='/js/plugins-init/nouislider-init.js'/>"></script>
<!-- Toastr -->
<script src="<c:url value='/plugins/toastr/js/toastr.min.js'/>"></script>
<script src="<c:url value='/plugins/toastr/js/toastr.init.js'/>"></script>
<script>
var calendar;
document.addEventListener('DOMContentLoaded', function() {
	 var Calendar = FullCalendar.Calendar;
	 var Draggable = FullCalendar.Draggable;
	 var calendarEl = document.getElementById('calendar');

	 calendar = new FullCalendar.Calendar(calendarEl, {
		    initialView: 'dayGridMonth',
		    height: 650,
		    headerToolbar: {
		      left: 'prev,next today',
		      center: 'title',
		      right: 'dayGridMonth,timeGridWeek,timeGridDay'
		    },
		    editable: false,
		    droppable: false,
		    selectable: true,
	     	eventClick: function(info){
	     		var eventObj = info.event;
	     		$('#edit-event').find("input[type=text]").val(eventObj.title);
	     		$('#edit-event').modal({
	     			 backdrop: "static"
	     		});

				//삭제버튼 클릭시
	     		$('#edit-event').find(".delete-event").unbind("click").on("click", function() {
	    			var param = new Object();
	    			param.idx = eventObj.groupId;

	     			$.ajax({
	       				url      : "<c:url value='/calender/deleteCalenderEvent.do' />",
	       				data     : param,
	       				type     : "POST",
	       				datatype : "json",
	       				success  : function(data) {
	       					eventObj.remove();
	       				}
	       			});
	     		})

	     		//저장버튼 클릭시
	     		$('#edit-event').find(".save-event").unbind("click").on("click", function() {
	    			var param = new Object();
	    			param.title = $('#edit-event').find("input[type=text]").val();
	    			param.idx = eventObj.groupId;

	    			$.ajax({
	       				url      : "<c:url value='/calender/updateCalenderEvent.do' />",
	       				data     : param,
	       				type     : "POST",
	       				datatype : "json",
	       				success  : function(data) {
			     			eventObj.setProp("title", $('#edit-event').find("input[type=text]").val())
			     			$('#edit-event').modal("hide");
	       				}
	       			});

	     		})
	     	},
	     	select: function(info) {
	     	   //alert('selected ' + info.startStr + ' to ' + info.endStr);
		   		$('#select-event').modal({
					 backdrop: "static"
				})

				//저장버튼 클릭시
	     		$('#select-event').find(".save-event").unbind("click").on("click", function() {
	     			 var evtTitle= $('#select-event').find("input[name='title']").val();
	     			 var evtCategory = $('#select-event').find("select[name='category'] option:checked").val();
					 if(evtTitle != null && evtTitle != '' ){

						 var param = new Object();
						 param.title = evtTitle;
						 param.start = info.startStr;
						 param.className = evtCategory;

	        			$.ajax({
	           				url      : "<c:url value='/calender/insertCalenderEvent.do' />",
	           				data     : param,
	           				type     : "POST",
	           				datatype : "json",
	           				success  : function(data) {

		       	                 calendar.addEvent({
		    	                     title: evtTitle,
		    	                     start: info.startStr,
		    	                     className: evtCategory,
		    	                     groupId:data.idx
		    	                 });

				                 $('#select-event').modal("hide");
				                 $('#select-event').find("input[name='title']").val("");
	           				}
	           			});

					 }else{
						 alert("이벤트 명을 입력하세요")
					 }
	     		})
	     	},
		    events: [
				<c:forEach items="${eventList}" var="item">
				{
					title: "${item.TITLE}",
					start: "${item.START_DATE}",
					className: "${item.CLASS_NAME}",
					groupId: "${item.CALENDER_IDX}"
				},
				</c:forEach>
			]
		  });

	 calendar.render();

})
$(document).ready(function() {
	$("#msg").keypress(function(e){
		//검색어 입력 후 엔터키 입력하면 조회버튼 클릭
		if(e.keyCode && e.keyCode == 13){
			e.preventDefault();
			fn_send();

			return false;
		}
	});

	 //todo list
    $(".tdl-new").on('keypress', function(e) {

        var code = (e.keyCode ? e.keyCode : e.which);
        if (code == 13) {

            var v = $(this).val();
            var s = v.replace(/ +?/g, '');
            var node =$(this);

            if (s == "") {
                return false;
            } else {

                param = new Object();
                param.cn = v;
                param.se = "TODO_INSERT"

    			$.ajax({
    				url      : "<c:url value='/chatting/insertTodoList.do' />",
    				data     : param,
    				type     : "POST",
    				datatype : "json",
    				success  : function(data) {
    					param.idx = data.idx;
    					//소켓으로 전송
    			    	websocket.send(JSON.stringify(param));

    	                $(".tdl-content ul").append("<li><label><input type='checkbox' name='complete' value='"+data.idx+"'><i></i><span>" + v + "</span><a href='#' class='ti-trash'></a></label></li>");
    	                node.val("");
    				}
    			});

            }

        }

    });

    $(".tdl-content li").on("click", function() {
    	param = new Object();
    	param.idx = $(this).find("input").val();
    	var node =$(this);
    	if($(this).hasClass("complete") === true){
    		param.complete = 'N'
            param.se = "TODO_UPDATE_N"

   			$.ajax({
   				url      : "<c:url value='/chatting/updateComplete.do' />",
   				data     : param,
   				type     : "POST",
   				datatype : "json",
   				success  : function(data) {
   					websocket.send(JSON.stringify(param));

   					node.find("i").removeClass("checked");
   					node.find("span").removeClass("lineThrough");
   					node.removeClass("complete");
   				}
   			});

    	}else{
    		param.complete = 'Y'
            param.se = "TODO_UPDATE_Y"

   			$.ajax({
   				url      : "<c:url value='/chatting/updateComplete.do' />",
   				data     : param,
   				type     : "POST",
   				datatype : "json",
   				success  : function(data) {
   					websocket.send(JSON.stringify(param));

   					node.addClass("complete");
   					node.find("i").addClass("checked");
   					node.find("span").addClass("lineThrough");
   				}
   			});
    	}


    	return false;
    })


    //to do list 삭제
    $(".tdl-content a").on("click", function() {
    	param = new Object();
    	param.idx = $(this).parent().find("input").val();
        param.se = "TODO_DELETE"

    	var node =$(this);
		$.ajax({
			url      : "<c:url value='/chatting/deleteTodoList.do' />",
			data     : param,
			type     : "POST",
			datatype : "json",
			success  : function(data) {
				websocket.send(JSON.stringify(param));

		        var _li = node.parent().parent("li");
		        _li.addClass("remove").stop().delay(100).slideUp("fast", function() {
		        	_li.remove();
		        });
			}
		});

    	return false;


    });

    //to do list 삭제
    $(".tdl-content").on('click', "a", function() {
    	param = new Object();
    	param.idx = $(this).parent().find("input").val();
        param.se = "TODO_DELETE"

    	var node =$(this);
		$.ajax({
			url      : "<c:url value='/chatting/deleteTodoList.do' />",
			data     : param,
			type     : "POST",
			datatype : "json",
			success  : function(data) {
				websocket.send(JSON.stringify(param));

		        var _li = node.parent().parent("li");
		        _li.addClass("remove").stop().delay(100).slideUp("fast", function() {
		        	_li.remove();
		        });
			}
		});

    	return false;

    });


});

var websocket = new WebSocket("ws://localhost:8083/startChatting/chat.do");
// var websocket = new WebSocket("ws://129.154.63.250:8080/HAEUN-STUDY/startChatting/chat.do");
websocket.onmessage = onMessage;

function fn_send(){
	param = new Object();
	param.se = "MSG"
	param.cn = $("#msg").val();

	websocket.send(JSON.stringify(param));
	$('#msg').val('')
}

function onMessage(msg) {

	var data = msg.data;
	var sessionId = null; //데이터를 보낸 사람
	var message = null;
	var section = null;
	var idx = null;

	var arr = data.split(":");

	let today = new Date();

	idx = arr[3];
	message = arr[2];
	sessionId = arr[1];
	section = arr[0];

	var str = '<div class="media media-reply">'

	if(section === 'MSG' ){

		if(sessionId === '${userName}'){

		    str += '<div class="media-body" style="text-align: right;    background: #7571f92b;color: black;">'
		    str += '<div class="d-sm-flex justify-content-between mb-2" style="flex-direction: row-reverse;">'
		    str += '<h5 class="mb-sm-0">'+sessionId+ '<small class="text-muted ml-3">' + today.toLocaleTimeString()+ '</small></h5>'
		    str +=   '</div>'
		    str +=   '<p>'+ message + '</p>'
		    str +=  '</div>'
		    str += '<img class="ml-3 circle-rounded" src="images/avatar/2.jpg" width="50" height="50" alt="Generic placeholder image">'

		}else{

		    str += '<img class="mr-3 circle-rounded" src="images/avatar/2.jpg" width="50" height="50" alt="Generic placeholder image">'
		    str += '<div class="media-body">'
		    str += '<div class="d-sm-flex justify-content-between mb-2">'
		    str += '<h5 class="mb-sm-0">'+sessionId+ '<small class="text-muted ml-3">' + today.toLocaleTimeString()+ '</small></h5>'
		    str +=   '</div>'
		    str +=   '<p>'+ message + '</p>'
		    str +=  '</div>'

		}

	}else if(section === 'IN' ){

		str +=  sessionId + "님이 입장하셨습니다."

		var str2 = '<li><input type="checkbox" name="chattingUserIdx" style="display: none;" value="'+idx+'"><i class="fa fa-user" style="float: left;margin-top: 3px;color: blueviolet;"></i><span style="margin-left:10px;">'+sessionId+'</span></li>'
		$('#user_list').append(str2);

	}else if(section === 'OUT' ){

		str += sessionId + " 님이 퇴장하셨습니다."

		$("input:checkbox[name='chattingUserIdx']").each(function(){
			if($(this).val() == idx){
				node = $(this).parent("li");
				node.remove();
			}
		});


	}else if(section === 'MEMO'){
// 		if(sessionId != '${userName}'){
// 		}
// 		fn_updateMemo(message);

		var iframe = document.getElementById("editorIframe");
		var iframeDom = iframe.contentWindow||iframe.contentDocuemnt;

		iframeDom.fn_updateMemo(message);

		return;

	}else if(section === 'TODO_INSERT'){
		if(sessionId != '${userName}'){
            $(".tdl-content ul").append("<li><label><input type='checkbox' name='complete' value='"+idx+"'><i></i><span>" + message + "</span><a href='#' class='ti-trash'></a></label></li>");
		}

		return;
	}else if(section === 'TODO_UPDATE_N'){
		if(sessionId != '${userName}'){
			var node;
			$("input:checkbox[name='complete']").each(function(){
				if($(this).val() == idx){
					node = $(this).parent().parent("li");
				}
			});

			node.find("i").removeClass("checked");
			node.find("span").removeClass("lineThrough");
			node.removeClass("complete");
		}

		return;
	}else if(section === 'TODO_UPDATE_Y'){
		if(sessionId != '${userName}'){
			var node;
			$("input:checkbox[name='complete']").each(function(){
				if($(this).val() == idx){
					node = $(this).parent().parent("li");
				}
			});

			node.addClass("complete");
			node.find("i").addClass("checked");
			node.find("span").addClass("lineThrough");
		}

		return;
	}else if(section === 'TODO_DELETE'){

		if(sessionId != '${userName}'){
			var node;
			$("input:checkbox[name='complete']").each(function(){
				if($(this).val() == idx){
					node = $(this).parent().parent("li");
				}
			});

			node.addClass("remove").stop().delay(100).slideUp("fast", function() {
				node.remove();
	        });
		}

		return;
	}else if(section === 'ROCK'){
		if(sessionId != '${userName}'){


		}

	}

    str += '</div>';

	$("#msgArea").append(str);

	var div = document.getElementById("msgAreaDiv");
	div.scrollTop = div.scrollHeight;


}

function fn_reset(){
	var iframe = document.getElementById("editorIframe");
	var iframeDom = iframe.contentWindow||iframe.contentDocuemnt;

	iframeDom.fn_reset();

}

function fn_lockMemo(){
	param = new Object();
	param.se = "ROCK"

	websocket.send(JSON.stringify(param));
}

function fn_save(){

	var iframe = document.getElementById("editorIframe");
	var iframeDom = iframe.contentWindow||iframe.contentDocuemnt;

	var editorData = iframeDom.editorData();

 	if(editorData != null && editorData != ''){
    	param = new Object();
    	param.cn = editorData;
    	param.se = "MEMO"

    	websocket.send(JSON.stringify(param));

		$.ajax({
			url      : "<c:url value='/chatting/insertMemo.do' />",
			data     : param,
			type     : "POST",
			datatype : "json",
			success  : function(data) {

	    		toastr.success("메모가 저장되었습니다","알림",
						{timeOut:5e3,
						closeButton:!0,
						debug:!1,
						newestOnTop:!0,
						progressBar:!0,
						positionClass:"toast-top-right",
						preventDuplicates:!0,
						onclick:null,
						showDuration:"300",
						hideDuration:"1000",
						extendedTimeOut:"1000",
						showEasing:"swing",
						hideEasing:"linear",
						showMethod:"fadeIn",
						hideMethod:"fadeOut",
						tapToDismiss:!1
				})
			}
		});

 	}else{
 		alert('메모 내용을 입력해 주세요');
 	}
}

function fn_selectCategoryAjax(){

}

</script>

