<%@ page language="java" contentType="text/html; charset=UTF-8"
isELIgnored="false"
import="movieVO.*"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    	request.setCharacterEncoding("utf-8");
   	    UserVO userVO = (UserVO) session.getAttribute("userVO");
    %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<style>
*{
padding: 0;
margin: 0;
}
	a{
	text-decoration: none;
	}
	
</style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="${contextPath}/movieServlet/listMoives.do?id=${userVO.id}">영화</a> 

  <!-- Links -->
 
  <ul class="navbar-nav">
  	<c:choose>
  		<c:when test="${empty userVO }">
  			<li class="nav-item">
      			<a class="nav-link" href="${contextPath }/movieUser/login.do">LogIn</a> 
    		</li>
    		<li class="nav-item">
      			<a class="nav-link" href="${contextPath }/movie/member.jsp">Join</a> 
    		</li>	
    		<li class="nav-item">
     		 	<a class="nav-link" href="${contextPath }/movieUser/adminLoginPage.do">관리자 로그인</a>
   		 	</li>
  		</c:when>
  		<c:when test="${not empty userVO }">
  			<li class="nav-item">
      			<a class="nav-link" href="${contextPath }/movieUser/logOut.do">LogOut</a>
   	 		</li>
   	 		<li>
   	 			<a class="nav-link" href="${contextPath }/rvnController/reserveCheck.do?id=${userVO.id}">예매확인</a>
   	 		</li>
   	 		<li>
   	 			<a class="nav-link" href="${contextPath }/movie/delReservation.jsp">예매취소</a>
   	 		</li>
  		</c:when>
  	</c:choose>
  		<li>
   	 		<a class="nav-link" href="${contextPath }/movieServlet/listMovie.do">예매하기</a>
   		</li>
  	</ul>
</nav>
	<c:if test="${not empty userVO }">
		<div id="userInfo">
			${userVO.id }님 반갑습니다.
		</div>
	</c:if>
</body>
</html>