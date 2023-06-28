package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import movieDAO.MovieDao;
import movieVO.Movie;
import movieVO.UserVO;


@WebServlet("/movieServlet/*")
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String ARTICLE_IMAGE_REPO = "C:\\board\\movie_image";
	MovieDao dao;
	Movie vo;
	public void init(ServletConfig config) throws ServletException {
		dao = new MovieDao();
		vo = new Movie();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String action = request.getPathInfo();
		String nextPage="";
		try {
		if(action.equals("/adminListMoives.do")) { //어드민 메인페이지, 영화목록
			List<Movie> moviesList = dao.printAllMovies();
			request.setAttribute("moviesList", moviesList);
			nextPage="/movie/adminPage.jsp";
			
		}else if(action.equals("/listMovie.do")) { //예약페이지
			List<Movie> moviesList = dao.printAllMovies();
			request.setAttribute("moviesList", moviesList);
			nextPage="/movie/mainPage.jsp";
		}
		else if(action.equals("/listMoives.do")) { //유저 메인페이지
			String id = request.getParameter("id"); 
			
			//if(id.length()!= 0) {
			List<Movie> moviesList = dao.printAllMovies();
			request.setAttribute("moviesList", moviesList);
			//nextPage="/movie/mainPage.jsp";
			nextPage="/mainPage2.jsp";
			/*}else {
				PrintWriter out = response.getWriter();
				out.print("<script>"
						+ "alert('로그인 후 이용해주세요');"
						+ "location.href='"
						+ request.getContextPath()
						+ "/movie/login.jsp'"
						+ "</script>");
			return;
			}*/
			
		}else if(action.equals("/addMovie.do")) {
				Map<String, String> movieMap = upload(request, response);
				String title = movieMap.get("title");
				String genre = movieMap.get("genre");
				String content = movieMap.get("content");
				String imageFileName = movieMap.get("imageFileName");
				
				vo.setTitle(title);
				vo.setGenre(genre);
				vo.setContent(content);
				vo.setImageFileName(imageFileName);
				
				int id = dao.save(vo);
				
				request.setAttribute("id", id);
				request.setAttribute("title", title);
				if(imageFileName != null && imageFileName.length() != 0) {
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\"+imageFileName);
					File desDir = new File(ARTICLE_IMAGE_REPO + "\\" + id);
					desDir.mkdirs();
					FileUtils.moveFileToDirectory(srcFile, desDir, true);
				}
				nextPage="/movie/adminAddMoviePage.jsp";
		}else if(action.equals("/delMovie.do")) {
			String id = request.getParameter("id");
			String imageFileName= request.getParameter("imageFileName");
			int _id = Integer.parseInt(id);
			dao.deleteMovie(_id);
			if(imageFileName != null && imageFileName.length() != 0) {
				File imgDir = new File(ARTICLE_IMAGE_REPO+"//"+id);
				if(imgDir.exists()) {
					FileUtils.deleteDirectory(imgDir);
				}
			}
			PrintWriter out = response.getWriter();
			out.print("<script>"
					+ "alert('영화 삭제 완료');"
					+ "location.href='"
					+ request.getContextPath()
					+ "/movieServlet/adminListMoives.do'"
					+ "</script>");
		return;
			//nextPage="/movieServlet/adminListMoives.do";
		}else if (action.equals("/findByMovieId.do")){
			String id = request.getParameter("id");
			int _id = Integer.parseInt(id);
			vo = dao.findByMovieId(_id);
			String title = vo.getTitle();
			request.setAttribute("title", title);
			nextPage="/reservation/findById.do";
		}else {
			List<Movie> moviesList = dao.printAllMovies();
			request.setAttribute("moviesList", moviesList);
			nextPage="/mainPage2.jsp";
		}
	RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
	dispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response){
		Map<String, String> movieMap = new HashMap<String, String>();
		String encoding = "utf-8";
		File currentDirPath = new File(ARTICLE_IMAGE_REPO);
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(1024 * 1024);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List items = upload.parseRequest(request);
			for(int i = 0; i<items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);

				if(fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName()+"="+fileItem.getString(encoding));
					movieMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
				} else {
					System.out.println("파일이름 :"+fileItem.getName());
					System.out.println("파일크기: "+fileItem.getSize()+"bytes");
					
					if(fileItem.getSize()>0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if(idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
						String fileName = fileItem.getName().substring(idx+1);
						movieMap.put(fileItem.getFieldName(), fileName);
						File uploadFile = new File(currentDirPath+"\\temp\\"+fileName);
						fileItem.write(uploadFile);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return movieMap;
	}
}
