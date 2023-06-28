<%@ page language="java" contentType="text/html; charset=UTF-8"
     isELIgnored="false"
     import ="movieVO.*"
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
<title>MainPage</title>

<%--  <% if (userVO == null) { 
<script type="text/javascript">
    alert('로그인해야 이용할 수 있음');
    location.href="login.jsp";
</script>
<% }%>
--%>
<style>
#image{
	float:left;
	}
	#mainPage{
		margin:0 auto;
		width:1200px;
	}
	#list{
	height: 270px;
	}
	#con{
	vertical-align: top;
	}
	#content{
	position: relative;
	top:30px;
	left:50px;
	}
	#btn{
		float:right;
	}

</style>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="top.jsp" />

<section id="mainPage">
	
	<h1>상영중인 영화</h1>
	<ul class="list-group list-group-flush">
		
	<c:forEach var="movie" items="${moviesList }">
	<li class="list-group-item">
	<div id="list">
		<div id="image">
			<c:if test="${not empty movie.imageFileName && movie.imageFileName != 'null' }">
				<input type="hidden" name="originalFileName" value="${movie.imageFileName }">
				  <img id = "preview" src = "${contextPath}/download.do?imageFileName=${movie.imageFileName}&id=${movie.id}" width="200" height="250"/>
			</c:if>
		</div>
	<form name="frmMain" action="${contextPath}/rvnController/reserve.do" method="post" enctype="UTF-8">
			<table id="content">
				<!--<tr>
					<td width="100">영화 아이디:</td>
					<td>${movie.id }</td>
				</tr>-->
				<tr>
					<td width="100"><b>영화 제목:</b></td>
					<td>${movie.title }</td>
				</tr>
				<tr>
					<td width="100"><b>영화 장르:</b></td>
					<td>${movie.genre }</td>
				</tr>
				<tr>
					<td id = "con" width="100"><p style="vertical-align:top;"><b>영화 설명:</b></p></td>
					<td><p>${movie.content }</p></td>
				</tr>
				
			</table> <br>
					<input type="hidden" name="movieid" value="${movie.id }" />
					<input type="hidden" name="movieTitle" value="${movie.title }" />
					<input type="hidden" name="userId" value="${userVO.id }" />
			
				<input id="btn" class="btn btn-success" type="submit"  value="예매" >
			
	</form>
	</div>
	</li>
</c:forEach>
	
</ul>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>