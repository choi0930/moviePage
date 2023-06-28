package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movieVO.*;
import movieDAO.*;

@WebServlet("/rvnController/*")
public class ReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Reservation reservation;
	ReservationDao dao;
	MovieDao movieDao;
	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		reservation = new Reservation();
		dao = new ReservationDao();
		movieDao = new MovieDao();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String action = request.getPathInfo();
		String nextPage="";
		
		if(action.equals("/findByResid.do")) { //예매 확인
			String _resid=request.getParameter("resid");
			int resid = Integer.parseInt(_resid);
			List<Reservation>reservationList = dao.findByResid(resid);	
			
			if(reservationList.size()>0) {
				Reservation reservation = reservationList.get(0);
				int id = reservation.getMovieid();
				Movie movie = movieDao.findImageName(id);
				request.setAttribute("movie", movie);
			}
			
				request.setAttribute("reservationList", reservationList);
				request.setAttribute("msg", "없는 예매 번호입니다.");		
				nextPage="/movie/checkReservation.jsp";
		
		}else if(action.equals("/checkReservation.do")) {
			nextPage="/movie/checkReservation.jsp";
			
		}else if(action.equals("/delReservation.do")) { //예매 취소
			String _resid=request.getParameter("resid");
			int resid = Integer.parseInt(_resid);
			boolean result = dao.cancel(resid);
			if(result) {
				request.setAttribute("success",1);
				request.setAttribute("msg", "예매 취소 완료");
				nextPage="/movie/delReservation.jsp";
				} else {
					request.setAttribute("success",0);
					request.setAttribute("msg", "없는 예매 번호입니다.");
					nextPage="/movie/delReservation.jsp";
				}
			
		}else if(action.equals("/reserve.do")) {
			String movieTitle = request.getParameter("movieTitle");
			String userId = request.getParameter("userId");
			String _movieId = request.getParameter("movieid");
			int movieId = Integer.parseInt(_movieId);
			List<Reservation> reservationList = dao.findByMovieId(movieId);
			request.setAttribute("reservationList", reservationList);
			request.setAttribute("movieId", _movieId);
			request.setAttribute("movieTitle", movieTitle);
			request.setAttribute("userId", userId);
			nextPage="/movie/reservePage.jsp";
			
		}else if(action.equals("/reservation.do")) {
			String movieTitle = request.getParameter("movieTitle");
			String _movieId = request.getParameter("movieId");
			String userId = request.getParameter("userId");
			String[] seats = request.getParameterValues("seat");
			
			int movieId = Integer.parseInt(_movieId);
			Reservation reservation = new Reservation(movieTitle, userId, movieId);
			int resId = dao.save(reservation, seats);
			request.setAttribute("resId", resId);
			nextPage="/movie/reservePage.jsp";
			
		}else if(action.equals("/reserveCheck.do")) { //로그인 되어 있는 사람의 예매 목록
			String id = request.getParameter("id");
			System.out.println(id);
			List<List<Reservation>> resList = new ArrayList<List<Reservation>>();
				resList =dao.findBy(id);
			request.setAttribute("resList", resList);
			nextPage="/movie/checkReservation.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
