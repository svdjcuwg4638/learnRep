package userCRUD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private final String url="jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private final String user ="c##itbank";
	private final String password ="it";
	
	 public UserDAO() {
		 try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	 public void close() {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	 }
	 
	 public ArrayList<UserDTO> getList(){
		 String sql = "select * from task2 order by idx";
		 ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		 UserDTO dto ;
		 try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new UserDTO();
				dto.setBirth(rs.getDate("birth"));
				dto.setGender(rs.getString("gender"));
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPh_num(rs.getString("ph_num"));
				dto.setReg(rs.getDate("reg"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		 return list;
	 }
	 
	 public int add(UserDTO dto) {
		 int row = 0;
		 String sql = "insert into task2(name,ph_num,gender,birth) values(?,?,?,?)";
		 
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPh_num());
			pstmt.setString(3, dto.getGender());
			pstmt.setDate(4, dto.getBirth());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {close();}
		 return row;
	 }
	
	 public UserDTO getOne(String idx) {
		 String sql = "select * from task2 where idx="+idx;
		 UserDTO dto = new UserDTO();
		 try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setBirth(rs.getDate("birth"));
				dto.setGender(rs.getString("gender"));
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPh_num(rs.getString("ph_num"));
				dto.setReg(rs.getDate("reg"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {close();}
		 return dto;
	 }
	 
	 public int modify(UserDTO dto) {
		 String sql = "update task2 set name=?, ph_num=?, birth=?,gender=? where idx=?";
		int row = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPh_num());
			pstmt.setDate(3, dto.getBirth());
			pstmt.setString(4, dto.getGender());
			pstmt.setInt(5, dto.getIdx());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {close();}
		
		return row;
	 }
	 public int delete(String idx) {
		 String sql = "delete from task2 where idx="+idx;
		 int row = 0;
		 
		 try {
			pstmt= conn.prepareStatement(sql);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {close();}
		 
		 return row;
		 
	 }
	 
	 public ArrayList<UserDTO> getSearchList(String search){
		 ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		 UserDTO dto;
		 String sql ="select * from task2 where name like '%"+search+"%'";
		 
		 try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new UserDTO();
				dto.setBirth(rs.getDate("birth"));
				dto.setGender(rs.getString("gender"));
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPh_num(rs.getString("ph_num"));
				dto.setReg(rs.getDate("reg"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		 
		 return list;
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
}
