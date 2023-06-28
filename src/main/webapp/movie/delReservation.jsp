<%@ page language="java" contentType="text/html; charset=UTF-8"
import = "movieVO.*"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
   	 <%
   	 request.setCharacterEncoding("utf-8");
   		UserVO userVO = (UserVO) session.getAttribute("userVO");
   	 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 취소</title>
<% if (userVO == null) { %>
    <script type="text/javascript">
        alert('로그인해야 이용할 수 있음');
        location.href="login.jsp";
    </script>
<% }%>
<style>
	#main{
	width: 500px;
	margin: 0 auto;
	}
	#content{
		margin-top:70px;
		text-align: center;
	}
	#msg{
		color:red;	
	}
	.success{
	width: 80px;
	height: 80px;
	}
</style>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="top.jsp" />
<section id="main">
	<div id="content">
	<c:choose>
		<c:when test="${empty msg}">
			<form action="${contextPath }/rvnController/delReservation.do" method="post">
				<h1>예매 취소</h1><br>
				<input type="text" name="resid" placeholder="예매번호를 입력해주세요" size="25"  required>
				<input type="submit" value="확인">
			</form>
	</c:when>
	<c:when test="${not empty msg && success == 1}">
		 <img class="success" src="../images/check1.png" />
		 <h2 id="msg">${msg }</h2>
	</c:when>
	<c:when test="${not empty msg && success == 0}">
		 <img class="success" src="../images/false.png" />
		 <h2 id="msg">${msg }</h2>
	</c:when>
	</c:choose>
	</div>
</section>
	<jsp:include page="footer.jsp" />
</body>
</html>