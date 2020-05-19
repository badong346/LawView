package lv.backend.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import lv.backend.dto.RequestDTO;
import lv.backend.statics.Configuration;

public class RequestDAO {
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/dbcp");
		return ds.getConnection();
	}
	public int insert(RequestDTO dto) throws Exception{
		// insert into request_board values(seq,'홍길동',날짜,조회수,'제목','상속',아이디,'내용');
		String sql = "insert into request_board values(request_seq.nextval,?,default,default,?,?,?,?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, dto.getWriter());
			pstat.setString(2, dto.getTitle());
			pstat.setString(3, dto.getCategory());
			pstat.setString(4, dto.getId());
			pstat.setString(5, dto.getContents());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public int delete(int seq) throws Exception{ // 관리자 삭제 기능
		String sql = "delete from request_board where seq=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public int viewUp(int seq) throws Exception{
		String sql = "update request_board set view_count=view_count+1 where seq=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public RequestDTO selectBySeq(int seq) throws Exception{
		String sql = "select * from request_board where seq=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery();){
				RequestDTO dto = null;
				if(rs.next()) {
					int seq2 = rs.getInt(1);
					String writer = rs.getString(2);
					Timestamp write_date = rs.getTimestamp(3);
					int view_count = rs.getInt(4);
					String title = rs.getString(5);
					String category = rs.getString(6);
					String id = rs.getString(7);
					String contents = rs.getString(8);
					dto = new RequestDTO(seq2,writer,write_date,view_count,title,category,id,contents);
				}
				return dto;	
			}
		}
	}
	public List<RequestDTO> selectAll() throws Exception{
		String sql = "select * from request_board order by 1";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<RequestDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt(1);
				String writer = rs.getString(2);
				Timestamp write_date = rs.getTimestamp(3);
				int view_count = rs.getInt(4);
				String title = rs.getString(5);
				String category = rs.getString(6);
				String id = rs.getString(7);
				String contents = rs.getString(8);
				list.add(new RequestDTO(seq,writer,write_date,view_count,title,category,id,contents));
			}
			return list;
		}
	}
	public List<RequestDTO> selectByPageNo(int cpage) throws Exception{
		String sql = "select * from (select request_board.*, row_number() over(order by seq desc) as rnum from request_board) where rnum between ? and ?";
		int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);
		int end = start + (Configuration.recordCountPerPage-1);
		List<RequestDTO> list = new ArrayList<>();

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(2);
					Timestamp write_date = rs.getTimestamp(3);
					int view_count = rs.getInt(4);
					String title = rs.getString(5);
					String category = rs.getString(6);
					String id = rs.getString(7);
					String contents = rs.getString(8);
					list.add(new RequestDTO(seq,writer,write_date,view_count,title,category,id,contents));
				}
				return list;
			}
		}
	}
	public List<RequestDTO> selectByView(int cpage) throws Exception{
		String sql = "select * from (select request_board.*, row_number() over(order by view_count desc, seq desc) as rnum from request_board) where rnum between ? and ?";
		int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);
		int end = start + (Configuration.recordCountPerPage-1);
		List<RequestDTO> list = new ArrayList<>();

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(2);
					Timestamp write_date = rs.getTimestamp(3);
					int view_count = rs.getInt(4);
					String title = rs.getString(5);
					String category = rs.getString(6);
					String id = rs.getString(7);
					String contents = rs.getString(8);
					list.add(new RequestDTO(seq,writer,write_date,view_count,title,category,id,contents));
				}
				return list;
			}
		}
	}
	public List<RequestDTO> searchByView(int cpage, String category, String keyword) throws Exception{
		String sql = "select * from (select request_board.*, row_number() over(order by view_count desc, seq desc) as rnum from request_board where category=? and REGEXP_LIKE(title,?)) where rnum between ? and ?";
		int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);
		int end = start + (Configuration.recordCountPerPage-1);
		List<RequestDTO> list = new ArrayList<>();

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, category);
			pstat.setString(2, "[" + keyword + "]");
			pstat.setInt(3, start);
			pstat.setInt(4, end);
			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(2);
					Timestamp write_date = rs.getTimestamp(3);
					int view_count = rs.getInt(4);
					String title = rs.getString(5);
					String category2 = rs.getString(6);
					String id = rs.getString(7);
					String contents = rs.getString(8);
					list.add(new RequestDTO(seq,writer,write_date,view_count,title,category2,id,contents));
				}
				return list;
			}
		}
	}
	public List<RequestDTO> search(int cpage, String category, String keyword) throws Exception{
		String sql = null;
		if(category.contentEquals("")&&keyword.contentEquals("")) { // category, keyword가 비어있는 경우
			sql = "select * from (select request_board.*, row_number() over(order by seq desc) as rnum from request_board) where rnum between ? and ?";
		}else if(category.contentEquals("")&&!keyword.contentEquals("")) { // keyword만 입력한 경우
			sql = "select * from (select request_board.*, row_number() over(order by seq desc) as rnum from request_board where REGEXP_LIKE(title,?)) where rnum between ? and ?";
		}else if(!category.contentEquals("")&&keyword.contentEquals("")) { // category만 입력한 경우
			sql = "select * from (select request_board.*, row_number() over(order by seq desc) as rnum from request_board where category=?) where rnum between ? and ?";
		}else { // 둘 다 정상적으로 입력한 경우
			sql = "select * from (select request_board.*, row_number() over(order by seq desc) as rnum from request_board where category=? and REGEXP_LIKE(title,?)) where rnum between ? and ?";
		}
		int start = cpage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1);
		int end = start + (Configuration.recordCountPerPage-1);
		List<RequestDTO> list = new ArrayList<>();
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			if(category.contentEquals("")&&keyword.contentEquals("")) { // category, keyword가 비어있는 경우
				pstat.setInt(1, start);
				pstat.setInt(2, end);
			}else if(category.contentEquals("")&&!keyword.contentEquals("")) { // keyword만 입력한 경우
				pstat.setString(1, "[" + keyword + "]");
				pstat.setInt(2, start);
				pstat.setInt(3, end);
			}else if(!category.contentEquals("")&&keyword.contentEquals("")) { // category만 입력한 경우
				pstat.setString(1, category);
				pstat.setInt(2, start);
				pstat.setInt(3, end);
			}else { // 둘 다 정상적으로 입력한 경우
				pstat.setString(1, category);
				pstat.setString(2, "[" + keyword + "]");
				pstat.setInt(3, start);
				pstat.setInt(4, end);
			}
			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(2);
					Timestamp write_date = rs.getTimestamp(3);
					int view_count = rs.getInt(4);
					String title = rs.getString(5);
					String category2 = rs.getString(6);
					String id = rs.getString(7);
					String contents = rs.getString(8);
					list.add(new RequestDTO(seq,writer,write_date,view_count,title,category2,id,contents));
				}
				return list;
			}
		}
	}
	public int getArticleCountBySearch(String category, String keyword) throws Exception{
		String sql = null;
		if(category.contentEquals("")&&keyword.contentEquals("")) { // category, keyword가 비어있는 경우
			sql = "select count(*) from request_board";
		}else if(category.contentEquals("")&&!keyword.contentEquals("")) { // keyword만 입력한 경우
			sql = "select count(*) from request_board where REGEXP_LIKE(title,?)";
		}else if(!category.contentEquals("")&&keyword.contentEquals("")) { // category만 입력한 경우
			sql = "select count(*) from request_board where category=?";
		}else { // 둘 다 정상적으로 입력한 경우
			sql = "select count(*) from request_board where category=? and REGEXP_LIKE(title,?)";
		}
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			if(category.contentEquals("")&&keyword.contentEquals("")) { // category, keyword가 비어있는 경우

			}else if(category.contentEquals("")&&!keyword.contentEquals("")) { // keyword만 입력한 경우
				pstat.setString(1, "[" + keyword + "]");
			}else if(!category.contentEquals("")&&keyword.contentEquals("")) { // category만 입력한 경우
				pstat.setString(1, category);
			}else { // 둘 다 정상적으로 입력한 경우
				pstat.setString(1, category);	
				pstat.setString(2, "[" + keyword + "]");
			}
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);				
			}
		}
	}
	public String getPageNavi(int currentPage) throws Exception{
		int recordTotalCount = this.getArticleCount(); 
		int pageTotalCount = 0;
		if(recordTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;	
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + Configuration.naviCountPerPage - 1;
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}

		StringBuilder sb = new StringBuilder();
		if(needPrev) {sb.append("<li class='page-item'><a class='page-link' href='board.req?cpage="+(startNavi-1)+"'><i class='fas fa-chevron-left'></i></a></li>");}
		for(int i = startNavi;i <= endNavi;i++) {
			sb.append("<li class='page-item'><a class='page-link' href='board.req?cpage="+i+"&sort='>" + i + "</a></li>");
		}
		if(needNext) {sb.append("<li class='page-item'><a class='page-link' href='board.req?cpage="+(endNavi+1)+"'><i class='fas fa-chevron-right'></i></a></li>");}
		return sb.toString();
	}
	public int getArticleCount() throws Exception{
		String sql = "select count(*) from request_board";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			rs.next();
			return rs.getInt(1);
		}
	}
	public String getPageNaviBySearch(int currentPage, String category, String title) throws Exception{
		int recordTotalCount = this.getArticleCountBySearch(category, title); 
		int pageTotalCount = 0;
		if(recordTotalCount % Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;	
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + Configuration.naviCountPerPage - 1;
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}

		StringBuilder sb = new StringBuilder();
		if(needPrev) {sb.append("<li class='page-item'><a class='page-link' href='board.req?cpage="+(startNavi-1)+"&sort='><i class='fas fa-chevron-left'></i></a></li>");}
		for(int i = startNavi;i <= endNavi;i++) {
			sb.append("<li class='page-item'><a class='page-link' href='board.req?cpage="+i+"&sort='>" + i + "</a></li>");
		}
		if(needNext) {sb.append("<li class='page-item'><a class='page-link' href='board.req?cpage="+(endNavi+1)+"&sort='><i class='fas fa-chevron-right'></i></a></li>");}
		return sb.toString();
	}
}