package lv.backend.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import lv.backend.dto.QuestionDTO;

public class QuestionDAO {

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/dbcp");

		return ds.getConnection();
	}

	public List<QuestionDTO> select(String table) throws Exception{
		String sql = "select * from "+table;
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();)
		{
			List<QuestionDTO> result = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String title = rs.getString("title");
				String answer = rs.getString("answer");
				QuestionDTO dto = new QuestionDTO(seq, title, answer);
				result.add(dto);
			}
			return result;

		}

	}




}