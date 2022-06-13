package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.JDBCConnection;
import VO.loginVO;

public class sessionDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	public loginVO login(loginVO vo) {
		loginVO returnVO = null;
		try {
			conn = JDBCConnection.getConnection();
			String sql = "select * from LOGIN where id=? and password=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassWord());
			rs = stmt.executeQuery();
			returnVO = new loginVO();
			if(rs.next()) {
				returnVO.setId(rs.getString("id"));
				returnVO.setPassWord(rs.getString("password"));
				returnVO.setGrade(rs.getString("grade"));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs,stmt,conn);
		}
		return returnVO;
	}
}
