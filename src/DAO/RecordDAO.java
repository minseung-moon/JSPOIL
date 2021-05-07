package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBConn.DBConn;
import DTO.RecordDTO;

public class RecordDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	public RecordDAO() {
		con = DBConn.getConnection();
	}
	
	public ArrayList<RecordDTO> selectAllRecord() {
		ArrayList<RecordDTO> dtos = new ArrayList<RecordDTO>();
		
		try {
			sql = "select m.m_number, m.name, m.payment, m.membership, o.olikind, r.r_liter, case when(m.membership = 1) then o.price * r.r_liter * 0.9 else o.price * r.r_liter end from record r inner join member m on r.m_number = m.m_number inner join oil o on o.o_number = r.o_number";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RecordDTO dto = new RecordDTO();
				dto.setM_number(rs.getString(1));
				dto.setM_name(rs.getString(2));
				dto.setM_payment(rs.getString(3).equals("1")?"현금":"카드");
				dto.setM_membership(rs.getString(4).equals("1")?"회원":"비회원");
				dto.setO_name(rs.getString(5));
				dto.setR_liter(rs.getString(6));
				dto.setTotalPay(rs.getString(7));
				dtos.add(dto);
			}
		}catch(SQLException e) {
			System.out.println("select record error");
		}
		
		return dtos;
	}
	
	public boolean insertRecord(RecordDTO dto) {
		boolean check = false;
		try {
			//insert into record values(1, 1, '21.04.01', 30);
			sql = "insert into record values(?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			System.out.println(dto.getM_number());
			System.out.println(dto.getO_number());
			System.out.println(dto.getR_date());
			System.out.println(dto.getR_liter());
			
			check = pstmt.executeUpdate()==1?true:false;
		}catch(SQLException e){
			System.out.println("insert record error");
		}
		
		return check;
	}
	
	public ArrayList<RecordDTO> selectRecord() {
		ArrayList<RecordDTO> dtos = new ArrayList<RecordDTO>();
		
		try {
			sql = "select m.m_number, m.name, m.payment, m.membership, o.olikind, r.r_liter, case when(m.membership = 1) then o.price * r.r_liter * 0.9 else o.price * r.r_liter end from record r inner join member m on r.m_number = m.m_number inner join oil o on o.o_number = r.o_number where m.membership = 2 and m.jumin < (select jumin from member where name='예준일') order by m.m_number asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RecordDTO dto = new RecordDTO();
				dto.setM_number(rs.getString(1));
				dto.setM_name(rs.getString(2));
				dto.setM_payment(rs.getString(3).equals("1")?"현금":"카드");
				dto.setM_membership(rs.getString(4).equals("1")?"회원":"비회원");
				dto.setO_name(rs.getString(5));
				dto.setR_liter(rs.getString(6));
				dto.setTotalPay(rs.getString(7));
				dtos.add(dto);
			}
		}catch(SQLException e) {
			System.out.println("select record error");
		}
		
		return dtos;
	}
	
	public ArrayList<RecordDTO> selectDateRecord() {
		ArrayList<RecordDTO> dtos = new ArrayList<RecordDTO>();
		
		try {
			sql = "select r.r_date, sum(o.price*r.r_liter) from record r inner join oil o on r.o_number = o.o_number group by r.r_date order by r.r_date";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RecordDTO dto = new RecordDTO();
				dto.setR_date(rs.getString(1).substring(0,10));
				dto.setTotalPay(rs.getString(2));
				dtos.add(dto);
			}
		}catch(SQLException e) {
			System.out.println("select record error");
		}
		
		return dtos;
	}
}
