package lv.backend.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import lv.backend.dto.ClientDTO;
import lv.backend.dto.LawyerDTO;
import lv.backend.dto.RequestDTO;
import oracle.sql.TIMESTAMP;

public class LawyerDAO {
	private Connection getConnection() throws Exception {	
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/dbcp");
		return ds.getConnection();
	}

	//변호사 DB 입력
	public int lawyerInsert(String id, String pw, String name, String email, String phone, String office_name,
			String office_phone, String office_zipcode, String office_addr1, String office_addr2, String test,
			String test_num, String gender, String birth) throws SQLException, Exception {
		String sql = "insert into lawyer values (?,?,?,?,?,?,?,?,?,?,?,?,default,?,?)";

		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, id);
			pstat.setString(2, pw);
			pstat.setString(3, name);
			pstat.setString(4, email);
			pstat.setString(5, phone);
			pstat.setString(6, office_name);
			pstat.setString(7, office_phone);
			pstat.setString(8, office_zipcode);
			pstat.setString(9, office_addr1);
			pstat.setString(10, office_addr2);
			pstat.setString(11, test);
			pstat.setString(12, test_num);
			pstat.setString(13, gender);
			pstat.setString(14, birth);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	//lawyer id 중복체크
	public boolean isIdAvailable(String id) throws SQLException, Exception {
		String sql = "select * from lawyer where id=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();){
				return !rs.next();
			}
		}
	}

	// 변호사 정보출력
	public LawyerDTO lSelect(String id) throws SQLException, Exception {
		String sql = "select * from lawyer where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, id);
			try (ResultSet rs = pstat.executeQuery();) {

				LawyerDTO ldto = null;
				if (rs.next()) {
					String cid = rs.getString("id");
					String cpw = rs.getString("pw");
					String cname = rs.getString("name");
					String cemail = rs.getString("email");
					String cphone = rs.getString("phone");
					String coffice_name = rs.getString("office_name");
					String coffice_phone = rs.getString("office_phone");
					String coffice_zipcode = rs.getString("office_zipcode");
					String coffice_addr1 = rs.getString("office_addr1");
					String coffice_addr2 = rs.getString("office_addr2");
					String ctest = rs.getString("test");
					String ctest_num = rs.getString("test_num");
					String capproval = rs.getString("approval");
					String cgender;
					if(rs.getString("gender") == null) {
						cgender = "";
					}else {
						cgender = rs.getString("gender");
					}
					//String cgender = rs.getString("gender");

					Timestamp cbirth = rs.getTimestamp("birth");

					if(cbirth == null) {
						ldto = new LawyerDTO(cid, cpw, cname, cemail, cphone, coffice_name, coffice_phone, coffice_zipcode, coffice_addr1, coffice_addr2, ctest, ctest_num,capproval, cgender);
					}else {
						ldto = new LawyerDTO(cid, cpw, cname, cemail, cphone, coffice_name, coffice_phone, coffice_zipcode, coffice_addr1, coffice_addr2, ctest, ctest_num,capproval, cgender, cbirth);
					}


				}
				return ldto;
			}
		}
	}

	//변호사 정보수정
	public int lawModify(String id, String pw, String name, String email, String phone, String office_name,
			String office_phone, String office_zipcode, String office_addr1, String office_addr2, String test,
			String test_num, String gender, String birth) throws SQLException, Exception {
		String sql = "update lawyer set pw = ? , name = ?, email = ?, phone = ? , office_name = ?, office_phone = ?, office_zipcode = ? , office_addr1 = ?, office_addr2 = ?, "
				+ "test = ?, test_num = ?, gender = ?, birth = ? where id = ?";


		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, pw);
			pstat.setString(2, name);
			pstat.setString(3, email);
			pstat.setString(4, phone);
			pstat.setString(5, office_name);
			pstat.setString(6, office_phone);
			pstat.setString(7, office_zipcode);
			pstat.setString(8, office_addr1);
			pstat.setString(9, office_addr2);
			pstat.setString(10, test);
			pstat.setString(11, test_num);
			pstat.setString(12, gender);
			pstat.setString(13, birth);
			pstat.setString(14, id);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	//변호사 회원 탈퇴
	public int lawDelete(String id) throws SQLException, Exception {
		String sql = "delete from lawyer where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	//변호사 비밀번호 확인
	public boolean pwDuplCheck(String id, String pw) throws Exception {
		String sql = "select * from lawyer where id = ? and pw = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			pstat.setString(2, pw);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
				//자료가 없으면 false 자료가 있으면 true
				//flase면 pw안맞음  true면 pw맞음
			}


		}

	}

	//변호사 댓글단 게시글 출력
	public List<RequestDTO> selectClientlist(String id) throws SQLException, Exception{
		String sql = "select b.* from request_board B, request_comments C where b.seq = c.parent_seq and c.lawyer_id = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);

			List<RequestDTO> list = new ArrayList<>();
			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {
					int seq = rs.getInt(1);
					String writer = rs.getString(2);
					Timestamp write_date = rs.getTimestamp(3);
					int view_count = rs.getInt(4);
					String title  = rs.getString(5);
					String category = rs.getString(6);
					String client_id = rs.getString(7);
					String contents = rs.getString(8);
					list.add(new RequestDTO(seq, writer, write_date, view_count, title, category, client_id, contents));
				}
				return list;
			}
		}
	}
	public boolean lawyerlogin(String id, String pw) throws SQLException, Exception {
		String sql = "select * from lawyer where id=? and pw=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, id);
			pstat.setString(2, pw);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();


			}
		}

	}
	// 예지 수정 : 여기서부터 관리자 페이지에 쓰이는 내용
	public List<LawyerDTO> selectAll() throws Exception{
		String sql = "select * from lawyer";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			List<LawyerDTO> list = new ArrayList<>();
			while(rs.next()) {
				LawyerDTO dto = new LawyerDTO();
				dto.setId(rs.getString(1));
				dto.setPw(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setPhone(rs.getString(5));
				dto.setOffice_name(rs.getString(6));
				dto.setOffice_phone(rs.getString(7));
				dto.setOffice_zipcode(rs.getString(8));
				dto.setOffice_addr1(rs.getString(9));
				dto.setOffice_addr2(rs.getString(10));
				dto.setTest(rs.getString(11));
				dto.setTest_num(rs.getString(12));
				dto.setApproval(rs.getString(13));
				dto.setGender(rs.getString(14));
				dto.setBirth(rs.getTimestamp(15));
				list.add(dto);
			}
			return list;
		}
	}
	// 변호사 승인
	public int updateAppToY(String id) throws Exception{
		String sql = "update lawyer set approval = 'y' where id = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	// 변호사 승인 해제
	public int updateAppToN(String id) throws Exception{
		String sql = "update lawyer set approval = 'n' where id = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	// 회원 검색
	public List<LawyerDTO> selectByName(String sort, String name) throws Exception {
		String sql = "";
		if(sort.contentEquals("아이디")) { // 아이디 순으로 정렬할 경우 
			sql = "select * from lawyer where REGEXP_LIKE(name,?) order by 1";				
		}else if(sort.contentEquals("이름")) { // 이름 순으로 정렬할 경우
			sql = "select * from lawyer where REGEXP_LIKE(name,?) order by 3";
		}else if(sort.contentEquals("사무소이름")) { // 이름 순으로 정렬할 경우
			sql = "select * from lawyer where REGEXP_LIKE(name,?) order by 6";
		}
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "["+name+"]");
			try(ResultSet rs = pstat.executeQuery();){
				List<LawyerDTO> list = new ArrayList<>();
				while(rs.next()) {
					LawyerDTO dto = new LawyerDTO();
					dto.setId(rs.getString(1));
					dto.setPw(rs.getString(2));
					dto.setName(rs.getString(3));
					dto.setEmail(rs.getString(4));
					dto.setPhone(rs.getString(5));
					dto.setOffice_name(rs.getString(6));
					dto.setOffice_phone(rs.getString(7));
					dto.setOffice_zipcode(rs.getString(8));
					dto.setOffice_addr1(rs.getString(9));
					dto.setOffice_addr2(rs.getString(10));
					dto.setTest(rs.getString(11));
					dto.setTest_num(rs.getString(12));
					dto.setApproval(rs.getString(13));
					dto.setGender(rs.getString(14));
					dto.setBirth(rs.getTimestamp(15));
					list.add(dto);
				}
				return list;
			}
		}
	}
}
