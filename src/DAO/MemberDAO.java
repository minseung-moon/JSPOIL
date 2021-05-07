package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import DBConn.DBConn;
import DTO.MemberDTO;

public class MemberDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	public MemberDAO() {
		con = DBConn.getConnection();
	}
	
	public ArrayList<MemberDTO> selectAllMember() {
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
		DateFormat format = new SimpleDateFormat("yyyy");
		try {
			sql = "select * from member order by m_number asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setM_number(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setJumin(rs.getString(3));
				dto.setTel1(rs.getString(4));
				dto.setTel2(rs.getString(5));
				dto.setTel3(rs.getString(6));
				dto.setPayment(rs.getString(7).equals("1")?"카드":"현금");
				String card_number = "";
				if(rs.getString(8) == null || rs.getString(8).length() < 16) card_number = "";
				else card_number = rs.getString(8).substring(0,4)+"-"+rs.getString(8).substring(4,8)+"-"+rs.getString(8).substring(8,12)+"-"+rs.getString(8).substring(12);
				dto.setCard_number(card_number);
				dto.setMembership(rs.getString(9).equals("1")?"회원":"비회원");
				dto.setGender(dto.getJumin().substring(7, 8).equals("1") || dto.getJumin().substring(7, 8).equals("3") ? "남성" :"여성" );
				int ages = Integer.parseInt(format.format(new Date())) - Integer.parseInt("19"+dto.getJumin().substring(0, 2));
				String age = Integer.toString(ages);
				dto.setAge(age);
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("select member error");
		}
		
		return dtos;
	}
	
	public MemberDTO selectMember(String m_number) {
		MemberDTO dto = new MemberDTO();
		try {
			sql = "select * from member where m_number = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_number);
			rs = pstmt.executeQuery();
			
			rs.next();
			dto.setM_number(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setJumin(rs.getString(3));
			dto.setTel1(rs.getString(4));
			dto.setTel2(rs.getString(5));
			dto.setTel3(rs.getString(6));
			dto.setPayment(rs.getString(7));
			String card_number = "";
			if(rs.getString(8) == null || rs.getString(8).length() < 16) card_number = "";
			else card_number = rs.getString(8).substring(0,4)+"-"+rs.getString(8).substring(4,8)+"-"+rs.getString(8).substring(8,12)+"-"+rs.getString(8).substring(12);
			dto.setCard_number(card_number);
			dto.setMembership(rs.getString(9));
		}catch(SQLException e){
			System.out.println("select member error");
		}
		
		return dto;
	}
	
	public boolean deleteMember(String m_number) {
		boolean check = false;
		try {
			sql = "delete from member where m_number = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_number);
			check = pstmt.executeUpdate()==1?true:false;
		}catch(SQLException e){
			System.out.println("delete member error");
		}
		
		return check;
	}
	
	public boolean insertMember(MemberDTO dto) {
		boolean check = false;
		try {
			//insert into member values(memberSEQ.nextval, '강서현', '650204-2111111', '010', '1111', '1111', '1', '0000000000001111', '2')
			sql = "insert into member values(memberSEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getJumin());
			pstmt.setString(3, dto.getTel1());
			pstmt.setString(4, dto.getTel2());
			pstmt.setString(5, dto.getTel3());
			pstmt.setString(6, dto.getPayment());
			pstmt.setString(7, dto.getCard_number());
			pstmt.setString(8, dto.getMembership());
			check = pstmt.executeUpdate()==1?true:false;
		}catch(SQLException e){
			System.out.println("insert member error");
		}
		
		return check;
	}
	
//	public static void main(String[] args) {
//		DateFormat format = new SimpleDateFormat("yyyy");
//		System.out.println();
//	}
}
