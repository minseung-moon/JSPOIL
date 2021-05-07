<%@page import="DAO.RecordDAO"%>
<%@page import="DTO.RecordDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
 	RecordDTO dto = new RecordDTO();
	RecordDAO dao = new RecordDAO();
	request.setCharacterEncoding("UTF-8");
	
	dto.setM_number(request.getParameter("m_number"));
	dto.setO_number(request.getParameter("o_number"));
	dto.setR_date(request.getParameter("r_date"));
	dto.setR_liter(request.getParameter("r_liter"));
	
	if(dao.insertRecord(dto))System.out.println("success insert");
	else System.out.println("fail insert");
	
	response.sendRedirect("selectMember.jsp");
%>