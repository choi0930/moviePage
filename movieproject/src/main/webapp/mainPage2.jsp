<%@ page language="java" contentType="text/html; charset=UTF-8"
    isELIgnored="false"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath }"/> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script>
	function movieList(){
		location.href="${contextPath}/movieServlet/listMovie.do"
	}
</script>
<style>
section{
width:100%;
background-color: #e2e3e5;
hi
}
	.carousel-inner{
	width: 980px;
	}
	#benner_img{
	width: 980px;
	height:100%;
	margin: 0 auto;
	}
	#Maincontents{
	padding: 50px 30px 60px 30px;
	width: 980px;
	margin: auto;
	}
	#movieC{
	font-size:26px;
	font-weight: 700;
	}
	.MainContents_text{
	font-size:26px;
	margin-bottom: 23px;
	}
	#wapper{
	width:980px;
	height: auto;
	}
	#wapper div{
		display: inline-block;	
	}
	.wapper_movie{
	margin-right: 10px;
	}
	.movieName{
	margin-top:10px;
	width:170px;
	font-size:18px;
	overflow: hidden;
	text-align: center;
    text-overflow: ellipsis;
    white-space: nowrap;
	}
	#up_btn{
	float: left;
	}
</style>
</head>
<body class="d-flex flex-column min-vh-100">
<jsp:include page="movie/top.jsp" />
	<section>
	<div id="benner_img">
		<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="${contextPath }/images/tenet2.jpg" class="d-block w-100" height="500" alt="테넷">
    </div>
    <div class="carousel-item" data-bs-interval="10000">
      <img src="${contextPath }/images/logan2.jpg" class="d-block w-100" height="500" alt="로건">
    </div>
    <div class="carousel-item" data-bs-interval="10000">
      <img src="${contextPath }/images/topgun.jpg" class="d-block w-100" height="500" alt="탑건">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>
	</section>
	<div id="Maincontents">
		<div class="container text-center">
			<div class="row">
				<div class="col col-md-2 MainContents_text" id="movieC">무비차트</div>
				<div class="col col-md-3 MainContents_text">상영중인 영화</div>
				<div class="col-md-4 ms-auto MainContents_text"><button type="button" onclick="movieList()" class="btn btn-outline-success btn-lg">전체보기</button></div>
			</div>
		</div>
		<div id="wapper">
		<c:forEach var="i" begin="0" end="9">
			<div class="wapper_movie">
				<c:if test="${not empty moviesList[i].imageFileName && moviesList[i].imageFileName != 'null' }">
					<img src="${contextPath }/download.do?id=${moviesList[i].id}
					&imageFileName=${moviesList[i].imageFileName}" width="170" height="234"><br>
				</c:if>
					<p class="movieName">${moviesList[i].title}</p>
			</div>
		</c:forEach>	
		
		</div>
	</div>
	<jsp:include page="movie/footer.jsp" />
</body>
</html>