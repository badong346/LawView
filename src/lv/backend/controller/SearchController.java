package lv.backend.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import lv.backend.dao.LawDAO;
import lv.backend.dto.KeywordDTO;
import lv.backend.dto.LawDTO;
import lv.backend.dto.ParaDTO;
import lv.backend.dto.PrecDTO;
import lv.backend.dto.ProvisionDTO;

@WebServlet("*.search")
public class SearchController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String contextPath = request.getContextPath();
		String requestURI = request.getRequestURI();

		String cmd = requestURI.substring(contextPath.length());

		System.out.println("Context Path : " + contextPath);
		System.out.println("Request URI : " + requestURI);
		System.out.println("Command : " + cmd);

		LawDAO lawDAO = new LawDAO();

		if(cmd.contentEquals("/list.search")) {

			// 검색어
			String query = request.getParameter("query");
			String[] checkSection = request.getParameterValues("checkSection");
			boolean searchLaw = false, searchPrec = false, searchKeyword = false;

			System.out.println("검색어 : " + query);	

			// 검색 조건에서 특정 카테고리를 설정했을 
			if(checkSection != null) {

				for(int i = 0 ; i < checkSection.length ; i++) {

					if(checkSection[i].contentEquals("check-keyword"))
						searchKeyword = true;
					else if(checkSection[i].contentEquals("check-law"))
						searchLaw = true;
					else if(checkSection[i].contentEquals("check-prec"))
						searchPrec = true;

				}

				// 안 했을 때
			} else if(checkSection == null){
				searchKeyword = true;
				searchLaw = true;
				searchPrec = true;
			}

			String date, actDate, senDate;

			if(request.getParameter("date") == null) {
				// 공포 일자, 시행 일자, 선고 일자 설정
				String[] date_arr = request.getParameterValues("dates");
				String[] actdate_arr = request.getParameterValues("actdates");
				String[] sendate_arr = request.getParameterValues("sendates");

				date = lawDAO.getFormatDate(date_arr);
				actDate = lawDAO.getFormatDate(actdate_arr);
				senDate = lawDAO.getFormatDate(sendate_arr);
			}
			else {
				date = request.getParameter("date");
				actDate = request.getParameter("actdate");
				senDate = request.getParameter("sendate");
			}
			
			String lawPage = "1";
			String precPage = "1";

			if(request.getParameter("lawpage") != null)
				lawPage = request.getParameter("lawpage");

			if(request.getParameter("precpage") != null)
				precPage = request.getParameter("precpage");

			try {

				Document law = lawDAO.getLawListPage(lawPage, query, date, actDate);
				Document prec = lawDAO.getPrecListPage(precPage, query, senDate);

				// 결과 리스트
				List<KeywordDTO> keywordlist = lawDAO.getKeywordList(query, date, actDate);
				
				Map<String, ArrayList<KeywordDTO> > captions = new HashMap<>();
				Map<String, ArrayList<Map.Entry<String, ArrayList<KeywordDTO>>>> categories = new HashMap<>();
				
				for(KeywordDTO dto : keywordlist) {

					if(captions.containsKey(dto.getCaption())){
						captions.get(dto.getCaption()).add(dto);
					}
					else {
						captions.put(dto.getCaption(), new ArrayList<KeywordDTO>());
						captions.get(dto.getCaption()).add(dto);
					}
					
				}
				
				for(Map.Entry<String, ArrayList<KeywordDTO>> entry : captions.entrySet()) {

					String category = entry.getValue().get(0).getCategory();
					
					if(categories.containsKey(category)) {
						
						categories.get(category).add(entry);
						
					}
					
					else {
						categories.put(category, new ArrayList<Map.Entry<String, ArrayList<KeywordDTO>>>());
						categories.get(category).add(entry);
					}
					
				}
								
				List<LawDTO> lawlist = lawDAO.getLawList(law);
				List<PrecDTO> preclist = lawDAO.getPrecList(prec);

				// 법령 및 판례 총 검색 개수
				int keywordTotal = keywordlist.size();
				int lawTotal = Integer.parseInt(law.select("totalCnt").text());
				int precTotal = Integer.parseInt(prec.select("totalCnt").text());


				String lawNavi = lawDAO.getPageNavi(query, "law", Integer.parseInt(lawPage), Integer.parseInt(precPage), lawTotal, date, actDate, senDate);
				String precNavi = lawDAO.getPageNavi(query, "prec", Integer.parseInt(lawPage), Integer.parseInt(precPage), precTotal, date, actDate, senDate);

				// response에 담기
				request.setAttribute("query", query);
				request.setAttribute("searchKeyword", searchKeyword);
				request.setAttribute("keywordTotal", keywordTotal);
				request.setAttribute("keywordlist", keywordlist);
				request.setAttribute("categories", categories.entrySet());
				request.setAttribute("searchLaw", searchLaw);
				request.setAttribute("lawTotal", lawTotal);
				request.setAttribute("lawlist", lawlist);
				request.setAttribute("lawNavi", lawNavi);
				request.setAttribute("searchPrec", searchPrec);
				request.setAttribute("precTotal", precTotal);
				request.setAttribute("preclist", preclist);
				request.setAttribute("precNavi", precNavi);

				RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
				rd.forward(request, response);

			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}


		}

		else if(cmd.contentEquals("/readLaw.search")) {

			String lawId = request.getParameter("lawId");
			System.out.println(lawId);

			// 법령 본문 검색
			try {

				Document contents = lawDAO.getLawContentsPage(lawId);
				String lawNo = contents.select("공포번호").text();
				String lawName = contents.select("법령명_한글").text();
				String lawType = contents.select("법종구분").text();
				String lawDep = contents.select("소관부처").text();
				String lawDate = contents.select("공포일자").text();
				String lawActDate = contents.select("시행일자").text();

				List<ProvisionDTO> prosList = new ArrayList<>();

				Elements pros = contents.select("조문단위");

				for(Element e : pros) {

					int proId = Integer.parseInt(e.select("조문번호").text());
					String proName = e.select("조문제목").text();
					String proContent = e.select("조문내용").text();
					Elements parasE = e.select("항");

					List<ParaDTO> paras = new ArrayList<>();

					// 항 
					for(Element p : parasE) {

						// 항 내용 
						String content = p.select("항내용").text();
						// 호 
						Elements subs = p.select("호");
						paras.add(new ParaDTO(content, subs));

					}

					prosList.add(new ProvisionDTO(proId, proName, proContent, paras));

				}

				// response에 담기
				request.setAttribute("lawNo", lawNo);
				request.setAttribute("lawName", lawName);
				request.setAttribute("lawType", lawType);
				request.setAttribute("lawDep", lawDep);
				request.setAttribute("lawDate", lawDate);
				request.setAttribute("lawActDate", lawActDate);

				request.setAttribute("pros", prosList);
				RequestDispatcher rd = request.getRequestDispatcher("readLaw.jsp");
				rd.forward(request, response);



			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// iframe으로 출력 결과 보여 줄 경우
			// Elements lawContents = law.select("iframe");
			// request.setAttribute("lawContents", lawContents);

		}

		else if(cmd.contentEquals("/readPrec.search")) {

			String precId = request.getParameter("precId");

			try {

				Document contents = lawDAO.getPrecContentsPage(precId);

				System.out.println(contents);
				String precName = contents.select("사건명").text();
				String precNo = contents.select("사건번호").text();
				String precDate = contents.select("선고일자").text();
				String precType = contents.select("사건종류명").text();
				String precIssue = contents.select("판시사항").text(); // 쟁점, 판결의 기준
				String precCon = contents.select("판결요지").text(); // 판시 사항에 대한 법원의 판단
				String precLaw = contents.select("참조조문").text();
				String precContent = contents.select("판례내용").text();

				// response에 담기
				request.setAttribute("precName", precName);
				request.setAttribute("precNo", precNo);
				request.setAttribute("precDate", precDate);
				request.setAttribute("precType", precType);
				request.setAttribute("precIssue", precIssue);
				request.setAttribute("precCon", precCon);
				request.setAttribute("precLaw", precLaw);
				request.setAttribute("precContent", precContent);

				RequestDispatcher rd = request.getRequestDispatcher("precinfo.jsp");
				rd.forward(request, response);


			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		
		else if(cmd.contentEquals("/loading.search")) {
			String lawId = request.getParameter("lawId");
			System.out.println(lawId);
			request.setAttribute("lawId", lawId);
			RequestDispatcher rd = request.getRequestDispatcher("loading.jsp");
			rd.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
