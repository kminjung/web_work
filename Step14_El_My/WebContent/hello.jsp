<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hello.jsp</title>
</head>
<body>
<h3>Expression Language 테스트</h3>
<h4>el 로 산술 연산하기</h4>
<p>1+1=<strong>${1+1 }</strong></p>
<p>10-9=<strong>${10-9 }</strong></p>
<p>10*10=<strong>${10*10 }</strong></p>
<p>10/3=<strong>${10/3 }</strong></p>

<h3>el 로 비교연산 하기</h3>
<p> 10 은 2 보다 커요 : <strong>${10 > 2 }</strong></p>
<p> 10 은 2 보다 커요 : <strong>${10 gt 2 }</strong></p>
<p> 10 은 2 보다 같거나 커요 <strong>${10 >= 2 }</strong></p>
<p> 10 은 2 보다 같거나 커요 <strong>${10 ge 2 }</strong></p>
<p> 10 은 2 보다 작아요 <strong>${10 < 2 }</strong></p>
<p> 10 은 2 보다 작아요 <strong>${10 lt 2 }</strong></p>
<p> 10 은 2 보다 같거나 작아요 <strong>${10 <= 2 }</strong></p>
<p> 10 은 2 보다 같거나 작아요 <strong>${10 le 2 }</strong></p>

<h3>논리 연산</h3>
<p> true || false : ${true || false }</p>
<p> true or false : ${true or false }</p>
<p> true && false : ${true && false }</p>
<p> true and false : ${true and false }</p>
<p> !true : ${!true }</p>
<p> not true : ${not true} </p>

<h3>empty 연산자 (자주 사용됨)</h3>
<p> empty null : <strong>${empty null} </strong></p> <!-- //비여있는지 여부 -->
<p> empty "" : <strong>${empty "" }</strong></p><!-- null 도 없으면 true -->
<p> not empty null : <strong>${not empty null }</strong></p><!-- 비어있지 않은지 -->//
<p> not empty "" : <strong>${not empty "" }</strong></p>

</body>
</html>
<!-- 
	hello.jsp 가 서블릿 페이지로 바뀔 때 ${1+1 }의 해석된 결과가 실행된다.
	{}안의 작성법이 EL 이다.
	
	기호는 효율성이 떨어진다. 그래서 별도의 기호가 있다.
 -->