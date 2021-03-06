<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/style.jsp" %>		
<head>
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/FullCalendar/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/FullCalendar/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='<%=request.getContextPath() %>/resources/FullCalendar/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='<%=request.getContextPath() %>/resources/FullCalendar/vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/FullCalendar/css/main.css">
    
<link href="<%=request.getContextPath() %>/resources/css/css.css" rel="stylesheet" id="innerCss">
<style>
	body{
		background-color: white;
	}
	
	h1 {
		text-align: center;
	}
  	h3 {
		text-align: center;
	}
	
	h5 {
		text-align: center;
		
	}
	
	.step2{
	 	margin: 0 auto;
	}
 .nav.nav-wizards-1 .nav-item .nav-link.active:after,
  .nav.nav-wizards-1 .nav-item .nav-link.active:before, .nav.nav-wizards-1 .nav-item .nav-link.completed:after,
   .nav.nav-wizards-1 .nav-item .nav-link.completed:before{
  	border-color: #ffd900;
  	background: #ffd900;
  }
	
</style>

</head>


<body>
<br>
<br>
<h1 onclick="fillArea();"><img src="<%=request.getContextPath() %>/resources/images/logo-remove.png" 
		alt="" style="width: 100px;">프로젝트 등록 화면</h1>

<div class="nav-wizards-container">
	<nav class="nav nav-wizards-1 mb-2">
		<div class="nav-item col">
			<a class="nav-link active" href="#" id="one">
				<div class="nav-no">1</div>
				<div class="nav-text">step1.프로젝트 정보 입력</div>
			</a>
		</div>
		<div class="nav-item col">
			<a class="nav-link disabled" href="#" id="two">
				<div class="nav-no">2</div>
				<div class="nav-text">step2.프로젝트 기간 입력</div>
			</a>
		</div>
		<div class="nav-item col">
			<a class="nav-link disabled" href="#" id="three">
				<div class="nav-no">3</div>
				<div class="nav-text">step3.프로젝트 등록 확인</div>
			</a>
		</div>
	</nav>
</div>

		<form id="sub" style="padding-left: 100px; padding-top: 25px; padding-right: 100px;" action="regist.do" method="post">
			
			<div id="step1">
			<div class="row mb-15px">
			<span  style="width: 100px; height: 30px;">
			<h6 style="line-height: 5px;">프로젝트 이름</h6>
			</span>
				<div class="col-md-9">
					<input type="text" name="pName" id="pName" class="form-control mb-5px" placeholder="이름을 입력해주세요">
				</div>
			</div>
			
			<div class="row mb-15px">
				<span style="width: 100px; height: 30px;">
				<h6 style="line-height: 5px;">프로젝트 주제</h6>
				</span>
				<div class="col-md-9">
					<input type="text" name="pTitle" id="pTitle" class="form-control mb-5px" placeholder="주제을 입력해주세요">
				</div>
			</div>
			
			<div class="row mb-15px">
				<span style="width: 100px; height: 30px;">
				<h6 style="line-height: 5px;">프로젝트 개요</h6>
				</span>
				<div class="col-md-9">
					<input type="text" name="pSummary" id="pSummary"  class="form-control mb-5px" placeholder="개요을 입력해주세요">
				</div>
			</div>
			
			<div class="row mb-15px">
				<span  style="width: 100px; height: 30px;">
				<h6 style="line-height: 5px;">프로젝트 내용</h6>
				</span>
				<div class="col-md-9">
					<textarea class="form-control" rows="5" name="pContent" id="pContent" ></textarea>
				</div>
			</div>
			</div>
			
			<br>
		
			<div id='step2'>
			 <div class="container" style="padding-right: 150px;">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">누르시요</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div> 

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="카테고리1">카테고리1</option>
                                    <option value="카테고리2">카테고리2</option>
                                    <option value="카테고리3">카테고리3</option>
                                    <option value="카테고리4">카테고리4</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default" hidden="">

            <div class="panel-heading" >
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body" >

                <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="카테고리1">카테고리1</option>
                            <option value="카테고리2">카테고리2</option>
                            <option value="카테고리3">카테고리3</option>
                            <option value="카테고리4">카테고리4</option>
                        </select>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="calendar_view">등록자별</label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="정연"
                                checked>정연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="다현"
                                checked>다현</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
                                checked>사나</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="나연"
                                checked>나연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="지효"
                                checked>지효</label>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
    </div>
     <!-- /.container -->
</div>
			
			<input type="text" hidden="" value="" id="startDate" name="pStartdate">
			<input type="text" hidden="" value="" id="endDate" name="pEnddate">
			<input type="text" hidden="" value="" id="dateId" > 
			
			<div id="step3" hidden="">
			
				<h1>마지막으로 이런 준비가 필요해요</h1>
				<h3>프로젝트 등록을 진행하실려면 아래 항목을 클릭하시요</h3>
				<h5 style="color: red;">전부 클릭해야 완료 버튼이 생성됩니다.</h3>
				<hr>
				<br>
				<input type="checkbox" name="hobby" id="t1">
				<label for="t1"> 프로젝트를 등록하면 해당 프로젝트의 PL로 자동 등록됩니다</label>
				<br>
				<br>
				<input type="checkbox" name="hobby" id="t2">
				<label for="t2"> 프로젝트 인원등록은 프로젝트 메뉴에서 진행됩니다</label>
				<br>
				<br>
				<input type="checkbox" name="hobby" id="t3">
				<label for="t3"> 프로젝트 업무 등록은 프로젝트 메뉴에서 진행됩니다</label>
				<br>
				<br>
				<input type="checkbox" name="hobby" id="t4">
				<label for="t4"> 프로젝트 주간 보고를 이용하려면 초기설정이 필요합니다</label>
				<br>
				<br>
			
			</div>
			
			<br><br><br><br>
			
			
			<button type="button" class="btn btn-gray me-1 mb-1" id="bone1" 
			style="float: left;"  onclick="CloseWindow();">&nbsp;&nbsp;&nbsp;취 &nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;</button>
			
			<button type="button" class="btn btn-yellow me-1 mb-1" id="bone"
			style="float: right;" onclick="oneStep();">&nbsp;&nbsp;&nbsp;다 &nbsp;&nbsp;음&nbsp;&nbsp;&nbsp;</button>	
			
			<button type="button" class="btn btn-yellow me-1 mb-1" id="btwo"
			style="float: right;" onclick="twoStep();">&nbsp;&nbsp;&nbsp;다 &nbsp;&nbsp;음&nbsp;&nbsp;&nbsp;</button>
			
			<button type="submit"  class="btn btn-yellow me-1 mb-1" id="bthree"
			style="float: right;">&nbsp;&nbsp;&nbsp;완 &nbsp;&nbsp;료&nbsp;&nbsp;&nbsp;</button>
			
		</form>

<script src="<%=request.getContextPath() %>/resources/FullCalendar/vendor/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/FullCalendar/vendor/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/FullCalendar/vendor/js/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/FullCalendar/vendor/js/ko.js"></script>
<script src="<%=request.getContextPath() %>/resources/FullCalendar/vendor/js/select2.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/FullCalendar/js/main.js"></script>
<script src="<%=request.getContextPath() %>/resources/FullCalendar/js/addEvent.js"></script>
<script src="<%=request.getContextPath() %>/resources/FullCalendar/js/editEvent.js"></script>
	<script src="<%=request.getContextPath() %>/resources/FullCalendar/vendor/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/FullCalendar/js/etcSetting.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>

<script>
document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);

	window.onload = function() {
		var el = document.getElementById('step2');
		el.setAttribute('hidden', '');

		var el2 = document.getElementById('btwo');
		el2.setAttribute('hidden', '');

		var el4 = document.getElementById('bthree');
		el4.setAttribute('hidden', '');

	}

	function fillArea(){
		$("#pName").val("ddit 최종 발표 프로젝트");
		$("#pTitle").val("발표 전 중간 점검");
		$("#pSummary").val("중간 점검");
		$("#pContent").val("프로젝트 최종 발표전 점검을 위하여 프로젝트를 진행합니다.");
	}
	
	function oneStep() {
		
		var memId = $("#pName").val();
		if(memId == "") {
			/* alert("프로젝트 이름을 입력하셔야 합니다");
			return; */
			swal({
				title: '실패',
				text: '프로젝트 이름을 입력하셔야 합니다',
				icon: 'error', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-danger',
			                closeModal: true
			              }
			        }
			});
				return;
			
		}
		

		var memName = $("#pTitle").val();
		if(memName == "") {
			/* alert("프로젝트 주제를 입력하셔야 합니다");
			return; */
			
			swal({
				title: '실패',
				text: '프로젝트 주제를 입력하셔야 합니다',
				icon: 'error', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-danger',
			                closeModal: true
			              }
			        }
			});
			return;
		}
		
		var pSum=$("#pSummary").val()
		if(pSum == "") {
			/* alert("프로젝트 개요를 입력하셔야 합니다");
			return; */
			
			swal({
				title: '실패',
				text: '프로젝트 개요를 입력하셔야 합니다',
				icon: 'error', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-danger',
			                closeModal: true
			              }
			        }
			});
			return;
		}
		
		var pCon=$("#pContent").val()
		if(pCon == "") {
			/* alert("프로젝트 내용을 입력하셔야  합니다.");
			return; */
			
			swal({
				title: '실패',
				text: '프로젝트 내용을 입력하셔야  합니다.',
				icon: 'error', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-danger',
			                closeModal: true
			              }
			        }
			});
			return;
		}

		var el = document.getElementById('step1');
		el.setAttribute('hidden', '');

		var el2 = document.getElementById('step2');
		el2.removeAttribute('hidden');

		var el3 = document.getElementById('one');
		el3.setAttribute('class', 'nav-link completed');

		var el4 = document.getElementById('two');
		el4.setAttribute('class', 'nav-link active');

		var el5 = document.getElementById('bone');
		el5.setAttribute('hidden', '');

		var el6 = document.getElementById('btwo');
		el6.removeAttribute('hidden');

	}

	function twoStep() {
		
		var e34=$("#startDate").val();
		
		if (e34 == ""){
		/* 	alert("날짜를 입력하셔야 합니다.");
			return; */
			swal({
				title: '실패',
				text: '날짜를 입력하셔야 합니다.',
				icon: 'error', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-danger',
			                closeModal: true
			              }
			        }
			});
			return;
			
		}
		
		
		var el = document.getElementById('step2');
		el.setAttribute('hidden', '');

		var el2 = document.getElementById('step3');
		el2.removeAttribute('hidden');

		var el3 = document.getElementById('two');
		el3.setAttribute('class', 'nav-link completed');

		var el4 = document.getElementById('three');
		el4.setAttribute('class', 'nav-link active');

		var el5 = document.getElementById('btwo');
		el5.setAttribute('hidden', '');

	

	}

	
	$("[name=hobby]").click(function(){
		var num = $("[name=hobby]:checked").not("#allChk").length;
		
		if(num == 4){
			var el6 = document.getElementById('bthree');
			el6.removeAttribute('hidden');
		}else {
			var el4 = document.getElementById('bthree');
			el4.setAttribute('hidden', '');
		}
	});
	
	
	function threeStep() {
		/* alert("등록완료");
		CloseWindow(); */
		
		swal({
			title: '성공',
			text: '등록완료',
			icon: 'success', // primary success warning danger
			buttons: {
		        	confirm: {
				text: '확인',
		                value: true,
		                visible: true,
		                className: 'btn btn-success',
		                closeModal: true
		              }
		        }
		}).then(function(e){
			CloseWindow();
		});
	}
	


	
	
	
</script>






</body>





















