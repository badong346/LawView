package lv.backend.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import lv.backend.dao.QuestionDAO;
import lv.backend.dto.QuestionDTO;

@WebServlet("*.question")
public class QuestionController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");

		String requestURI = request.getRequestURI();  //어떤 요청인지 확인하기 위해 호출된 곳의 주소를 저장
		String contextPath = request.getContextPath();  //url에서 프로젝트 이름 빼기 위함
		String cmd = requestURI.substring(contextPath.length());  //몇번부터 몇번까지 잘라내라

		QuestionDAO dao = new QuestionDAO();

		if(cmd.contentEquals("/faqlist.question")) {  //FAQ 출력
			try {
				List<QuestionDTO> result = dao.select("faq1");
				request.setAttribute("result", result);
				request.getRequestDispatcher("question.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}


		}else if(cmd.contentEquals("/ajax.question")) {
			String table = request.getParameter("table");
			System.out.println(table);
			try {
				List<QuestionDTO> list = dao.select(table);

				//리스트 형식을 json으로 바꾸고, gson을 이용해 보내는 방법
				String respArry = new Gson().toJson(list);
				response.getWriter().append(respArry);

			}catch(Exception e) {
				e.printStackTrace();
				response.sendError(500);
			}
		}



	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}