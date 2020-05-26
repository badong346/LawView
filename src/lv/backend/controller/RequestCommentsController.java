package lv.backend.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lv.backend.dao.LawyerDAO;
import lv.backend.dao.RequestCommentsDAO;
import lv.backend.dao.RequestDAO;
import lv.backend.dto.LawyerDTO;

@WebServlet("*.cmt")
public class RequestCommentsController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8"); // Post 데이터 인코딩

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());

		RequestDAO reqDAO = new RequestDAO();
		RequestCommentsDAO cmtDAO = new RequestCommentsDAO();
		LawyerDAO ldao = new LawyerDAO();
		try {
			if(cmd.contentEquals("/write.cmt")) { // 의뢰글 답변 작성
				int parent_seq = Integer.parseInt(request.getParameter("seq"));
				String id = (String)request.getSession().getAttribute("lawyerInfo");
				LawyerDTO ldto = ldao.lSelect(id);
				String writer = ldto.getName();
				String contents = request.getParameter("contents");
				cmtDAO.insert(parent_seq, writer, id, contents);
				response.sendRedirect("board.req");
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
