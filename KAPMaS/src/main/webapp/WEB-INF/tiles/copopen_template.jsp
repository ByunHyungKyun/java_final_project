<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<tiles:insertAttribute name="style" />
<style>
	.app-sidebar {
		padding-top: 0px;
	}
	
	#sidebar {
		position: absolute;
	}
	
	#listTable {
		height: 460px;
	}
	
	.app-content {
		padding: 20px 10px 10px 10px;
	}
	
	.row {
		margin: 0px;
	}
	.pace{
	visibility: hidden;
}
</style>
</head>
<body>

<tiles:insertAttribute name="copaside" />

<tiles:insertAttribute name="body" />

<tiles:insertAttribute name="js" />
</body>
</html>