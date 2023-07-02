<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
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
<script>
function fn_remove_movie(url, id, imageFileName){ //삭제
	var check = confirm("삭제 하시겠습니까?");
	if(check){
	var form = document.createElement("form"); 
	form.setAttribute("method","post"); 
	form.setAttribute("action", url); 
	var IdInput = document.createElement("input"); 
	IdInput.setAttribute("type","hidden"); 
	IdInput.setAttribute("name","id"); 
	IdInput.setAttribute("value", id); 
	var imageFileNameInput = document.createElement("input");
	imageFileNameInput.setAttribute("type","hidden"); 
	imageFileNameInput.setAttribute("name","imageFileName"); 
	imageFileNameInput.setAttribute("value", imageFileName); 
	form.appendChild(IdInput);
	form.appendChild(imageFileNameInput);
	document.body.appendChild(form); 
	form.submit();
	}
}

</script>
<style>
#image{
	float:left;
	}
	#adminPage{
		margin:0 auto;
		width:1200px;	
	}
	ul{
	list-style-type: none;
	}
	#list{
	height: 270px;
	}
	#con{
		vertical-align: top;
	}
	#delmovie{
	text-decoration: none;
	color:red;
	}
	#delmovie:hover {
	color:black;
	}
</style>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="adminTop.jsp" />
어드민
<section id="adminPage">
<h1>상영중인 영화</h1>
<ul class="list-group list-group-flush">	
	<c:forEach var="movie" items="${moviesList }">
		<li id="list" class="list-group-item">
			<input type="hidden" name="id" value="${movie.id}">
			<div id="image">
				<c:if test="${not empty movie.imageFileName && movie.imageFileName != 'null' }">
					<input type="hidden" name="imageFileName" value="${movie.imageFileName }">
					<img id = "preview" src = "${contextPath}/download.do?imageFileName=${movie.imageFileName}&id=${movie.id}" width="200" height="250"/>
				</c:if>
			</div>
				<table>
					<tr>
						<td width="100"><b>영화 아이디:</b></td>
						<td>${movie.id }</td>
					</tr>
					<tr>
						<td width="100"><b>영화 제목:</b></td>
						<td>${movie.title }</td>
					</tr>
					<tr>
						<td width="100"><b>영화 장르:</b></td>
						<td>${movie.genre }</td>
					</tr>
					<tr>
						<td id="con" width="100"><p style="vertical-align:top;"><b>영화 설명:</b></p></td>					
						<td><p>${movie.content }</p></td>
					</tr>
					<tr>
						<td><%--<a id="delmovie" href="${contextPath }/movieServlet/delMovie.do?id=${movie.id}">삭제</a>--%></td>
						<td><button type="button" class="btn btn-success btn-xs" onclick="fn_remove_movie('${contextPath }/movieServlet/delMovie.do',${movie.id},'${movie.imageFileName}');">삭제</button></td>
					</tr>
				</table>
		</li>
	</c:forEach>
</ul>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>