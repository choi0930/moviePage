<%@ page language="java" contentType="text/html; charset=UTF-8"
    isELIgnored="false"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentInfo</title>
<script type="text/javascript">
function check(){
	var id=frmAddUser.id.value;
	var pwd = frmAddUser.pwd.value;
	var name = frmAddUser.name.value;
	var email= frmAddUser.email.value;
	
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(id==""){
		alert("아이디를 입력해주세요");
		return false;
	}
	if(pwd==""){
		alert("비밀번호를 입력해주세요");
		
		return false;
	}
	if(name==""){
		alert("이름을 입력해주세요");
		name.focus();
		return false;
	}
	if(regExp.test(email) == false){
		alert("이메일 형식이 아닙니다");
		return false;
	}
	frmAddUser.submit();
}
</script>
<style>
	#addUser{
	width: 450px;
	margin: 0 auto;
	}
	#content{
	margin-top: 100px;
	}
	#title{
	margin-bottom:35px;
	}
	p{
	font-size: 17px;
	}
	#mainPage{
		text-decoration: none;
		font-weight: bold;
		color:green;
	}
	.text{
	color:red;
	}
</style>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="top.jsp" />
<section id="addUser">
	<div id="content">
	<h1 id="title">회원가입</h1>
	<form name="frmAddUser" method="post" action="${contextPath }/movieUser/addUser.do" enctype="UTF-8">
		<table class="table table-bordered">
			<tr>
				<td width="200"><p align="center"><span class="text">*</span>아이디</p></td>
				<td width="400"><input type="text" name="id" class="form-control" required></td>
			</tr>
			<tr>
				<td width="200"><p align="center"><span class="text">*</span>비밀번호</p></td>
				<td width="400"><input type="password" name="pwd" class="form-control" required></td>
			</tr>
			<tr>
				<td width="200"><p align="center"><span class="text">*</span>이름</p></td>
				<td width="400"><input type="text" name="name" class="form-control" required></td>
			</tr>
			<tr>
				<td width="200"><p align="center">이메일</p></td>
				<td width="400"><input type="text" name="email" class="form-control"></td>
			</tr>
			<tr>
				<td width="200"><p align="center"><a id="mainPage" href="${contextPath}/movieServlet/listMoives.do" >메인페이지 이동</a></p></td>
				<td width="400"><input type="button" value="회원가입" onclick="check()" class="btn btn-success btn-xs" >
				<input type="reset" value="다시입력" class="btn btn-success"></td>
			</tr>
		</table>
	</form>
		<span class="text">*</span>&nbsp; 필수입력항목
	</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>