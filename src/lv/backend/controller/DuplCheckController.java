package lv.backend.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import lv.backend.dao.ClientDAO;
import lv.backend.dao.LawyerDAO;
import lv.backend.dto.ClientDTO;
import lv.backend.dto.LawyerDTO;
import lv.backend.encryption.Encryption;


@WebServlet("*.dupl")
public class DuplCheckController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");

		String contextPath = request.getContextPath();
		String requestURI = request.getRequestURI();
		String cmd = requestURI.substring(contextPath.length());

		ClientDAO cdao = new ClientDAO();
		ClientDTO cdto = new ClientDTO();
		LawyerDAO ldao = new LawyerDAO();
		LawyerDTO ldto = new LawyerDTO();
		Encryption enc = new Encryption();

		try {
			if(cmd.contentEquals("/cpwduplcheck.dupl")) {
				//클라이언트 id/pw 비교하여 boolean값 출력
				String id = (String)request.getSession().getAttribute("clientInfo");
				String pw = request.getParameter("pw");
				String pwEnc = enc.getSHA512(pw);
				if(cdao.pwDuplCheck(id, pwEnc)) {
					//pw맞는경우
					JsonObject respObj = new JsonObject();
					respObj.addProperty("dupl", "true");
					JsonArray respArr = new JsonArray();
					respArr.add(respObj);
					response.getWriter().append(respArr.toString());
				}else {
					//pw다른 경우
					JsonObject respObj = new JsonObject();
					respObj.addProperty("dupl", "false");
					JsonArray respArr = new JsonArray();
					respArr.add(respObj);
					response.getWriter().append(respArr.toString());
				}
			}else if(cmd.contentEquals("/lpwduplcheck.dupl")) {
				//변호사 id/pw 비교하여 boolean값 출력
				String id = (String)request.getSession().getAttribute("lawyerInfo");
				String pw = request.getParameter("pw");
				String pwEnc = enc.getSHA512(pw);
				if(ldao.pwDuplCheck(id, pwEnc)) {
					//pw맞는경우
					JsonObject respObj = new JsonObject();
					respObj.addProperty("dupl", "true");
					JsonArray respArr = new JsonArray();
					respArr.add(respObj);
					response.getWriter().append(respArr.toString());
				}else {
					//pw다른 경우
					JsonObject respObj = new JsonObject();
					respObj.addProperty("dupl", "false");
					JsonArray respArr = new JsonArray();
					respArr.add(respObj);
					response.getWriter().append(respArr.toString());
				}

			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
