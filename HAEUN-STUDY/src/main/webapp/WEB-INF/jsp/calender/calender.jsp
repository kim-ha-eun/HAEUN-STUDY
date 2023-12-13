<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>
 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>
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
          <div class="col-lg-12">
              <div class="card">
                  <div class="card-body">
                      <div class="card-title">
                          <h4>Calendar</h4>
                      </div>
                      <div class="row">
                          <div class="col-lg-4 mt-5">
                              <a href="#" data-toggle="modal" data-target="#add-category" class="btn btn-primary btn-block"><i class="ti-plus f-s-12 m-r-5"></i> 카테고리 추가</a>
                              <div id="external-events" class="m-t-20">
                                  <p>카테고리를 드래그하거나 달력을 클릭하세요</p>
								   <c:forEach items="${list }" var="category">
								   		<div class="external-event bg-${category.CATEGORY_COLOR } text-white" data-class="${category.CATEGORY_COLOR }" data-index="${category.CATEGORY_INDEX }"><i class="fa fa-move"></i>${category.CATEGORY_NAME }</div>
								   </c:forEach>
                              </div>
                              <!-- checkbox -->
                              <div class="checkbox m-t-40">
                                  <input id="drop-remove" type="checkbox">
                                  <label for="drop-remove">드래그 후 삭제</label>
                              </div>
                          </div>
                          <div class="col-md-8">
                              <div class="card-box m-b-50">
                                  <div id="calendar"></div>
                              </div>
                          </div>

                          <!-- end col -->
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
                                                      <select class="form-control form-white" name="category">
                                                          <option value="bg-success">Success</option>
                                                          <option value="bg-danger">Danger</option>
                                                          <option value="bg-info">Info</option>
                                                          <option value="bg-pink">Pink</option>
                                                          <option value="bg-primary">Primary</option>
                                                          <option value="bg-warning">Warning</option>
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
                          <!-- Modal Add Category -->
                          <div class="modal fade none-border" id="add-category">
                              <div class="modal-dialog">
                                  <div class="modal-content">
                                      <div class="modal-header">
                                          <h4 class="modal-title"><strong>카테고리 추가</strong></h4>
                                      </div>
                                      <div class="modal-body">
                                          <form>
                                              <div class="row">
                                                  <div class="col-md-6">
                                                      <label class="control-label">카테고리 명</label>
                                                      <input class="form-control form-white" type="text" name="category-name">
                                                  </div>
                                                  <div class="col-md-6">
                                                      <label class="control-label">카테고리 색상</label>
                                                      <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                                          <option value="success">Success</option>
                                                          <option value="danger">Danger</option>
                                                          <option value="info">Info</option>
                                                          <option value="pink">Pink</option>
                                                          <option value="primary">Primary</option>
                                                          <option value="warning">Warning</option>
                                                      </select>
                                                  </div>
                                              </div>
                                          </form>
                                      </div>
                                      <div class="modal-footer">
                                          <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">닫기</button>
                                          <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">저장</button>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <!-- END MODAL -->
                          <!-- 카테고리 수정 모달 -->
                          <div class="modal fade none-border" id="update-category">
                              <div class="modal-dialog">
                                  <div class="modal-content">
                                      <div class="modal-header">
                                          <h4 class="modal-title"><strong>카테고리 수정</strong></h4>
                                      </div>
                                      <div class="modal-body">
                                          <form>
                                              <div class="row">
                                                  <div class="col-md-6">
                                                      <label class="control-label">카테고리 명</label>
                                                      <input class="form-control form-white" type="text" name="category-name">
                                                  </div>
                                                  <div class="col-md-6">
                                                      <label class="control-label">카테고리 색상</label>
                                                      <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                                          <option value="success">Success</option>
                                                          <option value="danger">Danger</option>
                                                          <option value="info">Info</option>
                                                          <option value="pink">Pink</option>
                                                          <option value="primary">Primary</option>
                                                          <option value="warning">Warning</option>
                                                      </select>
                                                  </div>
                                              </div>
                                          </form>
                                      </div>
                                      <div class="modal-footer">
                                          <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">닫기</button>
                                          <button type="button" class="btn btn-success waves-effect waves-light save-category" data-dismiss="modal">저장</button>
                                          <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">삭제</button>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <!-- END MODAL -->
                      </div>
                  </div>
              </div>
              <!-- /# card -->
          </div>
          <!-- /# column -->
      </div>
  </div>

<script>
document.addEventListener('DOMContentLoaded', function() {
	  var Calendar = FullCalendar.Calendar;
	  var Draggable = FullCalendar.Draggable;

	  var calendarEl = document.getElementById('calendar');
	  var containerEl = document.getElementById('external-events');
	  var checkbox = document.getElementById('drop-remove');

	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    initialView: 'dayGridMonth',
	    headerToolbar: {
	      left: 'prev,next today',
	      center: 'title',
	      right: 'dayGridMonth,timeGridWeek,timeGridDay'
	    },
	    editable: true,
	    droppable: true,
	    selectable: true,
	    drop: function(info) {
	        if (checkbox.checked) {
	          info.draggedEl.parentNode.removeChild(info.draggedEl);
	        }
     	 },
     	eventClick: function(info){
     		var eventObj = info.event;
     		$('#edit-event').find("input[type=text]").val(eventObj.title);
     		$('#edit-event').modal({
     			 backdrop: "static"
     		});

			//삭제버튼 클릭시
     		$('#edit-event').find(".delete-event").unbind("click").on("click", function() {
     			eventObj.remove();
     		})

     		//저장버튼 클릭시
     		$('#edit-event').find(".save-event").unbind("click").on("click", function() {
     			eventObj.setProp("title", $('#edit-event').find("input[type=text]").val())
     			$('#edit-event').modal("hide");
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
	                 calendar.addEvent({
	                     title: evtTitle,
	                     start: info.startStr,
	                     allDay: true,
	                     className: evtCategory
	                 });

	                 $('#select-event').modal("hide");
	                 $('#select-event').find("input[name='title']").val("");
				 }else{
					 alert("이벤트 명을 입력하세요")
				 }
     		})
     	}
	  });

	  new Draggable(containerEl, {
	    itemSelector: '.external-event',
	    eventData: function(eventEl) {
	      return {
	        title: eventEl.innerText,
 	        className: "bg-"+eventEl.getAttribute("data-class")
	      };
	    }
	  });

	  //카테고리 추가 저장버튼 클릭시
	  $('#add-category').find(".save-category").on("click", function() {
          var cateName = $('#add-category').find("input[name='category-name']").val(),
          cateColor = $('#add-category').find("select[name='category-color']").val();
          if(cateName != null && cateName != '' ){
      		  param = new Object();
    		  param.cateName = cateName;
    		  param.cateColor = cateColor;
        	  AjaxAP.send("<c:url value='/calender/insertCategory.do' />",param,"json",function(data){

        	  })
	          $('#external-events').append('<div class="text-white external-event bg-' + cateColor + '" data-class="bg-' + cateColor + '" style="position: relative;"><i class="fa fa-move"></i>' + cateName + "</div>")

          }


	  })

	  calendar.render();

	  $('#external-events').find("div").on("click", function() {
		    var color = $(this).attr("data-class");
		    var value = $(this).text();
		    $('#update-category').find("input[name='category-name']").val(value);
		    $('#update-category').find("select[name='category-color']").val(color);
	   		$('#update-category').modal({
				 backdrop: "static"
			})
	  })


});

</script>