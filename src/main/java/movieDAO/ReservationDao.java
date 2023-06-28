package movieDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import movieVO.Reservation;

public class ReservationDao {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public ReservationDao() {
		try {
			
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/moviedb");
					
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
	}//end ReservationDao
	
	public List<Reservation> findByMovieId(int movieId){
		List<Reservation> reservationlist = new ArrayList();
		Reservation reservation;
		try {
			con = dataFactory.getConnection();
			String sql = "SELECT * FROM reservation WHERE movieid = ? order by seat";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int resid = rs.getInt("resid");
				String seat = rs.getString("seat");
				String moviename = rs.getString("moviename");
				String username = rs.getString("username");
				int movieid = rs.getInt("movieid");
				reservation = new Reservation(resid, seat, moviename, username, movieid);
				reservationlist.add(reservation);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return reservationlist; 
	}//end findById
	
	public List<Reservation> findByResid(int parseInt) {
		Reservation reservation = new Reservation();
		List<Reservation> reservationList = new ArrayList<Reservation>();
		try {
			con= dataFactory.getConnection();
			String sql = "SELECT * FROM reservation WHERE resid = ?";
		    pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, parseInt);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int resId = rs.getInt("resid");
				String seat = rs.getString("seat");
				String movieName = rs.getString("moviename");
				String userName = rs.getString("username");
				int movieId = rs.getInt("movieid");
				System.out.println(movieName);
				reservation = new Reservation(resId, seat, movieName, userName, movieId);
				reservationList.add(reservation);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return reservationList;
	}//end findByResid
	
	public int save(Reservation vo, String[] seats) {
		int _resid = (int)(Math.random()*100000)+1;
		try {
			con=dataFactory.getConnection();
			String sql = "INSERT INTO reservation (resid, seat, moviename, username, movieid) VALUES (?, ?, ?, ?, ?) ";
			pstmt = con.prepareStatement(sql);
			for(int i =0; i<seats.length; i++) {
				pstmt.setInt(1, _resid);
				String _seats = seats[i].substring(0,3);
				pstmt.setString(2, _seats);
				System.out.println(_seats);
				pstmt.setString(3, vo.getMoviename());
				pstmt.setString(4, vo.getUsername());
				pstmt.setInt(5, vo.getMovieid());
				pstmt.executeUpdate();	
			}
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return _resid;
	}//end save

	public boolean cancel(int cancel) {
		boolean result = false;
		try {
			con=dataFactory.getConnection();
			String sql ="DELETE FROM reservation WHERE resid = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cancel);
			int rs = pstmt.executeUpdate();
			if(rs>0) {
				result = true;
			}
			pstmt.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	} //end cancel
	
	public List<Reservation> findByUserId(String id) {
		List<Reservation> reservationList = new ArrayList();
		Reservation vo;
		try {
			con = dataFactory.getConnection();
			String query = "select * from reservation where username=? order by movieid";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int resid = rs.getInt("resid");
				String seat = rs.getString("seat");
				String moviename = rs.getString("moviename");
				String username = rs.getString("username");
				int movieid = rs.getInt("movieid");
				vo = new Reservation(resid, seat, moviename, username, movieid);
				reservationList.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reservationList;
	}
	
	public List<List<Reservation>> findBy(String userId){
		List reservationList = new ArrayList();
		
		Reservation vo = new Reservation(); 
		try {
			con = dataFactory.getConnection();
			String query = "select * from movie";
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				vo.setMovieid(id);
				System.out.println(id);
				reservationList.add(findByMovieIdAndUserId(id,userId));
				System.out.println("findByMovieId"+findByMovieIdAndUserId(id,userId).size());
			}
			System.out.println("reservationList"+reservationList.size());
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reservationList;
	}

	private List<Reservation> findByMovieIdAndUserId(int id,String userId) {
		List<Reservation> resList = new ArrayList<Reservation>();
		Reservation vo = new Reservation();
		try {
			con = dataFactory.getConnection();
			String query="select * from reservation where movieid=? and username=?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.setString(2, userId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int resid = rs.getInt("resid");
				String seat = rs.getString("seat");
				String moviename = rs.getString("moviename");
				String username = rs.getString("username");
				int movieid = rs.getInt("movieid");
				vo = new Reservation(resid, seat, moviename, username, movieid);
				resList.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return resList;
	}
	

}//end class ReservationDao
