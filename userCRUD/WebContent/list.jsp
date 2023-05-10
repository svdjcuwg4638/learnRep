<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>

</style>


<jsp:useBean id="dao" class="userCRUD.UserDAO"/>

<form method="POST" action="list.jsp">
	<p>
		<input type="text" name="search" placeholder="검색어 입력">
		<input type="submit" value="검색">
	</p>
</form>

<table>

	<thead>
		<tr>
			<td>IDX</td>
			<td>NAME</td>
			<td>PH_NUMBER</td>
			<td>BIRTH</td>
			<td>GENDER</td>
			<td>REG</td>
		</tr>
	</thead>
	
	<tbody>
	<%
		String method = request.getMethod();
		if(method.equals("GET")){
	%>
		<c:forEach var="user" items="${dao.getList() }">
			<tr>
				<td>${user.getIdx()}</td>
				<td><a href="detail.jsp?idx=${user.getIdx()}">${user.getName() }</a></td>
				<td>${user.getPh_num() }</td>
				<td>${user.getBirth() }</td>
				<td>${user.getGender() }</td>
				<td>${user.getReg() }</td>
				<td><a href="modify.jsp?idx=${user.getIdx() }"><button>수정</button></a>
				<td><a href="delete.jsp?idx=${user.getIdx() }"><button>삭제</button></a>
			</tr>
		</c:forEach>
	<%
		}else if (method.equals("POST")){
	%>
	
		<c:forEach var="user" items="${dao.getSearchList(param.search) }">
			<tr>
				<td>${user.getIdx()}</td>
				<td><a href="detail.jsp?idx=${user.getIdx()}">${user.getName() }</a></td>
				<td>${user.getPh_num() }</td>
				<td>${user.getBirth() }</td>
				<td>${user.getGender() }</td>
				<td>${user.getReg() }</td>
				<td><a href="modify.jsp?idx=${user.getIdx() }"><button>수정</button></a>
				<td><a href="delete.jsp?idx=${user.getIdx() }"><button>삭제</button></a>
			</tr>
		</c:forEach>
	
	<%
		}
	%>
	</tbody>

</table>

</body>
</html>