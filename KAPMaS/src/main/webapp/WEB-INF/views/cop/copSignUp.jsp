<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<body class="pace-done pace-top">
	<div class="pace pace-inactive">
		<div class="pace-progress" data-progress-text="100%"
			data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
			<div class="pace-progress-inner"></div>
		</div>
		<div class="pace-activity"></div>
	</div>

	<div id="loader" class="app-loader loaded">
		<span class="spinner"></span>
	</div>


	<div id="app" class="app">
		<div class="register register-with-news-feed">
			<div class="register-container">
				<div class="register-header mb-25px h1">
					<div class="mb-1">COP 정보</div>
				</div>
				<div class="register-content">
					<form action="signUp" role="form" method="post">
						<input type="hidden" name="copCode" value="${copVO.copCode}">
					</form>
					<div class="mb-3">
						<label class="mb-2">COP명</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="First name" value="${copVO.copName }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">주제</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="First name" value="${copVO.copSubject  }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">인원</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="First name" value="${copVO.copPersonnel  }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">개설일</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="First name" value="${copVO.copRegdate  }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">소유자</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="First name" value="${copVO.copOwner   }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label class="mb-2">설명</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<textarea class="form-control fs-13px"
									style="height: 140px; resize: none;" readonly="readonly">${copVO.copDetail}</textarea>
							</div>
						</div>
					</div>
					<div class="mb-3 app-content">
						<div class="row">
							<div class="col-6">
								<button type="button" onclick="signUpToCop()" id="signUpButton"
									class="btn btn-primary d-block w-100 btn-lg h-45px fs-13px">가입신청</button>
							</div>
							<div class="col-6">
								<button type="button" onclick="javascript:window.close();"
									id="cancelButton"
									class="btn btn-secondary d-block w-100 btn-lg h-45px fs-13px">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script>
		function signUpToCop() {
			var form = $('form[role="form"]');
			form.submit();
		}
		function signUpCancel() {
			window.close()
		}
	</script>
</body>
