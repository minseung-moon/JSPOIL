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
		<form action="insertMemberProc.jsp" method="post">
			<fieldset>
				<legend>회원정보추가</legend>

				<table>
					<tr>
						<td><label for="name">회원 성명 :</label></td>
						<td><input type="text" name="name" id="name" maxlength="10"></td>
					</tr>
					<tr>
						<td><label for="jumin">주민번호 :</label></td>
						<td><input type="text" name="jumin" id="jumin" maxlength="15"></td>
					</tr>
					<tr>
						<td><label for="tel1">전화번호 :</label></td>
						<td>
							<input type="text" name="tel1" id="tel1" maxlength="3" size="3"> -
							<input type="text" name="tel2" id="tel2" maxlength="4" size="4"> - 
							<input type="text" name="tel3" id="tel3" maxlength="4" size="4"> 
						</td>
					</tr>
					<tr>
						<td><label for="payment">결제방법 :</label></td>
						<td>
							<input type="radio" name="payment" id="payment" value="1" checked="checked"> 카드 |
							<input type="radio" name="payment" value="2"> 현금
						</td>
					</tr>
					<tr>
						<td><label for="card_number1">카드번호 :</label></td>
						<td>
							<input type="text" name="card_number1" id="card_number1" maxlength="4" size="4"> -
							<input type="text" name="card_number2" id="card_number2" maxlength="4" size="4"> - 
							<input type="text" name="card_number3" id="card_number3" maxlength="4" size="4"> -
							<input type="text" name="card_number4" id="card_number4" maxlength="4" size="4"> 
						</td>
					</tr>
					<tr>
						<td><label for="membership">회원 여부 :</label></td>
						<td>
							<input type="radio" name="membership" id="membership" value="1" checked="checked"> 회원 |
							<input type="radio" name="membership" value="2"> 비회원
						</td>
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