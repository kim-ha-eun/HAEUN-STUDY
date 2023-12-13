<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>
<script src="<c:url value='/plugins/nouislider/nouislider.min.js'/>"></script>
<script src="<c:url value='/plugins/wnumb/wNumb.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/plugins/nouislider/nouislider.min.css'/>">

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



                       	 	</div>
                        </div>

                        <div class="card">
                            <div class="card-body">
                                <form action="#" class="form-profile">
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
                                            <h5 class="mb-0" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1"><i class="fa" aria-hidden="true"></i> To do List</h5>
                                        </div>
                                        <div id="collapseOne1" class="collapse show" data-parent="#accordion-two">
                                            <div class="card-body">
			                                    <div class="todo-list">
			                                        <div class="tdl-holder">
			                                            <div class="tdl-content">
			                                                <ul id="todo_list">
			                                                    <li><label><input type="checkbox"><i></i><span>Get up</span><a href='#' class="ti-trash"></a></label></li>
			                                                    <li><label><input type="checkbox" checked><i></i><span>Stand up</span><a href='#' class="ti-trash"></a></label></li>
			                                                    <li><label><input type="checkbox"><i></i><span>Don't give up the fight.</span><a href='#' class="ti-trash"></a></label></li>
			                                                    <li><label><input type="checkbox" checked><i></i><span>Do something else</span><a href='#' class="ti-trash"></a></label></li>
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
                                            <div class="card-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.</div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header">
                                            <h5 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseThree3" aria-expanded="false" aria-controls="collapseThree3"><i class="fa" aria-hidden="true"></i> 달력</h5>
                                        </div>
                                        <div id="collapseThree3" class="collapse" data-parent="#accordion-two">
                                            <div class="card-body">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

<script src="<c:url value='/js/plugins-init/nouislider-init.js'/>"></script>
<script src="<c:url value='/js/dashboard/dashboard-1.js'/>"></script>
<script>

$(document).ready(function() {
	$("#msg").keypress(function(e){
		//검색어 입력 후 엔터키 입력하면 조회버튼 클릭
		if(e.keyCode && e.keyCode == 13){
			e.preventDefault();
			fn_send();

			return false;
		}
	});
});

// function send_message() {
// 	var websocket = new WebSocket("ws://localhost:8083/startChatting/chat.do");
// 	websocket.onopen = function(evt) {
//         onOpen(evt)
//     };
//     websocket.onmessage = function(evt) {
//         onMessage(evt)
//     };
//     websocket.onerror = function(evt) {
//         onError(evt)
//     };
// }

// //WebSocket 연결
// function onOpen(evt) {
//     writeToScreen("WebSocket 연결!");
//     doSend($("#message").val());
// }

// function writeToScreen(message) {
//     $("#msgArea").append(message);
// }

// //메시지 수신
// function onMessage(evt) {
//     writeToScreen("메시지 수신 : " + evt.data);
// }


// //에러 발생
// function onError(evt) {
//     writeToScreen("에러 : " + evt.data);
// }

// function doSend(message) {
//     writeToScreen("메시지 송신 : " + message);
//     websocket.send(message);
// }

var websocket = new WebSocket("ws://localhost:8083/startChatting/chat.do");
// var websocket = new WebSocket("ws://129.154.63.250:8080/HAEUN-STUDY/startChatting/chat.do");
websocket.onmessage = onMessage;
// websocket.onclose = onClose;
// websocket.onopen = onOpen;


function fn_send(){
	websocket.send($("#msg").val());
	$('#msg').val('')
}

function onMessage(msg) {

	var data = msg.data;
	var sessionId = null; //데이터를 보낸 사람
	var message = null;

	var arr = data.split(":");

	let today = new Date();

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

	}else{

		str += sessionId + " 님이 퇴장하셨습니다."
	}

    str += '</div>';

	$("#msgArea").append(str);

	var div = document.getElementById("msgAreaDiv");
	div.scrollTop = div.scrollHeight;


}

// function onClose(evt) {
// 	sessionId = '${userName}';

// 	var str = '<div class="media media-reply">'
// 	str += sessionId + " 님이 퇴장하셨습니다."
// 	str += '</div>';

// 	$("#msgArea").append(str);
// }

// //채팅창에 들어왔을 때
// function onOpen(evt) {
// 	sessionId = '${userName}';

// 	var str = '<div class="media media-reply">'
// 	str +=  sessionId + "님이 입장하셨습니다."
// 	str += '</div>';

// 	$("#msgArea").append(str);
// }

</script>

