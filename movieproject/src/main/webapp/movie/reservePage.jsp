<%@ page language="java" contentType="text/html; charset=UTF-8"  isELIgnored="false"
    import = "java.util.*, movieVO.*"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <c:set var="contextPath" value="${pageContext.request.contextPath }"/>
   	<% 
		request.setCharacterEncoding("utf-8");
   		UserVO userVO = (UserVO) session.getAttribute("userVO");
		List<Reservation> reservationList = (List<Reservation>) request.getAttribute("reservationList");
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 페이지</title>
<% if (userVO == null) { %>
    <script type="text/javascript">
        alert('로그인해야 이용할 수 있음');
        location.href="${contextPath}/movieServlet/listMovie.do";
    </script>
<% }%>
<style>
	#main{
		width:500px;
		
		margin: 0 auto;
		text-align: center;
	}
	#content{
	margin-top: 100px;
	}
	#screenImage{
		margin-bottom: 20px;
	}
	.seats{
		width: 30px;
		height: 30px;
		text-align:center;
	}
	#num{
	margin-right: 10px;
	}
	#reserve{
	width:400px;
	height:300px;
	background-image:url("../images/movie-theater.png");
	background-repeat:no-repeat;
	background-size:400px 300px;
	padding-top: 110px;
	color:white;
	font-size: 20px;
	}
	#movieReserve{
	text-align: center;
	}
	#movieCheck{
	margin-right: auto;
	margin-left: auto;
	}
	
</style>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="top.jsp" />
<section id="main">
<div id="content">
<c:choose>
	<c:when test="${empty resId }">
	<div id="screenImage">
		<img src="../images/screen.png" alt="screen" />
	</div>
	<form action="${contextPath }/rvnController/reservation.do" method="post" enctype="utf-8">
		<input type="hidden" name="movieTitle" value="${movieTitle }">
		<input type="hidden" name="movieId"  value="${movieId }">
		<input type="hidden" name="userId"  value="${userId }">
		<div id="movieReserve">
		<table id="movieCheck">
		<%for(int i = 0; i<11; i++){ 
			char row =(char)('A'+i); 
			if(i==0){  %>
			<tr>
				<td></td>
				<%for(int b = 1; b<10; b++){ %>
					<td><%=b%></td>
				<%}%>
				</tr>
			<%}%>
			<tr>
			<td><%=row %></td>
		<%for(int c = 1; c<10; c++){
		 	 String seat= row+"-"+c;
		  	 boolean isReserved = false;
		  	 
		  	for(int a = 0; a<reservationList.size(); a++){
			  	Reservation reservation = reservationList.get(a);
			  	String rSeat = reservation.getSeat();
			  	if(rSeat.equals(seat)){ 
						isReserved = true;
						break;
			   }%>	 
		 <% }
		 	if(isReserved){ %>	
		   		<td class="seats"><input class="form-check-input" type="checkbox"  name="seat" value = <%=seat %> disabled checked/></td>
		  <%}else{ %>
		  		<td class="seats"><input class="form-check-input" type="checkbox" name="seat" value = <%=seat %>/></td>	
		 <% }
			} %>
			</tr>
		<%if(i == 5){%>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		<%} 
		} %>
		</table>
		</div>
		<input type="submit" value="예매하기" />
	</form>

	</c:when>
	
	<c:when test="${not empty resId }">
		<div id="reserve">
			<b>예매 완료<br>
			발급번호: ${resId }</b>
		</div>
	</c:when>
</c:choose>
</div>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>