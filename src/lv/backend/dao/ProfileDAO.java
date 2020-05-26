package lv.backend.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import lv.backend.dto.ProfileDTO;
import lv.backend.statics.Configuration;


public class ProfileDAO {

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/dbcp"); //경로
		return ds.getConnection();
	}

	public int insertProfile(ProfileDTO dto) throws Exception{

		String sql = "insert into profile_board values(profile_board_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
		try(Connection con = this.getConnection();	
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getTitle());
			pstat.setString(3, dto.getPhone());
			
	
			pstat.setString(4, Arrays.toString(dto.getSpecialty()));// 배열을 스트링으로
			pstat.setString(5, dto.getOffice_name());
			pstat.setString(6, dto.getOffice_phone());
			pstat.setString(7, dto.getTest());
			pstat.setString(8, dto.getEducation());
			pstat.setString(9, dto.getId());

			pstat.setString(10, dto.getImg());
	
			int result = pstat.executeUpdate();
			System.out.println("insertProfile 결과 : "+result);
			con.commit();
			return result;
		}
	}

	//전체 프로필 리스트 불러오기
	public List<ProfileDTO> selectAll() throws Exception{
		String sql = "select * from profile_board order by 1";
		List<ProfileDTO> result = new ArrayList<>();
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery(); ){
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String name = rs.getString("name");
				String title = rs.getString("title");
				String phone = rs.getString("phone");
				String[] specialty = rs.getString("specialty").replace("[", "").replace("]", "").split(", "); // 문자열을 배열로 ",공백"
				String office_name = rs.getString("office_name");
				String office_phone = rs.getString("office_phone");
				String test = rs.getString("test");
				String education = rs.getString("education");
				String id = rs.getString("id");

				ProfileDTO dto = new ProfileDTO(seq,name,title,phone,specialty,office_name,office_phone,test,education,id);
				result.add(dto);
			}
			return result;
		}
	}

	// 전체를 불러오지 말고 일부만 불러오는 경우
	public List<ProfileDTO> selectByPageNo(int cpage) throws Exception{

		int start = cpage * Configuration.recordCountPerPage - (Configuration.naviCountPerPage-1);
		int end = start + (Configuration.recordCountPerPage-1);

		String sql = "select * from (select profile_board.*, row_number() over(order by seq desc) rnum from profile_board) where rnum between ? and ?";
		List<ProfileDTO> list = new ArrayList<>();	
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {

					int seq = rs.getInt("seq");
					String name = rs.getString("name");
					String title = rs.getString("title");
					String phone = rs.getString("phone");
					String[] specialty = rs.getString("specialty").replace("[", "").replace("]", "").split(", "); // 문자열을 배열로 ",공백"
					String office_name = rs.getString("office_name");
					String office_phone = rs.getString("office_phone");
					String test = rs.getString("test");
					String education = rs.getString("education");
					String id = rs.getString("id");
					String img = rs.getString("img");

					ProfileDTO dto = new ProfileDTO(seq,name,title,phone,specialty,office_name,office_phone,test,education,id,img);
					list.add(dto);
				}
				return list;
			}
		}
	}

	public String getpageNavi(int currentPage) throws Exception {
		//총 몇개의 글이 있는가? 한페이지에 몇개의 글을 보여줄 것인가?
		int recordTotalCount = this.getArticleCount(); // 총 게시물의 개수
		int recordCountPerPage = 10;// 한 페이지에 게시글 몇개를 보여줄 것인가?
		int naviCountPerPage = 10; //한 페이지에 네비게이터 몇개를 보여줄 것인가?
		int pageTotalCount = 0; // 전체 페이지의 개수
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
			// 게시글 개수를 페이지당 게시글로 나누어 나머지 값이 있으면 한페이지를 더한다.
			// ex) 147개의 글이 있다면 10글 짜리 14페이지 + 7글짜리 1페이지 -> 총 15페이지 필요
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
			// 게시글 개수를 페이지당 게시글로 나누어 나머지 값이 없으면 더할 필요없다.
			// ex) 140개의 글이 있다면 10글 짜리 14페이지로 끝.
		}
		//현재 내가 위치한 페이지 번호, 1~pageTotalCount까지의 범위를 가진다.
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		} // 공격자가 currentPage 값을 변조할 경우에 대한 보안 코드
		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1 ;
		int endNavi = startNavi + naviCountPerPage - 1 ;
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}

		StringBuilder sb = new StringBuilder(); // 리턴할 스트링 조합
		if(needPrev) {
			sb.append("<li><a href='toProfileListView.profile?cpage="+(startNavi-1)+"'><</a></li>");
		}
		for (int i = startNavi;i <= endNavi;i++) {
			sb.append("<li><a href='toProfileListView.profile?cpage="+i+"'>"+i+"</a></li>");
		}
		if(needNext) {
			sb.append("<li><a href='toProfileListView.profile?cpage="+(endNavi+1)+"'>></a></li>");
		}
		return sb.toString();
	}

	public int getArticleCount() throws Exception{
		String sql = "select count(*) from profile_board";
		try(Connection con = this.getConnection();	
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			rs.next(); // 안쓰면 헤더를 가르키는 상태
			return rs.getInt(1);
		}
	}

	public ProfileDTO selectBySeq(int seq) throws Exception{
		String sql = "select * from profile_board where seq=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(
					ResultSet rs = pstat.executeQuery();					
					){
				ProfileDTO dto = null;
				if(rs.next()) {
					String name = rs.getString("name");
					String title = rs.getString("title");
					String phone = rs.getString("phone");
					String[] specialty = rs.getString("specialty").replace("[", "").replace("]", "").split(", "); // 문자열을 배열로 ",공백"
					String office_name = rs.getString("office_name");
					String office_phone = rs.getString("office_phone");
					String test = rs.getString("test");
					String education = rs.getString("education");
					String id = rs.getString("id");
					String img = rs.getString("img");
					dto = new ProfileDTO(seq,name,title,phone,specialty,office_name,office_phone,test,education,id,img);
				}
				return dto;	
			}
		}
	}

	public int deleteBySeq(int seq) throws Exception{
		String sql = "delete from profile_board where seq=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int updateByDTO(ProfileDTO dto) throws Exception{


		if(dto.getImg() !=null) {
			System.out.println("수정할 이미지 업로드 있음");
			String sql = "update profile_board set title=?, specialty=?, education=?, img=? where seq =?";
			try(
					Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);
					){
				pstat.setString(1, dto.getTitle());
				pstat.setString(2, Arrays.toString(dto.getSpecialty()));// 배열을 스트링 한개로
				pstat.setString(3, dto.getEducation());
				pstat.setString(4, dto.getImg());
				pstat.setInt(5, dto.getSeq());

				System.out.println("수정되는 getSpecialty : "+Arrays.toString(dto.getSpecialty()));
				int result = pstat.executeUpdate();
				con.commit();
				return result;
			}

		}else { //이미지를 새로 업로드 하지 않은 경우 기존 이미지 유지
			System.out.println("수정할 이미지 업로드 없음");
			String sql = "update profile_board set title=?, specialty=?, education=? where seq =?";
			try(
					Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);
					){
				pstat.setString(1, dto.getTitle());
				pstat.setString(2, Arrays.toString(dto.getSpecialty()));
				pstat.setString(3, dto.getEducation());
				pstat.setInt(4, dto.getSeq());
				

				System.out.println("수정되는 Title : "+ dto.getTitle());
				System.out.println("수정되는 Specialty : "+ Arrays.toString(dto.getSpecialty()));
				System.out.println("수정되는 Education : "+ dto.getEducation());
				System.out.println("선택되는 Seq : "+ dto.getSeq());
				

				int result = pstat.executeUpdate();
				con.commit();
				return result;
			
			}

		}

	}
}
