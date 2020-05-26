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
import lv.backend.dto.RequestDTO;

public class ClientDAO {
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/dbcp");
		return ds.getConnection();
	}

	// 의뢰자 회원가입 DB 입력
	public int clientInsert(String id, String pw, String name, String email, String phone, String birth)
			throws SQLException, Exception {
		String sql = "insert into client values (?,?,?,?,?,?)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, id);
			pstat.setString(2, pw);
			pstat.setString(3, name);
			pstat.setString(4, email);
			pstat.setString(5, phone);
			pstat.setString(6, birth);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	// client 테이블에서 id 중복체크
	// 중복된다면 false 배출
	// 중복안된다면 true 배출
	public boolean isIdAvailable(String id) throws SQLException, Exception {
		String sql = "select * from client where id=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, id);
			try (ResultSet rs = pstat.executeQuery();) {
				return !rs.next();
			}
		}
	}

	// 의뢰자 정보출력
	public ClientDTO cSelect(String id) throws SQLException, Exception {
		String sql = "select * from client where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, id);
			try (ResultSet rs = pstat.executeQuery();) {

				ClientDTO cdto = null;
				if (rs.next()) {
					String cid = rs.getString("id");
					String cpw = rs.getString("pw");
					String cname = rs.getString("name");
					String cemail = rs.getString("email");
					String cphone = rs.getString("phone");
					Timestamp cbirth = rs.getTimestamp("birth");
					if(cbirth == null) {
						cdto = new ClientDTO(cid, cpw, cname, cemail, cphone);
					}else {
						cdto = new ClientDTO(cid, cpw, cname, cemail, cphone, cbirth);
					}
				}
				return cdto;
			}
		}
	}

	//의뢰자 정보수정
	public int clientModify(String id, String pw, String name, String email, String phone, String birth) throws SQLException, Exception {
		String sql = "update client set pw = ? , name = ?, email = ?, phone = ? , birth = ? where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, pw);
			pstat.setString(2, name);
			pstat.setString(3, email);
			pstat.setString(4, phone);
			pstat.setString(5, birth);
			pstat.setString(6, id);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	//의뢰자 회원 탈퇴
	public int clientDelete(String id) throws SQLException, Exception {
		String sql = "delete from client where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	//의뢰자 비밀번호 확인
	public boolean pwDuplCheck(String id, String pw) throws Exception {
		String sql = "select * from client where id = ? and pw = ?";
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

	//의뢰자 의뢰내용 출력
	public List<RequestDTO> selectClientlist(String id) throws SQLException, Exception{
		String sql = "select * from request_board where id = ?";
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
	// 아이디로 검색
	public ClientDTO selectById(String id) throws Exception{
		String sql = "select * from client where id=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();){
				ClientDTO dto = new ClientDTO();
				if(rs.next()) {
					dto.setId(rs.getString(1));
					dto.setPw(rs.getString(2));
					dto.setName(rs.getString(3));
					dto.setEmail(rs.getString(4));
					dto.setPhone(rs.getString(5));
					dto.setBirth(rs.getTimestamp(6));
				}
				return dto;
			}
		}
	}
	// 로그인 성공
	public boolean loginSuccessful(String id,String pw) throws Exception{
		String sql = "select * from client where id=? and pw=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			pstat.setString(2, pw);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();				
			}
		}
	}
	// 여기서부터 예지수정 : 의뢰 목록 조회 
	public List<ClientDTO> selectAll() throws Exception{
		String sql = "select * from client";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			List<ClientDTO> list = new ArrayList<>();
			while(rs.next()) {
				ClientDTO dto = new ClientDTO();
				dto.setId(rs.getString(1));
				dto.setPw(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setPhone(rs.getString(5));
				dto.setBirth(rs.getTimestamp(6));
				list.add(dto);
			}
			return list;
		}
	}
	// 회원 검색
	public List<ClientDTO> selectByName(String sort, String name) throws Exception {
		String sql = "";
		if(sort.contentEquals("아이디")) { // 아이디 순으로 정렬할 경우 
			sql = "select * from client where REGEXP_LIKE(name,?) order by 1";				
		}else if(sort.contentEquals("이름")) { // 이름 순으로 정렬할 경우
			sql = "select * from client where REGEXP_LIKE(name,?) order by 3";
		}
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "["+name+"]");
			try(ResultSet rs = pstat.executeQuery();){
				List<ClientDTO> list = new ArrayList<>();
				while(rs.next()) {
					ClientDTO dto = new ClientDTO();
					dto.setId(rs.getString(1));
					dto.setPw(rs.getString(2));
					dto.setName(rs.getString(3));
					dto.setEmail(rs.getString(4));
					dto.setPhone(rs.getString(5));
					dto.setBirth(rs.getTimestamp(6));
					list.add(dto);
				}
				return list;
			}
		}
	}
}
