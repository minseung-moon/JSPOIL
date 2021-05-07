<%@page import="DTO.MemberDTO"%>
<%@page import="DAO.MemberDAO"%>
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
	<%
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> dtos = dao.selectAllMember();
	%>
	<div id="main">
		<h2>게시물 목록</h2>
		<p>총 <%=dtos.size() %>명의 회원이 있습니다.</p>
		
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
					<th>카드번호</th>
					<th>회원여부</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(MemberDTO dto : dtos) {
				%>
				<tr>
					<td><a href="showMember.jsp?m_number=<%=dto.getM_number() %>"><%=dto.getM_number() %></a></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getJumin() %></td>
					<td><%=dto.getGender() %></td>
					<td><%=dto.getAge() %></td>
					<td><%=dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3() %></td>
					<td><%=dto.getPayment() %></td>
					<td><%=dto.getCard_number() %></td>
					<td><%=dto.getMembership() %></td>
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