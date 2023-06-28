<%@ page language="java" contentType="text/html; charset=UTF-8"
	import = "java.util.List, movieVO.*"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%request.setCharacterEncoding("utf-8"); 
   		 UserVO userVO = (UserVO) session.getAttribute("userVO");
   		 
    %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 확인 페이지</title>
<% if (userVO == null) { %>
    <script type="text/javascript">
        alert('로그인해야 이용할 수 있음');
        location.href="login.jsp";
    </script>
<% }%>
<style>
	#main{
	width: 570px;
	margin: 0 auto;
	}
	#content{
		margin-top:70px;
	}
	#img{
	float: left;
	position: relative;
	top:-30px;
	}
	.text{
	vertical-align:top;
	text-align: right;
	}
	#back{
	height:250px;
	background-color: #e2e3e5;
	padding-top: 30px;
	}
	#checkReservation{
	text-align: center;
	}
	#msg{
	color:red;
	}
	.resList{
	width:100px;
	vertical-align: top;
	text-align: right;
	}
	#checkReserve{
	margin-left: auto;
	margin-right: auto;
	}
</style>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="top.jsp" />
	<section id="main">
	<div id="content">
	<c:choose>
		<c:when test="${empty reservationList}">
			<div id="checkReservation">
			<form action="${contextPath }/rvnController/findByResid.do" method="post">
				<h1>예매 확인</h1><br>
				<input type="text" name="resid" placeholder="예매번호를 입력해주세요" size="25" required>
				<input type="submit" value="확인"><br>
				 <h2 id="msg">${msg}</h2>
			</form>
			</div>
	</c:when>
	<c:when test="${not empty reservationList}">
	<h1>${userVO.name}님의<br>
		예매 확인 내역 입니다.</h1><br>
	<div id="back">
		<div id="img">
			<c:if test="${not empty movie.imageFileName && movie.imageFileName != 'null' }">
				<input type="hidden" name="originalFileName" value="${movie.imageFileName }">
		    	<img id = "preview" src = "${contextPath}/download.do?imageFileName=${movie.imageFileName}&id=${movie.id}" width="200" height="250"/>
	    	</c:if>
		</div>
		<table id="info">
			<tr>
				<td class="text" width="100"><b>예매 번호:</b></td>
				<td>&nbsp;${reservationList[0].resid }</td>
			</tr>
		 	<tr>
		 		<td class="text" width="100"><b>좌석:</b></td>
		 		<td>
		 			<c:forEach var = "reservation" items="${reservationList }" varStatus="i">
		 				<c:if test="${i.count mod 6 ==0 }">
		 					<br>
		 				</c:if>
							&nbsp;${reservation.seat}&nbsp;
		 			</c:forEach>
		 		</td>
		 	</tr>
		 	<tr>
		 		<td class="text" width="100"><b>영화 이름:</b></td>
		 		<td>&nbsp;${reservationList[0].moviename }</td>
		 	</tr>
		 </table>
	</div>
	</c:when>
	</c:choose>
	</div>
	<c:if test="${not empty resList }">
		<table id="checkReserve"class="table table-dark table-striped-columns" align="center" style="width: 370px; margin-top: 40px;">
		<c:forEach var="list" items="${resList}">
		<c:if test="${list.size() != 0 }">
			<tr>
				<td class="resList">예매 번호:</td>
				<td> ${list[0].resid }</td>
			</tr>
			<tr>
				<td class="resList">영화 이름:</td>
				<td>${list[0].moviename }</td>
			</tr>
			<tr>
				<td class="resList">좌석:</td>
				<td>
					<c:forEach var="reserve" items="${list }" varStatus="loop">
						<c:if test="${loop.count mod 6 ==0 }">
							<br>
						</c:if>			
						${reserve.seat}&nbsp;
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><a href="${contextPath }/rvnController/delReservation.do?resid=${list[0].resid}" style="color:green">예매취소</a></td>
			</tr>
			</c:if>
	</c:forEach>
		</table>
	</c:if>
	
	
	
	</section>
	
	
	<jsp:include page="footer.jsp" />
</body>
</html>