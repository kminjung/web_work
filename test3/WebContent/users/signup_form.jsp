<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
</head>
<body>
<h3>회원 가입 페이지 입니다.</h3>
<form action="signup.jsp" method="post" id="signupForm">
	<label for="id">아이디</label>
	<input type="text" name="id" id="id"/>
	<span id="checkResult"></span>
	<br/>
	<label for="pwd">비밀번호</label>
	<input type="password" name="pwd" id="pwd"/><br/>
	<label for="email">이메일</label>
	<input type="text" name="email" id="email"/><br/>
	<button type="submit">가입</button>
</form>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	//폼의 유효성 여부
	var formValid=false;	
	$("#signupForm").submit(function(){
		//만일 폼의 유효성 여부가 false 이면 
		if(formValid==false){
			return false;//폼 전송 막기
		}
	});
	
	//아이디 입력란에 입력했을 때 실행할 함수 등록
	$("#id").on("input", function(){
		//입력한 아이디를 읽어와서
		var inputId=$(this).val();
		//ajax 요청을 이용해서 서버에 보낸다. DB 에 존재하는지 안하는지 확인하기 위해 / 응답되는 데이터가 화면에 나타나는지의 차이
		$.ajax({ //페이지 이동없이 요청이 들어간다. (페이지이동X, 백그라운드로 요청, ajax -이동없이 요청을 보내거나 받고싶을 때 사용)
			url:"checkid.jsp", // 여기로 요청이 들어간다. 상대경로 요청(/users/checkid.jsp)
			method:"post", // post 방식의 users/checkid.jsp 요청이 되는 것
			data:{"inputId":inputId}, //보낼 데이터를 적는 곳 {"파라미터 명" : 파라미터 value}
			success:function(responseData){
				//무엇이 응답하는지 콘솔에 출력 해 보기
				console.log(responseData);
				// responseData 는 object 이다.
				// {canUse:true} 또는 {canUse:false}
				if(responseData.canUse){
					formValid=true;
					$("#checkResult")
					.text("사용가능")
					.css("color","#00ff00");
				}else{
					formValid=false;
					$("#checkResult")
					.text("사용불가")
					.css("color","#ff0000");
				}
			}
		});
	});
</script>
</body>
</html>
<!-- 
	name 속성의 value 는 파라미터 추출할 때 사용한다.
	id 는 label id 와 이어진다.
	/로 시작하지 않으면 상대경로다.
	
	백그라운드로 요청된 것은 주소창에 안나타난다. 그 문자열은 responseData 로 들어온다.

 -->
 
 <!-- 
 	[ ajax 웹 페이지와 대화]
 	
 	- Ajax는 빠르게 동작하는 동적인 웹 페이지를 만들기 위한 개발 기법의 하나입니다.
	- Ajax는 웹 페이지 전체를 다시 로딩하지 않고도, 웹 페이지의 일부분만을 갱신할 수 있습니다.
	   즉 Ajax를 이용하면 백그라운드 영역에서 서버와 통신하여, 그 결과를 웹 페이지의 일부분에만 표시할 수 있습니다.
         이때 서버와는 다음과 같은 다양한 형태의 데이터를 주고받을 수 있습니다.
	  JSON, XML, HTML, 텍스트 파일 등
	  
	- Ajax의 장점
	1. 웹 페이지 전체를 다시 로딩하지 않고도, 웹 페이지의 일부분만을 갱신할 수 있습니다.
	2. 웹 페이지가 로드된 후에 서버로 데이터 요청을 보내거나 받을 수 있습니다.
	3. 백그라운드 영역에서 서버로 데이터를 보낼 수 있습니다.

	  

 	
  -->