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

<% if (userVO == null) { %>
    <script type="text/javascript">
        alert('로그인해야 이용할 수 있음');
        location.href="adminLogin.jsp";
    </script>
<% }%>
<style type="text/css">
*{
padding: 0;
margin: 0;
}</style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="${contextPath }/movieServlet/adminListMoives.do">관리자</a> 

  <!-- Links -->
 
  <ul class="navbar-nav">
    <%if(userVO != null){ %>
      <li class="nav-item">
      <a class="nav-link" href="${contextPath }/movieUser/logOut.do">LogOut</a>
   	 </li>
    <%} %>
    <li class="nav-item">
      <a class="nav-link" href="${contextPath }/movieServlet/adminListMoives.do">영화 목록</a> 
    </li>
 
     <li class="nav-item">
      <a class="nav-link" href="${contextPath }/movieUser/adminAddMoviePage.do">영화 추가</a>
    </li>
    
    <li class="nav-item">
      <a class="nav-link" href="${contextPath }/movieServlet/adminListMoives.do">영화 삭제</a>
    </li>
  </ul>

</nav>
</body>
</html>