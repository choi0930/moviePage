package movieVO;

public class Reservation {
	private int resid; //예매발급번호
	private String seat; //고객 좌석명
	private String moviename; //영화명
	private String username;
	private int movieid; //영화 아이디
	
	public Reservation() {
		
	}	
	public Reservation(String moviename, String username, int movieid) {
		this.moviename = moviename;
		this.username = username;
		this.movieid = movieid;
	}
	public Reservation(int resid, String seat, String moviename, String username, int movieid) {
		this.resid = resid;
		this.seat = seat;
		this.moviename = moviename;
		this.username = username;
		this.movieid = movieid;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getResid() {
		return resid;
	}

	public void setResid(int resid) {
		this.resid = resid;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public String getMoviename() {
		return moviename;
	}

	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}

	public int getMovieid() {
		return movieid;
	}

	public void setMovieid(int movieid) {
		this.movieid = movieid;
	}
	@Override
	public String toString() {
		return "Reservation [resid= "+resid+", seat="+seat+", moviename= "+moviename+", movieid= "+movieid+"]";
	}
}
