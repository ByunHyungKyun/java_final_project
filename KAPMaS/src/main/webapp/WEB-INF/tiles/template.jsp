<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KAPMaS</title>
<tiles:insertAttribute name="style"/>
<style type="text/css">
	div.app-content{
		padding: 0;
	}
	div.app-header-fixed{
		padding-top: 30px; 
	}
</style>

</head>
<body class="hold-transition sidebar-mini">
	<div id="app" class="app app-header-fixed app-sidebar-fixed app-gradient-enabled" style="padding-top : 20px">
		<tiles:insertAttribute name="header" />

		<tiles:insertAttribute name="aside" />

		<div id="content" class="app-content d-flex flex-column" style="margin-left: 200px;">
			<div class=" flex-grow-1 overflow-hidden ps" data-scrollbar="true" data-height="100%" data-init="true" style="height: 100%;">
				<tiles:insertAttribute name="body"/>
			</div>
			
			<tiles:insertAttribute name="footer" />
		</div>
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top" data-toggle="scroll-to-top"><i class="fa fa-angle-up"></i></a>
	</div>
</body>
<tiles:insertAttribute name="js" />
<script type="text/javascript">
window.addEventListener('load',init());
</script>

</html>




