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
	margin: 10px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div id="main">
		<form action="insertRecordProc.jsp" method="post">
			<fieldset>
				<legend>회원정보추가</legend>

				<table>
					<tr>
						<td><label for="m_number">회원 번호 :</label></td>
						<td><input type="text" name="m_number" id="m_number" maxlength="2"></td>
					</tr>
					<tr>
						<td><label for="o_number">유종번호 :</label></td>
						<td><input type="text" name="o_number" id="o_number" maxlength="6"></td>
					</tr>
					<tr>
						<td><label for="r_date">주유날짜 :</label></td>
						<td><input type="text" name="r_date" id="r_date" maxlength="15"></td>
					</tr>
					<tr>
						<td><label for="r_liter">주유리터 :</label></td>
						<td><input type="text" name="r_liter" id="r_liter" maxlength="6"></td>
					</tr>
				</table>
				<button onclick="javascript:history.back()">뒤로가기</button>
				<button type="submit">등록</button>
			</fieldset>
		</form>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>