<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   	 <c:set var="contextPath" value="${pageContext.request.contextPath }" />
   	 
   	 <%
   	 	request.setCharacterEncoding("utf-8");
   	 	String id = String.valueOf(request.getAttribute("id")); 
   	    String title = String.valueOf(request.getAttribute("title")); 
   	 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">

	function readURL(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
</script>
<style>
	#image{
	float:left;
	}
	#addPage{
		margin:0 auto;
		width:1200px;
		position: relative;
		top: 50px;
	}
	.success{
	width: 80px;
	height: 80px;
	}
</style>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="adminTop.jsp" />
<section id="addPage">
<c:choose>
	<c:when test="${empty id }">
	<form action="${contextPath}/movieServlet/addMovie.do" method="post" enctype="multipart/form-data">
		<div id="image">
			<img id = "preview" src = "#" width="200" height="200" /><br><br>
			<input type="file" class="form-control" name="imageFileName" onchange="readURL(this);">
		</div>
			<table>
				<tr>
					<td>영화 제목:</td>
					<td><input type="text" name="title" ></td>
				</tr>
				<tr>
					<td>영화 장르: </td>
					<td><input type="text" name="genre" ></td>
				</tr>
				<tr>
					<td><p style="vertical-align:top;">영화 설명:</p></td>
					<td><textarea rows="5" cols="100" name="content" ></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="영화추가" >
					<input type="reset" value="다시입력" ></td>
				</tr>
			</table>
		</form>
	</c:when>
	<c:otherwise>
	
	<img class="success" src="../images/check1.png" /><br>
		영화 등록됨<br>
		영화 제목 : ${title}<br>
		영화 발급번호 : ${id }<br>
	</c:otherwise>
</c:choose>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>