<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    	request.setCharacterEncoding("utf-8");
    %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.member{
	text-decoration: none;
	color:
	}
	#content{
	margin-top:100px;
	
	text-align: center;
	list-style-type: none;
	}
	ul li{
	display: inline;
	}
</style>
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="top.jsp" />
		<ul id="content">
			<li>
				<a class="member" href="${contextPath }/movieUser/addUserForm.do">
				<img src="../images/user.png" alt="일반유저 회원가입"/></a>
			</li>
			<li>
				<a class="member" href="${contextPath }/movieUser/adminForm.do">
				<img src="../images/admin.png" alt="관리자 회원가입"/></a>
			</li>
		</ul>
	<jsp:include page="footer.jsp" />
</body>
</html>