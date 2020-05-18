package lv.backend.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import lv.backend.dto.FileDTO;

public class FileDAO {
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/dbcp");
		return ds.getConnection();
	}
	public int insert(String sysFileName, String oriFileName) throws Exception{
		String sql = "insert into attach_file values(attach_file_seq.nextval,?,?,board_seq.currval)";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, sysFileName);
			pstat.setString(2, oriFileName);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public List<FileDTO> selectByPseq(int parent_seq) throws Exception{
		String sql = "select * from attach_file where parent_seq=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, parent_seq);
			try(ResultSet rs = pstat.executeQuery();){
				List<FileDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt(1);
					String sysFileName = rs.getString(2);
					String oriFileName = rs.getString(3);
					list.add(new FileDTO(seq, sysFileName, oriFileName, parent_seq));
				}
				return list;
			}
		}
	}
}
