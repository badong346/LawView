package lv.backend.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;
import org.jsoup.select.Elements;

import lv.backend.dto.KeywordDTO;
import lv.backend.dto.LawDTO;
import lv.backend.dto.PrecDTO;

public class LawDAO {

	public Connection getConnection() throws Exception{
		System.out.println("test");
		String url = "jdbc:oracle:thin:@localhost:49160:xe";
		String id = "temp";
		String pw = "temp";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection(url,id,pw);
	}
	
	public String getFormatDate(String[] dateArr) {
		
		String start = dateArr[0];
		String end = dateArr[1];
		
		String date;
		
		if(!start.contentEquals("") && end.contentEquals("")) {

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date time = new Date();

			end = format.format(time);

		}

		// 시작 날짜가 없고, 끝 날짜만 있는 경우 1900-01-01 넣어 줌
		else if(start.contentEquals("") && !end.contentEquals("")) {
			start = "1900-01-01";
		}
		
		else if(start.contentEquals("") && end.contentEquals("")) {
			start = "1900-01-01";
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date time = new Date();

			end = format.format(time);
		}

		start = start.replaceAll("-", "");
		end = end.replaceAll("-", "");
		date = start + "~" + end;
		
		return date;
		
	}
	
	
	// 법령 목록 페이지
	public Document getLawListPage(String page, String query, String date, String actDate) throws Exception {

		System.out.println(date);
		System.out.println(actDate);
		Document law = Jsoup.connect("http://www.law.go.kr/DRF/lawSearch.do?target=law")
				.data("OC", "jisooooo04")
				.data("type", "XML")
				.data("page", page)
				.data("query", query)
				.data("display", "10")
				.data("ancYd", date)
				.data("efYd", actDate)
				.parser(Parser.xmlParser()).get();
		
		return law;

	}

	// 판례 목록 페이지
	public Document getPrecListPage(String page, String query, String senDate) throws Exception {

		System.out.println(senDate);

		Document prec = Jsoup.connect("http://www.law.go.kr/DRF/lawSearch.do?target=prec")
				.data("OC", "jisooooo04")
				.data("type", "XML")
				.data("search", "1")
				.data("page", page)
				.data("query", query)
				.data("display", "10")
				.data("prncYd", senDate)
				.parser(Parser.xmlParser()).get();

		return prec;

	}

	// 법령 본문 페이지
	public Document getLawContentsPage(String lawId) throws Exception {

		Document contents = Jsoup.connect("http://www.law.go.kr/DRF/lawService.do?target=law")
				.data("OC", "jisooooo04")
				.data("type", "XML")
				.data("ID", lawId)
				.parser(Parser.xmlParser()).get();

		return contents;

	}


	// 판례 본문 페이지
	public Document getPrecContentsPage(String precId) throws Exception {

		Document contents = Jsoup.connect("http://www.law.go.kr/DRF/lawService.do?target=prec")
				.data("OC", "jisooooo04")
				.data("type", "XML")
				.data("ID", precId)
				.parser(Parser.xmlParser()).get();

		return contents;

	}



	public String getPageNavi(String query, String type, int lawpage, int precpage, int total, String date, String actDate, String senDate) throws Exception {

		int page = 1;

		if(type.contentEquals("law"))
			page = lawpage;
		else if(type.contentEquals("prec"))
			page = precpage;

		int pageTotalCount = 0; // 전체 페이지 개수

		if(total % 10 != 0) {
			pageTotalCount = total / 10 + 1;
			// 게시글 개수를 페이지 당 게시글로 나누어 나머지 값이 있으면 한 페이지를 더한다.
		}

		else 
			pageTotalCount = total / 10;

		// GET 방식으로 넘기기 때문에 파라미터를 클라이언트가 임의로 조정하게 될 수 있음
		// ex) -2
		// 공격자가 currentPage를 변조할 경우에 대한 보안 코드
		if(page < 1)
			page = 1;

		else if(page > pageTotalCount)
			page = pageTotalCount;

		int startNavi = (page - 1) / 10 * 10 + 1;
		int endNavi = startNavi + 10 - 1;

		if(endNavi > pageTotalCount) endNavi = pageTotalCount;

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) needPrev = false;
		if(endNavi == pageTotalCount) needNext = false;

		System.out.println("현재 페이지 : " + page);
		System.out.println("내비게이터 시작 : " + startNavi);
		System.out.println("내비게이터 끝 : " + endNavi);

		StringBuilder sb = new StringBuilder();

		if(needPrev) {

			if(type.contentEquals("law"))
				sb.append("<a href='list.search?query=" + query + "&precpage=" + precpage + "&lawpage=" + (startNavi - 1) + "&date=" + date + "&actdate=" + actDate + "&sendate=" + senDate + "'>< PREV </a>");
			else if(type.contentEquals("prec"))
				sb.append("<a href='list.search?query=" + query + "&lawpage=" + lawpage + "&precpage=" + (startNavi - 1) + "&date=" + date + "&actdate=" + actDate + "&sendate=" + senDate + "'>< PREV </a>");

		}

		for(int i = startNavi ; i <= endNavi ; i++) {

			if(type.contentEquals("law"))
				sb.append("<a href='list.search?query=" + query + "&precpage=" + precpage + "&lawpage=" + i + "&date=" + date + "&actdate=" + actDate + "&sendate=" + senDate + "'>" + i + " </a>");
			else if(type.contentEquals("prec"))
				sb.append("<a href='list.search?query=" + query + "&lawpage=" + lawpage + "&precpage=" + i + "&date=" + date + "&actdate=" + actDate + "&sendate=" + senDate + "'>" + i + " </a>");

		}

		if(needNext) {

			if(type.contentEquals("law"))
				sb.append("<a href='list.search?query=" + query + "&precpage=" + precpage + "&lawpage=" + (endNavi + 1) + "&date=" + date + "&actdate=" + actDate + "&sendate=" + senDate + "'>NEXT ></a>");
			else if(type.contentEquals("prec"))
				sb.append("<a href='list.search?query=" + query + "&lawpage=" + lawpage + "&precpage=" + (endNavi + 1) + "&date=" + date + "&actdate=" + actDate + "&sendate=" + senDate + "'>NEXT ></a>");

		}

		return sb.toString();
	}
	
	// 키워드 관련 법령 목록
		public List<KeywordDTO> getKeywordList(String query, String lawdate, String actDate) throws Exception {
			
			String dateStart = lawdate.split("~")[0];
			String dateEnd = lawdate.split("~")[1];
			String actStart = actDate.split("~")[0];
			String actEnd = actDate.split("~")[1];
			
			String sql = "select * from keyword2 where (keyword like ? or caption like ?) "
					+ "and lawdate between ? and ? and actdate between ? and ?";
			
			List<KeywordDTO> list = new ArrayList<>();
			
			try(Connection con = getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);){
				
				pstat.setString(1, "%" + query + "%");
				pstat.setString(2, "%" + query + "%");
				pstat.setString(3, dateStart);
				pstat.setString(4, dateEnd);
				pstat.setString(5, actStart);
				pstat.setString(6, actEnd);
				
				ResultSet rs = pstat.executeQuery();
				int lawNo = 0;
				
				while(rs.next()) {
					
					lawNo = lawNo + 1;
					String category = rs.getString("category");
					String caption = rs.getString("caption");
					String keyword = rs.getString("keyword");
					String lawId = rs.getString("lawid");
					String lawName = rs.getString("law");
					String lawType = rs.getString("lawtype");
					String lawDate = rs.getString("lawdate");
					String lawActDate = rs.getString("actdate");
					list.add(new KeywordDTO(lawNo, category, caption, keyword, lawId, lawName, lawType, lawDate, lawActDate));
					
				}
				
			}
			
			
			return list;
			
		}


	public List<LawDTO> getLawList(Document law){

		List<LawDTO> lawlist = new ArrayList<>();

		// 법령 결과 컬럼
		Elements lawNums = law.select("law");
		Elements lawIds = law.select("법령ID");
		Elements lawNames = law.select("법령명한글");
		Elements lawTypes = law.select("법령구분명");
		Elements lawDates = law.select("공포일자");
		Elements lawActDates = law.select("시행일자");

		for(int i = 0 ; i < lawIds.size() ; i++) {
			int lawNo = Integer.parseInt(lawNums.get(i).attr("id"));
			String lawId = Jsoup.parse(lawIds.get(i).text()).text();
			String lawName = Jsoup.parse(lawNames.get(i).text()).text();
			String lawType = Jsoup.parse(lawTypes.get(i).text()).text();
			String lawDate = Jsoup.parse(lawDates.get(i).text()).text();
			String lawActDate = Jsoup.parse(lawActDates.get(i).text()).text();
			lawlist.add(new LawDTO(lawNo, lawId, lawName, lawType, lawDate, lawActDate));
		}

		return lawlist;

	}

	public List<PrecDTO> getPrecList(Document prec){

		List<PrecDTO> preclist = new ArrayList<>();

		// 판례 결과 컬럼
		Elements precNums = prec.select("prec");
		Elements precIds = prec.select("판례일련번호");
		Elements precNames = prec.select("사건명");
		Elements precCourts = prec.select("법원명");
		Elements precTypes = prec.select("사건종류명");
		Elements precDates = prec.select("선고일자");

		for(int i = 0 ; i < precIds.size() ; i++) {
			int precNo = Integer.parseInt(precNums.get(i).attr("id"));
			String precId = Jsoup.parse(precIds.get(i).text()).text();
			String precName = Jsoup.parse(precNames.get(i).text()).text();
			String precCourt = Jsoup.parse(precCourts.get(i).text()).text();
			String precType = Jsoup.parse(precTypes.get(i).text()).text();
			String precDate = Jsoup.parse(precDates.get(i).text()).text();
			preclist.add(new PrecDTO(precNo, precId, precName, precCourt, precType, precDate));
		}

		return preclist;

	}

}
