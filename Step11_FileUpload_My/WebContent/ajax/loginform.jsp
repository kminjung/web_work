<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/loginform.jsp</title>
<style>
	.result{
		background-color: #000;
		color: #fff;
		border-radius: 10px;
		margin-top: 10px;
		font-weight: bold;
		font-size: 16px;
	}
</style>
</head>
<body>
<%
	//세션에 저장된 id 읽어오기
	String id=(String)session.getAttribute("id"); //getAttribute - 속성을 가져온다
%>
<%if(id!=null){ %>
	<p>
		<strong><%=id %></strong>님 로그인중...
		<a href="">로그아웃</a> 
	</p>
<%} %>
<h3>jquery 를 활용한 ajax form 전송</h3>
<form action="login.jsp" method="post" id="myForm">
	<label for="id">아이디</label>
	<input type="text" name="id" id="id"/>
	<label for="pwd">비밀번호</label>
	<input type="text" name="pwd" id="pwd"/>
	<button type="submit">로그인</button>
</form>
<div class="result">
	<!-- 여기에 ajax 옴 -->
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>//페이지 로딩되는 시점
		$("#myForm").submit(function(){
		//폼에 입력한 값을 serialize 문자열로 읽어내기 /폼을 제출했을 때 실행 ↓
		//id=xxx?pwd=xxx.. 
		var param=$(this).serialize();
		// name 속성을 이용해서 id(파라미터 name)=xxx(파라미터 value)?wpd=xxx..형태의 문자열을 만들어낸다.
		console.log(param);
		
		//ajax request 를 이용해서 폼에 입력한 내용 서버에 전송
		$.ajax({
			url:"login.jsp", //요청경로
			method:"post", //요청 메소드
			data: param, //요청 파라미터 / 폼에 입력한 것
			success: function(responseData){ //응답 데이터 
				console.log(responseData);
				$(".result").text(responseData);
				//responseData 는 object 이다.
				if(responseData.isSuccess){
					alert("로그인 되었습니다.");
				}else{
					alert("아이디 혹은 비밀 번호가 틀려요.");
				}
			},
			error: function(xhr){
				$(".result").text(xhr.responseText);
			}
		});
		
		return false;//폼 전송 막기(페이지 전환 방지)
	});
</script>
</body>
</html>
<!-- 
	Ajax - 웹 페이지 전체를 다시 로딩하지 않고도, 웹 페이지의 일부분만을 갱신할 수 있습니다.
		    즉 Ajax를 이용하면 백그라운드 영역에서 서버와 통신하여, 그 결과를 웹 페이지의 일부분에만 표시할 수 있습니다.
 -->