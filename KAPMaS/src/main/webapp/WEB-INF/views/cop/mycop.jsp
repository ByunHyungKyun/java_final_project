<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<body>
	<div class="app-content">
		<div class="row">
			<h1 class="page-header">&nbsp;My Cop</h1>
			<div class="col-6">
				<div class="panel panel-inverse" data-sortable-id="table-basic-1" style="height: 300px;">
					<div class="panel-heading">
						<h4 class="panel-title">참여중 CoP</h4>
						<div class="panel-heading-btn">
							<a href="javascript:location.href='<%=request.getContextPath()%>/cop/joinCopDetail';" class="btn btn-xs btn-icon btn-default"><i class="fas fa-lg fa-fw fa-plus"></i></a>
						</div>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-hover mb-0 text-inverse">
								<thead>
									<tr>
										<th>#</th>
										<th>Cop명</th>
										<th>참여자 수</th>
										<th>소유자</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="jcp" value="${joinCopCnt}" />
									<c:set var="jcv" value="${joinCopVO}" />
									<c:forEach var="jcv" items="${joinCopVO}" begin="0" end="${fn:length(joinCopVO)}" varStatus="status">
										<tr onclick="OpenWindow('detail/${jcv.copCode}','${jcv.copName}','1130','700');" style="cursor: pointer;">
											<td>${jcv.copCode }</td>
											<td>${jcv.copName }</td>
											<td>${jcp[status.index].copPersonnel}</td>
											<td>${jcv.copOwner }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
						</div>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="panel panel-inverse" data-sortable-id="table-basic-1" style="height: 300px;">
					<div class="panel-heading">
						<h4 class="panel-title">소유중 CoP</h4>
						<div class="panel-heading-btn">
							<a href="javascript:location.href='<%=request.getContextPath()%>/cop/ownCopDetail';" class="btn btn-xs btn-icon btn-default"><i class="fas fa-lg fa-fw fa-plus"></i></a>
						</div>
					</div>
					<div class="panel-body">

						<div class="table-responsive">
							<table class="table table-hover mb-0 text-inverse">
								<thead>
									<tr>
										<th>#</th>
										<th>CoP명</th>
										<th>참여자 수</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="ocv" value="${ownCopVO}" />
									<c:set var="occ" value="${ownCopCnt}" />
									<c:forEach var="ocv" items="${ownCopVO}" begin="0"
										end="${fn:length(ownCopVO)}" varStatus="status">
										<tr
											onclick="OpenWindow('detail/${ocv.copCode}','','1130','700');"
											style="cursor: pointer;">
											<td>${ocv.copCode }</td>
											<td>${ocv.copName }</td>
											<td>${occ[status.index].copPersonnel}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
						</div>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="panel panel-inverse" data-sortable-id="table-basic-1" style="height: 300px;">
					<div class="panel-heading">
						<h4 class="panel-title">소유중인 토론방</h4>
						<div class="panel-heading-btn">
							<a href="javascript:location.href='<%=request.getContextPath()%>/cop/joinDiscussionDetail';" class="btn btn-xs btn-icon btn-default"><i class="fas fa-lg fa-fw fa-plus"></i></a>
						</div>
					</div>
					<div class="panel-body">

						<div class="table-responsive">
							<table class="table table-hover mb-0 text-inverse">
								<thead>
									<tr>
										<th>#</th>
										<th>토론방명</th>
										<th>CoP명</th>
									</tr>
								</thead>
									<tbody>
									<c:forEach var="mdl" items="${myDiscussionList}" begin="0" end="4">
										<tr onclick="barogo('${mdl.copCode}', '${mdl.fdisCode }');" style="cursor: pointer;">
											<td>${mdl.fdisCode }</td>
											<td>${mdl.fdisName }</td>
											<td>${mdl.copName }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
						</div>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="panel panel-inverse" data-sortable-id="table-basic-1" style="height: 300px;">
					<div class="panel-heading">
						<h4 class="panel-title">작성한 자료실글</h4>
						<div class="panel-heading-btn">
							<a href="javascript:location.href='<%=request.getContextPath()%>/cop/myCopArchiveDetail';" class="btn btn-xs btn-icon btn-default"><i class="fas fa-lg fa-fw fa-plus"></i></a>
						</div>
					</div>
					<div class="panel-body">

						<div class="table-responsive">
							<table class="table table-hover mb-0 text-inverse">
								<thead>
									<tr>
										<th>#</th>
										<th>제목</th>
										<th>CoP명</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="mal" items="${myArchiveList}" begin="0" end="4">
										<tr onclick="barogo('${mal.copCode}', '${mal.caCode }');" style="cursor: pointer;">
											<td>${mal.caCode }</td>
											<td>${mal.caTitle }</td>
											<td>${mal.copName }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function barogo(val1, val2){
			var newWindow = window.open("<%=request.getContextPath()%>/cop/detail/" + val1 + "", "newWindow", "width=1130, height=700");
			newWindow.onload = function(){
				if(val2.includes("CFD")){
					newWindow.frames[0].location.href = "<%=request.getContextPath()%>/cop/detail/discussion/fdisDetail/" + val2 + "";
				} else {
					newWindow.frames[0].location.href = "<%=request.getContextPath()%>/cop/detail/coppds/pdsDetail/" + val2 + "";
				}
			}
		}
	</script>
</body>