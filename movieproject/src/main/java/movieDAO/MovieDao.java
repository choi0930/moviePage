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

import movieVO.Movie;
public class MovieDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public MovieDao() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/moviedb");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public List<Movie> printAllMovies() {
		List<Movie> movieslist  = new ArrayList();
		try {
			conn = dataFactory.getConnection();
			String sql = "SELECT * FROM movie ORDER BY id DESC";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String genre = rs.getString("genre");
				String content = rs.getString("content");
				String imageFileName = rs.getString("imageFileName");
				Movie movie = new Movie();
				movie.setId(id);
				movie.setTitle(title);
				movie.setGenre(genre);
				movie.setContent(content);
				movie.setImageFileName(imageFileName);
				System.out.println(rs.getInt("id"));
				movieslist.add(movie);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return movieslist;
	} // end printAllMovies
	
	
	public Movie findByMovieId(int _movie) {
		Movie movie = new Movie();
		try {
			conn = dataFactory.getConnection();
			String sql = "SELECT id, title, genre FROM movie WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, _movie);
			ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					movie.setId(rs.getInt("id"));
					movie.setTitle(rs.getString("title"));
					movie.setGenre(rs.getString("genre"));
				}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return movie;
	}//end findByMovield
	
	public void deleteMovie(int _movie) {
		try {
			conn = dataFactory.getConnection();
			String sql = "DELETE FROM movie WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, _movie);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}// end deleteMovie
	
	public int save( Movie movie) {
		System.out.println(movie.getTitle());
		int _id = (int)(Math.random() * 100000)+1;
		try {
			conn = dataFactory.getConnection();
			String sql = "INSERT INTO movie  VALUES (?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, _id);
			pstmt.setString(2, movie.getTitle());
			pstmt.setString(3, movie.getGenre());
			pstmt.setString(4, movie.getContent());
			pstmt.setString(5, movie.getImageFileName());
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return _id;
	}//end save
	
	public Movie findImageName(int id) {
		Movie vo = null;
		try {
			conn = dataFactory.getConnection();
			String query = "select id, imageFileName from movie where id=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
			int _id = rs.getInt("id");
			String imageFileName = rs.getString("imageFileName");
			vo = new Movie(_id,imageFileName);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
}// end MoviesDao
