package lv.backend.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import lv.backend.dto.RequestCommentsDTO;

public class RequestCommentsDAO {
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/dbcp");
		return ds.getConnection();
	}
	public int insert(int parent_seq, String writer, String id, String contents) throws Exception{
		String sql = "insert into request_comments values(comments_seq.nextval,?,?,default,?,?)";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, parent_seq);
			pstat.setString(2, writer);
			pstat.setString(3, id);
			pstat.setString(4, contents);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public List<RequestCommentsDTO> selectByPseq(int pseq) throws Exception {
		String sql = "select * from request_comments where parent_seq=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, pseq);
			try(ResultSet rs = pstat.executeQuery();){
				List<RequestCommentsDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt(1);
					int parent_seq = rs.getInt(2);
					String writer = rs.getString(3);
					Timestamp write_date = rs.getTimestamp(4);
					String id = rs.getString(5);
					String contents = rs.getString(6);
					list.add(new RequestCommentsDTO(seq,parent_seq,writer,write_date,id,contents));
				}
				return list;
			}
		}
	}
	public int countCmt(int pseq) throws Exception{
		String sql = "select count(*) from request_comments where parent_seq=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, pseq);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);
			}
		}
	}
}
