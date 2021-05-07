<%@page import="DTO.MemberDTO"%>
<%@page import="DAO.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	body #main table, body #main table th, body #main table td {
		border: none;
		text-align: left;
	}
	body #main table {
		margin : 10px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
		request.setCharacterEncoding("UTF-8");
		String m_number = request.getParameter("m_number");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.selectMember(m_number);
	%>
	<div id="main">
		<h2>회원정보 상세 조회</h2>
		
		<table>
			<tr>
				<td>회원 번호 : </td>
				<td><%=dto.getM_number() %></td>
			</tr>
			<tr>
				<td>회원 성명 : </td>
				<td><%=dto.getName() %></td>
			</tr>
			<tr>
				<td>주민번호 : </td>
				<td><%=dto.getJumin() %></td>
			</tr>
			<tr>
				<td>전화번호 : </td>
				<td><%=dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3() %></td>
			</tr>
			<tr>
				<td>결제 수단 : </td>
				<td><%=dto.getPayment() %></td>
			</tr>
			<tr>
				<td>카드번호 : </td>
				<td><%=dto.getCard_number() %></td>
			</tr>
			<tr>
				<td>회원 여부 : </td>
				<td><%=dto.getMembership() %></td>
			</tr>
		</table>
		<div class="btn-area">
			<button>수정</button>
			<button onclick="javascript:history.back()">뒤로가기</button>
			<button onclick="javascript:confirm('정말로 삭제하시겠습니까?')?location.href='deleteMemberProc.jsp?m_number=<%=dto.getM_number()%>':alert('삭제취소하셨습니다')">삭제</button>
		</div>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>