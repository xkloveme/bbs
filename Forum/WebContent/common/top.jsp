<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" />
<script type="text/javascript">
function logout() {
	if (confirm("您确定要退出系统吗？")) {
		window.location.href="User_logout.action";
	}
}
function login(){
	var curPage=window.location.href;
	window.location.href="login.jsp?prePage="+curPage;
}
function checkUserLogin(){
	if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
		alert("您还未登陆！");
	} else {
		window.location.href="User_userCenter.action";
	}
}
</script>
</head>
<body>
<div>
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h2><a href="#">黄科大师生交流论坛</a></h2>
				<p> <a href="#" rel="nofollow">分享知识，了解世界</a></p>
			</div>
		</div>
	</div>
	<div id="menu-wrapper">
		<div id="menu" class="container">
			<ul>
				<li class="current_page_item"><a href="index.jsp">首　页</a></li>
				<li><a href="http://www.hhstu.edu.cn/">黄河科技学院官网</a></li>
				<li><a href="http://www.hhstu.cn/">黄科大招生信息网</a></li>
				<li><a href="http://www.hhstu.cn/">黄科大图书馆</a></li>
			</ul>
		</div>
		<!-- end #menu --> 
	</div>
<div style="margin: 0 auto;" align="right">
		<c:choose>
			<c:when test="${not empty currentUser }">
				当前用户：<a href="#">${currentUser.nickName }</a>&nbsp;『<c:choose>
					                  	  		<c:when test="${currentUser.sectionList.size()==0&&currentUser.type!=2 }">
					                  	  			<font style="color: black;">普通用户</font>	
					                  	  		</c:when>
					                  	  		<c:when test="${currentUser.sectionList.size()!=0&&currentUser.type!=2 }">
					                  	  			<font style="color: blue;">版主</font>
					                  	  		</c:when>
					                  	  		<c:otherwise>
					                  	  			<font style="color: red;">管理员</font>
					                  	  		</c:otherwise>
					                  	  	</c:choose>』|
				<a href="javascript:logout()">注销</a>|
				<a href="register.jsp">注册</a>|
				<a href="javascript:checkUserLogin()">个人中心</a>
			</c:when>
			<c:otherwise>
				<!-- <a href="login.jsp">登录</a>| -->
				<a href="javascript:login()">登录</a>|
				<a href="register.jsp">注册</a>|
				<a href="javascript:checkUserLogin()">个人中心</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</body>
</html>