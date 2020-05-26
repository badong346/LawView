package lv.backend.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import lv.backend.dao.ClientDAO;
import lv.backend.dao.RequestCommentsDAO;
import lv.backend.dao.RequestDAO;
import lv.backend.dto.ClientDTO;
import lv.backend.dto.RequestCommentsDTO;
import lv.backend.dto.RequestDTO;

@WebServlet("*.req")
public class RequestController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8"); // Post 데이터 인코딩
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		RequestDAO reqDAO = new RequestDAO();
		ClientDAO cliDAO = new ClientDAO();
		RequestCommentsDAO cmtDAO = new RequestCommentsDAO();
		try {
			if(cmd.contentEquals("/board.req")) { // 의뢰글 리스트 조회
				// 초기값 설정
				int cpage = 1;
				String sort = "newRequest";
				
				String category = request.getParameter("category");
				String keyword = request.getParameter("keyword");
				List<RequestDTO> list = null; // 의뢰글 리스트
				String navi = null; // 페이지 네비		
				List<RequestDTO> listByView = null; // 조회수 순 리스트
				try {
					cpage = Integer.parseInt(request.getParameter("cpage")); // 현재 페이지 값
					System.out.println(request.getParameter("cpage"));
					sort = request.getParameter("sort"); // 최신 순, 조회수 순 정렬
				}catch(Exception e) {}
				if(category!=null&&keyword!=null) { // 검색 기능을 거쳐 board.req 컨트롤러로 진입한 경우
					list = reqDAO.search(cpage, category, keyword);	
					navi = reqDAO.getPageNaviBySearch(cpage, category, keyword);
					listByView = reqDAO.searchByView(cpage, category, keyword);
				}else {
					list = reqDAO.selectByPageNo(cpage); 
					navi = reqDAO.getPageNavi(cpage); 
					listByView = reqDAO.selectByView(cpage); 	
				}
				// 각각의 게시글에 대한 답변
				// 일단 댓글 중 가장 첫 번째로 달린 답변 ( comments seq 값이 가장 적은 답변 ) 만 보내기
				// Map Key : seq - 글 번호
				// Map Value : List<RequestCommentsDTO> - 의뢰글에 따른 변호사 답변 리스트
				Map<Integer,List<RequestCommentsDTO>> cmtList = new HashMap<>();
				for(RequestDTO dto : list) {
					int seq = dto.getSeq();
					if(cmtDAO.selectByPseq(seq).size()!=0) {
						cmtList.put(seq,cmtDAO.selectByPseq(seq)); 						
					}
				}
				request.setAttribute("cmtList", cmtList);
				request.setAttribute("list", list);
				request.setAttribute("listByView", listByView);
				request.setAttribute("navi", navi);
				request.setAttribute("sort", sort); // 정렬
				RequestDispatcher rd = request.getRequestDispatcher("request.jsp");
				rd.forward(request, response);
			}else if(cmd.contentEquals("/write.req")) { // 의뢰글 작성
				String id = (String)request.getSession().getAttribute("clientInfo");
				System.out.println(id);
				ClientDTO dto = cliDAO.cSelect(id);
				String writer = dto.getName();
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				String category = request.getParameter("category");
				// 이미지 파일 가져오기
				reqDAO.insert(new RequestDTO(0,writer,Timestamp.valueOf(LocalDateTime.now()),0,title,category,id,contents));
				RequestDispatcher rd = request.getRequestDispatcher("writeComplete.jsp");
				rd.forward(request, response);
			}else if(cmd.contentEquals("/contents.req")) { // 의뢰글 내용 조회
				int seq = Integer.parseInt(request.getParameter("seq")); // 의뢰글 번호
				reqDAO.viewUp(seq); // 조회수 증가
				RequestDTO dto = reqDAO.selectBySeq(seq); // 의뢰글 내용
				List<RequestCommentsDTO> list = cmtDAO.selectByPseq(seq); // 의뢰글 답변
				request.setAttribute("dto", dto);
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("request_contents.jsp");
				rd.forward(request, response);
			}else if(cmd.contentEquals("/delete.req")) { // 관리자 의뢰글 삭제 기능
				String[] seqs = request.getParameterValues("deleteSeq");
				for(String seq : seqs) {
					reqDAO.delete(Integer.parseInt(seq));
				}
				response.sendRedirect("deleteComplete.jsp");
			}else if(cmd.contentEquals("/mydelete.req")) { // 내 글 삭제 기능
				int seq = Integer.parseInt(request.getParameter("seq"));
				reqDAO.delete(seq);
				response.sendRedirect("deleteComplete.jsp");
			}else if(cmd.contentEquals("/search.req")) { // 의뢰글 카테고리 + 제목 키워드 검색 기능
				response.setCharacterEncoding("utf8");
				String category = request.getParameter("category");
				String keyword = request.getParameter("keyword");
				response.getWriter().append("?category="+category+"&keyword="+keyword);
			}else if(cmd.contentEquals("/print.req")) { // 메인에 출력용
				response.setCharacterEncoding("utf8");
				List<RequestDTO> requestList = reqDAO.selectAllDesc();
				String respArr = new Gson().toJson(requestList);
				response.getWriter().append(respArr);
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
