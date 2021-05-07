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
					<th>일</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
			<%
				int total = 0;
				RecordDAO dao = new RecordDAO();
				ArrayList<RecordDTO> dtos = dao.selectDateRecord();
				System.out.println(dtos.size());
				for(RecordDTO dto : dtos){
					total += Integer.parseInt(dto.getTotalPay());
					
			%>
				<tr>
					<td><%=dto.getR_date() %></td>
					<td><%=dto.getTotalPay() %></td>
				</tr>
			<%
				}
			%>
			<tr>
				<td>총합</td>
				<td><%=total %></td>
			</tr>
			</tbody>
		</table>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>