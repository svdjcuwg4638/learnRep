<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form method="POST" action="add-action.jsp">
	<p><input type="text" name="name" required placeholder="이름"></p>
	<p><input type="text" name="ph_num" required placeholder="전화번호"></p>
	<p><input type="date" name="birth" required></p>
	<p>
		<select name="gender">
			<option>남</option>
			<option>여</option>
		</select>
	</p>
	<p><input type="submit" value="추가">
</form>

</body>
</html>