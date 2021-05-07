<%@page import="DTO.OilDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.OilDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<jsp:include page="header.jsp" />

	<div id="main">
		<h2>유종 조회</h2>
		
		<table>
			<thead>
				<tr>
					<th>유종번호</th>
					<th>종류</th>
					<th>단가</th>
				</tr>
			</thead>
			<tbody>
				<%
					OilDAO dao = new OilDAO();
					ArrayList<OilDTO> dtos = dao.selectAllOil();
					for(OilDTO dto : dtos) {
				%>
				<tr>
					<td><%=dto.getO_number() %></td>
					<td><%=dto.getOlikind() %></td>
					<td><%=dto.getPrice() %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>