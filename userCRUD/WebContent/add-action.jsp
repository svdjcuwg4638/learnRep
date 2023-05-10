<%@page import="userCRUD.UserDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="userCRUD.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%
	UserDAO dao = new UserDAO();
	UserDTO dto = new UserDTO();
	dto.setBirth(Date.valueOf(request.getParameter("birth")));
	dto.setGender(request.getParameter("gender"));
	dto.setName(request.getParameter("name"));
	dto.setPh_num(request.getParameter("ph_num"));
	
	int row = dao.add(dto);
	request.setAttribute("row", row);
%>
<p>${row != 0 ? '추가성공' : '추가실패' }</p>
<p><a href="list.jsp"><button>돌아가기</button></a>



</body>
</html>