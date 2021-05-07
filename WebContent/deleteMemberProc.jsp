<%@page import="DAO.MemberDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
	String m_number = request.getParameter("m_number");
	MemberDAO dao = new MemberDAO();
	
	if(dao.deleteMember(m_number)) System.out.println("success delete");
	else System.out.println("fail delete");
	
	response.sendRedirect("selectMember.jsp");
%>