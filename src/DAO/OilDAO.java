package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBConn.DBConn;
import DTO.OilDTO;

public class OilDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	public OilDAO() {
		con = DBConn.getConnection();
	}
	
	public ArrayList<OilDTO> selectAllOil() {
		ArrayList<OilDTO> dtos = new ArrayList<OilDTO>();
		
		try {
			sql = "select * from oil";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OilDTO dto = new OilDTO();
				dto.setO_number(rs.getString(1));
				dto.setOlikind(rs.getString(2));
				dto.setPrice(rs.getString(3));
				
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("select all Oil error");
		}
		
		return dtos;
	}
}
