<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	*{
	margin:0px;
	padding: 0px;
	}
	fieldset{
	border: 0px
	}
	#join_input{
	position:relative;
	width: 520px;
	margin: 0 auto;
	margin-top: 80px;
	font-family: 'Roboto', 'NotoSansKR', Malgun Gothic, '맑은 고딕', Dotum, '돋움', sans-serif;
    font-size: 12px;
	}
	#join_input fieldset legend{
	font-size: 20px;
	}
	#join_input fieldset label{
	font-size: 16px;
	}
	#join_input fieldset input{
	font-size: 20px;
	margin-left:auto;
	margin-right:auto;
    }
	
	.form_input{
	width: 500px;
	height: 50px;
	}
	.form_email{
	width:165px;
	}
	#form_email span{
	font-size: 20px;
	}
	#email_select{
	width: 136px;
	height: 50px;
	}
	
	#form_userId, #form_userPwd, #form_userName, #form_email, #userPhone{
	margin-bottom: 30px;
	}
</style>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="movie/top.jsp" />
<div id="join_input">
	<fieldset>
	<legend>기본정보입력(필수)</legend>
	<div id="form_userId">
		<label for="userId">아이디</label><br>
		<div>(4-16자의 영문,숫자만 사용)</div>
		<input type="text" name="id" id="userId" class="form_input"/>
		<div id="idMessage"></div>
	</div>
	<div id="form_userPwd">
		<label for="userPwd">비밀번호</label><br>
		<div>(8-16자의 영문,숫자,특수문자를 조합해 입력)</div>
		<input type="password" name="pwd" id="userPwd" class="form_input"/>
		<div id="pwdMessage"></div>
	</div>
	<div id="form_userPwd">
		<label for="userPwdCheck">비밀번호 확인</label><br>
		<input type="password" name="pwdCheck" id="userPwdCheck" class="form_input"/>
		<div id="pwdCheckMessage"></div>
	</div>
	<div id="form_userName">
		<label for="userName">이름</label><br>
		<input type="text" name="name" id="userName" class="form_input"/>
		<div id="nameMessage"></div>
	</div>
	<div id="form_email">
		<label for="userEmail">이메일</label><br>
		<input type="text" name="emil1" id="userEmail" class="form_input form_email"/>
		<span>@</span> <input type="text" name="emil2" class="form_input form_email" />
		<select id="email_select">
			<option>이메일 선택</option>
			<option>gmail.com</option>
			<option>naver.com</option>
			<option>daum.net</option>
			<option>hanmail.net</option>
			<option>nate.com</option>
			<option>lycos.co.kr</option>
			<option>hotmail.com</option>
			<option>korea.com</option>
			<option>yahoo.co.kr</option>
			<option>직접 입력</option>
		</select>
		<div id="emailMessage"></div>
	</div>
	<div>
		<label for="userPhone">전화번호</label><br>
		<input type="text" name="phone" id="userPhone" class="form_input"/><br>
		<div id="phoneMessage"></div>
	</div>
	</fieldset>
	
</div>
<jsp:include page="movie/footer.jsp" />
</body>
</html>