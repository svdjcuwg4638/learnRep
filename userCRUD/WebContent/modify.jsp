<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dao" class="userCRUD.UserDAO"/>
<c:set var="dto" value="${dao.getOne(param.idx) }"/>

<form method="POST" action="modify-action.jsp">
	<input type="hidden" name="idx" value="${param.idx }">
	<p><input type="text" name="name" value="${dto.getName() }" required placeholder="이름"></p>
	<p><input type="text" name="ph_num" value="${dto.getPh_num() }" required placeholder="전화번호"></p>
	<p><input type="date" name="birth" value="${dto.getBirth() }" required></p>
	<p>
		<select name="gender">
			<option ${dto.getGender() == '남'? 'selected' : '' }>남</option>
			<option ${dto.getGender() == '여'? 'selected' : '' }>여</option>
		</select>
	</p>
	<p><input type="submit" value="수정">
</form>

</body>
</html>