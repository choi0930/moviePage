<%@ page language="java" contentType="text/html; charset=UTF-8"
    isELIgnored="false"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
char[] row = {'A','B','C','D','F','G'};
int[] col = {1,2,3,4,5,6,7,8,9};

%>  
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="ROW" items="<%=row %>">

	<c:forEach var="COL" items="<%=col %>">
		
		<input type="checkbox" value=""/>
	</c:forEach>
<br>
	</c:forEach>
</body>
</html>