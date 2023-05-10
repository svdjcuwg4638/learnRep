<%@page import="userCRUD.UserDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="userCRUD.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%
	UserDAO dao = new UserDAO();
	UserDTO dto = new UserDTO();
	dto.setIdx(Integer.parseInt(request.getParameter("idx")));
	dto.setName(request.getParameter("name"));
	dto.setPh_num(request.getParameter("ph_num"));
	dto.setBirth(Date.valueOf(request.getParameter("birth")));
	dto.setGender(request.getParameter("gender"));
	int row =dao.modify(dto);
	request.setAttribute("row", row);
%>

<p>${row != 0 ? '수정성공' : '수정실패' }</p>
<p><a href="list.jsp"><button>돌아가기</button></a>

</body>
</html>