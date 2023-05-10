<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dao" class="userCRUD.UserDAO"/>
<p>${dao.delete(param.idx) != 0 ? '삭제성공' : '삭제실패' }</p>
<p><a href="list.jsp"><button>돌아가기</button></a></p>

</body>
</html>