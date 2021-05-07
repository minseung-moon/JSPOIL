<%@page import="DTO.RecordDTO"%>
<%@page import="DAO.RecordDAO"%>
<%@page import="java.util.ArrayList"%>
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
		<table>
			<thead>
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>주민번호</th>
					<th>성별</th>
					<th>나이</th>
					<th>전화번호</th>
					<th>결제수단</th>
				</tr>
			</thead>
			<tbody>
			<%
				RecordDAO dao = new RecordDAO();
				ArrayList<RecordDTO> dtos = dao.selectRecord();
				System.out.println(dtos.size());
				for(RecordDTO dto : dtos){
					
			%>
				<tr>
					<td><%=dto.getM_number() %></td>
					<td><%=dto.getM_name() %></td>
					<td><%=dto.getM_payment() %></td>
					<td><%=dto.getM_membership() %></td>
					<td><%=dto.getO_name() %></td>
					<td><%=dto.getR_liter() %>L</td>
					<td><%=dto.getTotalPay() %>원</td>
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