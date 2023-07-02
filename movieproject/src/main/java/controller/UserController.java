package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import movieVO.*;
import movieDAO.*;

@WebServlet("/movieUser/*")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserDAO userDAO;
	UserVO userVO;
	HttpSession session;
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		userDAO = new UserDAO();
		userVO = new UserVO();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String action = request.getPathInfo();
		String nextPage = "";
		PrintWriter out = response.getWriter();
		System.out.println(action);
		
		if(action.equals("/addUser.do")) { //회원가입
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			UserVO vo = new UserVO(id, pwd, name, email);
			userDAO.addUser(vo);
			nextPage="/movie/login.jsp";
			
		}else if(action.equals("/addAdmin.do")){
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			UserVO vo = new UserVO(id, pwd, name, email);
			userDAO.adminUser(vo);
			nextPage="/movie/adminLogin.jsp";
		}else if(action.equals("/login.do")) { //로그인 페이지로 이동
			nextPage="/movie/login.jsp";
			
		}else if(action.equals("/addUserForm.do")) {// 회원가입 페이지로 이동
			nextPage="/movie/addUserForm.jsp";
			
		}else if(action.equals("/adminForm.do")) {// 회원가입 페이지로 이동
			nextPage="/movie/addAdminForm.jsp";
			
		} else if(action.equals("/logOut.do")) { //로그 아웃
			session.invalidate();
			nextPage="/movie/login.jsp";
			
		}else if(action.equals("/adminLoginPage.do")) {// 어드민로그인 페이지 이동
			nextPage="/movie/adminLogin.jsp";
		}
		else if(action.equals("/adminLogin.do")) {//어드민 로그인
			
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			userVO = new UserVO(id, pwd);
			userVO = userDAO.checkAdminIdPwd(userVO);
			if(userVO != null) {
				session = request.getSession();
				session.setAttribute("userVO", userVO);
				nextPage="/movieServlet/adminListMoives.do";	
			}else { //로그인 실패시
				out.print("<script>"
						+ "alert('아이디 혹은 비밀번호가 틀렸습니다');"
						+ "location.href='"
						+ request.getContextPath()
						+ "/movie/adminLogin.jsp';"
						+ "</script>");
			return;
		}
		} else if(action.equals("/adminAddMoviePage.do")) {
			nextPage="/movie/adminAddMoviePage.jsp";
		} else if(action.equals("/CheckId.do")) { //로그인
			String id=request.getParameter("id");
			String pwd = request.getParameter("pwd");
			userVO.setId(id);
			userVO.setPwd(pwd);
			UserVO vo = userDAO.checkIdPwd(userVO);
			if(vo != null) {
				session = request.getSession();
				session.setAttribute("userVO", vo);
				nextPage="/movieServlet/listMoives.do";
			}else { //로그인 실패시
				out.print("<script>"
							+ "alert('아이디 혹은 비밀번호가 틀렸습니다');"
							+ "location.href='"
							+ request.getContextPath()
							+ "/movie/login.jsp';"
							+ "</script>");
				return;
			}
		} else if(action.equals("/ticketing.do")) {
			nextPage="/moiveServlet/listMoive.do";
		} else if(action.equals("/checkId.do")) {
			
			String id = (String) request.getParameter("id");
			System.out.println("id="+id);
			boolean overId = userDAO.checkId(id);
			System.out.println(overId);
			if(overId == true) {
				out.print("not_usable");
				System.out.println("not-usable");
			}else {
				System.out.println("usable");
				out.print("usable");
			}
			return;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
