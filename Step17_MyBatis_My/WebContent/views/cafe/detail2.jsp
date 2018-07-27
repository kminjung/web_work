<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/detail.jsp</title>
<style>
	.content{
		width: 766px;
		border: 1px solid #888888;
		box-shadow: 10px 10px 5px #888888;
	}
	.content img{
		max-width: 100%;
	}
	/* 댓글에 댓글을 다는 폼은 일단 숨겨놓기*/
	.comment form{
		display: none;
	}
	.comment{
		position: relative;
	}	
	/* 댓글의 댓글 이미지 배치 */
	.comment .reply_icon{
		width: 8px;
		height: 8px;
		position: absolute;
		top: 0px;
		left: -8px;
	}
	.muted{
		color: #888;
	}
</style>
</head>
<body>
<div>
	<c:if test="${dto.prevNum ne 0}">
		<a href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${keyword}">이전글</a> <!-- 0이 아닌경우 이전글 -->
	</c:if>
	<c:if test="${dto.nextNum ne 0}">
		<a href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${keyword}">다음글</a> <!-- 0이 아닌경우 다음글 -->
	</c:if>
</div>
<h3>글 자세히 보기 페이지</h3>
<c:if test="${sessionScope.id eq dto.writer }"><!-- session 에 있는 id 와 작성자가 같으면 -->
	<a href="private/updateform.do?num=${dto.num }">수정</a>
	<a href="javascript:deleteConfirm()">삭제</a><!-- 수정,삭제를 보여준다. -->
	<script>
		function deleteConfirm(){
			var isDelete=confirm("글을 삭제 하시겠습니까?");
			if(isDelete){//확인을 누르면 실행순서가 여기로 들어온다
				location.href="private/delete.do?num=${dto.num}";//num 이라는 파라미터로 해당 글 번호를 가져오는것
			}
		}
	</script>
</c:if>
<table>
	<tr>
		<th>글번호</th>
		<td>${dto.num }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${dto.writer }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${dto.title }</td>
	</tr>
</table>
<div class="content">${dto.content }</div>
<a href="list.do">목록 보기</a>
<!-- 댓글에 관련된 UI --> <!-- 댓글 0727-->
<div class="comments">
	<c:forEach var="tmp" items="${commentList }">
		<div class="comment" <c:if test="${tmp.num ne tmp.comment_group }">style="margin-left:50px;"</c:if> ><!-- num 과 comment_group 가 다르면 들여쓰기-->
			<c:if test="${tmp.num ne tmp.comment_group }">
				<img class="reply_icon" src="${pageContext.request.contextPath }/resources/images/re.gif"/>
			</c:if>
			
			<img src="${pageContext.request.contextPath }/resources/images/user_image.gif"/>
			<span>${tmp.writer }</span>
			<span>${tmp.regdate }</span>
			<a href="javascript:" class="reply_link">답글</a> |
			<a href="">신고</a>
			
			<c:if test="${tmp.num ne tmp.comment_group }"> 
				<br />
				<i class="muted">${tmp.target_id }</i>
			</c:if>
			
			<pre>${tmp.content }</pre>
			<form action="comment_insert.do" method="post"><!-- 숨겨져 있다가 반복문 돌면서 답글을 눌렀을 때 폼이 나오게 -->	
				<!-- 덧글 작성자 -->
				<input type="hidden" name="writer" value="${id }"/>
				<!-- 덧글 그룹 -->
				<input type="hidden" name="ref_group" value="${dto.num }" />
				<!-- 덧글 대상 -->
				<input type="hidden" name="target_id" value="${tmp.writer }" />
				<input type="hidden" name="comment_group" value="${tmp.comment_group }" /><!-- 대댓글은 comment_group 을 가지고 가게 되어 있다. -->
				<textarea name="content"></textarea>
				<button type="submit">등록</button>
			</form>			
		</div>
	</c:forEach>
	<!-- 원글에 댓글을 작성할수 있는 폼 -->
	<div class="comment_form">
		<form action="comment_insert.do" method="post">
			<input type="hidden" name="writer" 
				value="${id }" />
			<input type="hidden" name="ref_group" 
				value="${dto.num }"/>
			<input type="hidden" name="target_id" 
				value="${dto.writer }"/>
			<textarea name="content"></textarea>
			<button type="submit">등록</button>
		</form>
	</div>
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	//로그인 했는지 여부
	var isLogin=${isLogin}; //로그인 여부에 따라 true,false 가 찍힌다.
	
	//댓글 전송 이벤트가 일어 났을때 실행할 함수 등록 ****
	$(".comment_form > form, .comment form").submit(function(){
		if(!isLogin){//로그인 하지 않았으면
			var isGoLogin=confirm("로그인이 필요 합니다.");
			if(isGoLogin){
				//로그인 페이지로 이동하기
				location.href="${pageContext.request.contextPath}"+
					"/users/loginform.do"+
					"?url=${pageContext.request.contextPath}"+
					"/cafe/detail.do?num=${dto.num}";
			}
			return false;//폼 전송 막기 
		}
	});
	
	// 답글 링크를 눌렀을 때 실행할 함수 등록 
	$(".comment .reply_link").click(function(){
		$(this)
		.parent()
		.find("form")
		.slideToggle(200);
	});
</script>

</body>
</html>