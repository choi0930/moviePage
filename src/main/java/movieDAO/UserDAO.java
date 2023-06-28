package movieDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import movieVO.UserVO;

public class UserDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource datafactory;
	
	public UserDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			datafactory = (DataSource) envContext.lookup("jdbc/moviedb");	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	public void addUser(UserVO vo) {
		String id = vo.getId();
		String pwd = vo.getPwd();
		String name = vo.getName();
		String email = vo.getEmail();
		try {
			con = datafactory.getConnection();
			String query = "insert into movieuser (id, pwd, name, email) values(?,?,?,?)";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.executeUpdate();
			close(pstmt, con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void adminUser(UserVO vo) {
		String id = vo.getId();
		String pwd = vo.getPwd();
		String name = vo.getName();
		String email = vo.getEmail();
		try {
			con = datafactory.getConnection();
			String query = "insert into movieadmin (id, pwd, name, email) values(?,?,?,?)";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.executeUpdate();
			close(pstmt, con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public UserVO checkIdPwd(UserVO vo) {
		UserVO userVO = null;
		try {
			con = datafactory.getConnection();
			String id = vo.getId();
			String pwd = vo.getPwd();
			String query = "select * from movieuser where id = ? and pwd=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
				pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				userVO = new UserVO(id, pwd, name, email, joinDate);
			}
			close(rs, pstmt, con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return userVO;
	}
	public UserVO checkAdminIdPwd(UserVO vo) {
		UserVO userVO = null;
		try {
			con = datafactory.getConnection();
			String id = vo.getId();
			String pwd = vo.getPwd();
			String query = "select * from movieadmin where id = ? and pwd=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
				pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				userVO = new UserVO(id, pwd, name, email, joinDate);
			}
			close(rs, pstmt, con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return userVO;
	}
	
	private void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {
			if(rs != null) {
				rs.close();
			}
			close(pstmt,con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void close(PreparedStatement pstmt, Connection con) {
		try {
			if(pstmt!=null) {
				pstmt.close();
			}
			if(con !=null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
