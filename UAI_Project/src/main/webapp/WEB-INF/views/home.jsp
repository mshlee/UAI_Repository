<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>테스트 페이지 입니다.</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P><br><br>
응답 테스트 결과: 
<c:choose>
<c:when test="${!empty str }">${str }</c:when>
<c:otherwise>실패</c:otherwise></c:choose><br>
<form action="./responseTest">
요청 테스트 : <input type="text" name="returnObject" value="아무 값이나 입력하세요">
<input type="submit"><br>
</form>
</body>
</html>
