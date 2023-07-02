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
<title>로그인</title>

<style>
	#login{
		width: 400px;
		margin: 0 auto;
	}
	#content{
	margin-top: 100px;
	}
	.input-form-box{
	text-align: right;
	}
	#btn{
	width: 400px;}
	#link{
	margin-top: 20px;
	text-decoration: none;
	color:black;
	}
	#title{
	margin-bottom: 25px;
	}
</style>
</head>
<body  class="d-flex flex-column min-vh-100">

<jsp:include page="top.jsp" />
<section id="login">
	<div id="content">
	<h1 id="title">관리자 로그인</h1>
	<form name="frmlogin" action="${contextPath }/movieUser/adminLogin.do" method="post">
		<table class="table table-bordered">
		<tr>
			<td width="200"class="input-form-box" ><b>아이디:</b></td>
			<td width="400"><input type="text" name="id" class="form-control" required></td> 
		</tr>
		<tr>
			<td width="200" class="input-form-box" ><b>비밀번호:</b></td>
			<td width="400"><input type="password" name="pwd" class="form-control" required></td>
		</tr>
		</table>
		<input type="submit" value="로그인" id="btn" class="btn btn-success btn-xs">
	</form>
	</div>
		<a id="link" href="${contextPath}/movie/member.jsp">회원가입하기</a>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>