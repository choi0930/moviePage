package movieVO;

public class Movie {
	private int id; //영화 등록번호
	private String title; //영화 제목
	private String genre; //영화 장르
	private String content;
	private String imageFileName;
	
	public Movie() {
			
		}
	public Movie(int id) {
		this.id=id;
	}
	public Movie(int id, String imageFileName) {
		this.id = id;
		this.imageFileName = imageFileName;
	}
	public Movie(int id, String title, String genre, String content, String imageFileName) {
		this.id = id;
		this.title = title;
		this.genre = genre;
		this.content = content;
		this.imageFileName = imageFileName;
	};
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getGenre() {
			return genre;
		}
		public void setGenre(String genre) {
			this.genre = genre;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getImageFileName() {
			return imageFileName;
		}
		public void setImageFileName(String imageFileName) {
			this.imageFileName = imageFileName;
		}
	}
