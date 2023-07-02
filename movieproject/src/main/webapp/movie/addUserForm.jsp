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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
function check(){
	var id=frmAddUser.id.value;
	var pwd = frmAddUser.pwd.value;
	var name = frmAddUser.name.value;
	
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
		return false;
	}
	frmAddUser.submit();
}

function fn_checkId(){ //아이디 중복체크
	var _id = $("#userId").val();
	if(_id==''){
		alert("아이디를 입릭하세요");
		return false;
	}
	$.ajax({
		type:"post",
		async:true,
		url:"${contextPath}/movieUser/checkId.do",
		dataType:"text",
		data:{id:_id},
		success:function(data, textStatus){
			if(data=='usable'){
				$('#message').text("사용할 수 있는 ID입니다");
			}else{
				$('#message').text("사용할 수 없는 ID입니다.");
			}
		},
		error:function(data, textStatus){
			alert("에러가 발생했습니다.");
		},
		complete:function(data, textStatus){
			
		}
	});
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
				<td width="400"><input type="text" name="id" id="userId" class="form-control" required></td>
			</tr>
			<tr>
				<td width="200"><p align="center"><span class="text">*</span>비밀번호</p></td>
				<td width="400" ><input type="password" name="pwd" class="form-control" required></td>
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
				<td width="200"><p align="center"><a id="mainPage" href="${contextPath}/movieServlet/listMoives.do" >
				메인페이지 이동</a></p></td>
				<td width="400"><input type="button" value="회원가입" onclick="check()" class="btn btn-success btn-xs" >
				<input type="reset" value="다시입력" class="btn btn-success"></td>
			</tr>
		</table>
		<input type="button" value="ID중복확인" onclick="fn_checkId();">
		<div id="message"></div>
	</form>
		<span class="text">*</span>&nbsp; 필수입력항목
	</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>