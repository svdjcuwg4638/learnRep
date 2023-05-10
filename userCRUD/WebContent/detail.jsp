<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
		table *{
		padding:30px;
		text-align:center;
		font-size:30px;
		border: 1px solid #000;
	}
	table{
		border-collapse: collapse;
	}
</style>
<jsp:useBean id="dao" class="userCRUD.UserDAO"/>
<c:set var="user" value="${dao.getOne(param.idx) }"/>

<table>
	<thead>
		<tr>
			<td>회원 번호</td>
			<td>이름</td>
			<td>전화번호</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>가입날짜</td>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<td>${user.getIdx() }</td>
			<td>${user.getName() }</td>
			<td>${user.getPh_num() }</td>
			<td>${user.getBirth() }</td>
			<td>${user.getGender() }</td>
			<td>${user.getReg() }</td>
		</tr>
	</tbody>
</table>

</body>
</html>