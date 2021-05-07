<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DAO.MemberDAO"%>
<%@page import="DTO.MemberDTO"%>
<%
 // insert into member values(memberSEQ.nextval, '강서현', '650204-2111111', '010', '1111', '1111', '1', '0000000000001111', '2')
 	MemberDTO dto = new MemberDTO();
	MemberDAO dao = new MemberDAO();
	request.setCharacterEncoding("UTF-8");
	
	dto.setName(request.getParameter("name"));
	dto.setJumin(request.getParameter("jumin"));
	dto.setTel1(request.getParameter("tel1"));
	dto.setTel2(request.getParameter("tel2"));
	dto.setTel3(request.getParameter("tel3"));
	dto.setPayment(request.getParameter("payment"));
	dto.setCard_number(request.getParameter("card_number1")+request.getParameter("card_number2")+request.getParameter("card_number3")+request.getParameter("card_number4"));
	dto.setMembership(request.getParameter("membership"));
	
	if(dao.insertMember(dto))System.out.println("success insert");
	else System.out.println("fail insert");
	
	response.sendRedirect("selectMember.jsp");
%>