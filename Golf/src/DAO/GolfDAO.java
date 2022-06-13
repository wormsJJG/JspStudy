package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DB.JDBCConnection;
import VO.GetMemberVO;
import VO.addVO;
import VO.getTeacherInfoVO;
import VO.getTeacherSumFeeVO;
import VO.loginVO;
import VO.registerVO;
import VO.selectedVO;

public class GolfDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private String sql = null;

	public ArrayList<GetMemberVO> getMemberList() {
		ArrayList<GetMemberVO> list = null;
		try {
			conn = JDBCConnection.getConnection();
			sql = "SELECT CLASS_DATE, X.CLASS_NAME, TEACHER_NAME, Z.MEMBER_CODE, MEMBER_NAME, CLASS_AREA, TO_CHAR(z.PRICE,'FM999,999,999') PRICE\r\n" + 
					"FROM TBL_TEACHER X, TBL_MEMBER Y, TBL_CLASS Z\r\n" + 
					"WHERE X.CLASS_CODE=Z.CLASS_CODE AND Y.MEMBER_CODE=Z.MEMBER_CODE\r\n" + 
					"ORDER BY CLASS_DATE, Z.MEMBER_CODE";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			list = new ArrayList<GetMemberVO>();
			while (rs.next()) {
				GetMemberVO vo = new GetMemberVO();
				vo.setClassDate(rs.getString("class_date"));
				vo.setClassName(rs.getString("class_name"));
				vo.setTeacherName(rs.getString("teacher_name"));
				vo.setMemberCode(rs.getString("member_code"));
				vo.setMemberName(rs.getString("member_name"));
				vo.setClassArea(rs.getString("class_area"));
				vo.setPrice(rs.getString("price"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return list;
	}
	public ArrayList<getTeacherInfoVO> getTeacherInfoList() {
		ArrayList<getTeacherInfoVO> list = null;
		try {
			conn = JDBCConnection.getConnection();
			sql = "SELECT CLASS_CODE, TEACHER_NAME, CLASS_NAME, TO_CHAR(PRICE,'FM999,999') PRICE \r\n" + 
					"FROM TBL_TEACHER";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			list = new ArrayList<getTeacherInfoVO>();
			while (rs.next()) {
				getTeacherInfoVO vo = new getTeacherInfoVO();
				vo.setClassCode(rs.getString("class_code"));
				vo.setTeacherName(rs.getString("teacher_name"));
				vo.setClassName(rs.getString("class_name"));
				vo.setPrice(rs.getString("price"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return list;
	}
	public ArrayList<getTeacherSumFeeVO> getTeacherSumFee() {
		ArrayList<getTeacherSumFeeVO> list = null;
		try {
			conn = JDBCConnection.getConnection();
			sql = "SELECT X.CLASS_CODE, CLASS_NAME, TEACHER_NAME, TO_CHAR(SUM(Y.PRICE),'FM999,999,999') SUMPRICE\r\n" + 
					"FROM TBL_TEACHER X, TBL_CLASS Y\r\n" + 
					"WHERE X.CLASS_CODE=Y.CLASS_CODE\r\n" + 
					"GROUP BY X.CLASS_CODE, CLASS_NAME, TEACHER_NAME\r\n" + 
					"ORDER BY CLASS_CODE";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			list = new ArrayList<getTeacherSumFeeVO>();
			while (rs.next()) {
				getTeacherSumFeeVO vo = new getTeacherSumFeeVO();
				vo.setClassCode(rs.getString("class_code"));
				vo.setTeacherName(rs.getString("teacher_name"));
				vo.setClassName(rs.getString("class_name"));
				vo.setSumPrice(rs.getString("sumprice"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return list;
	}
	public int addClass(addVO vo) {
		int cnt = 0;
		try {
			conn = JDBCConnection.getConnection();
			sql = "insert into TBL_CLASS values(?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getClassDate());
			stmt.setString(2, vo.getMemberCode());
			stmt.setString(3, vo.getClassArea());
			stmt.setString(4, vo.getClassCode());
			stmt.setInt(5, vo.getPrice());
			cnt = stmt.executeUpdate();
			if(cnt>0) {
				conn.commit();
			}else {
				conn.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return cnt;
	}
	public ArrayList<selectedVO> getSelectMemberList(){
		ArrayList<selectedVO> list = new ArrayList<selectedVO>();
		try {
			conn = JDBCConnection.getConnection();
			sql = "select member_code, member_name from TBL_MEMBER";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				selectedVO vo = new selectedVO();
				vo.setOne(rs.getString("member_code"));
				vo.setTwo(rs.getString("member_name"));
				list.add(vo);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<selectedVO> getSelectClassList(){
		ArrayList<selectedVO> list = new ArrayList<selectedVO>();
		try {
			conn = JDBCConnection.getConnection();
			sql = "select class_code, class_name from TBL_TEACHER";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				selectedVO vo = new selectedVO();
				vo.setOne(rs.getString("class_code"));
				vo.setTwo(rs.getString("class_name"));
				list.add(vo);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public getTeacherInfoVO getTeacher(String classCode) {
		getTeacherInfoVO vo = new getTeacherInfoVO();
		try {
			conn = JDBCConnection.getConnection();
			sql = "SELECT * FROM TBL_TEACHER WHERE CLASS_CODE=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, classCode);
			rs = stmt.executeQuery();
			if(rs.next()) {
				vo.setClassCode(rs.getString("class_code"));
				vo.setClassName(rs.getString("class_name"));
				vo.setTeacherName(rs.getString("teacher_name"));
				vo.setIntPrice(rs.getInt("price"));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	public int updateTeacherInfo(getTeacherInfoVO vo) {
		int cnt = 0;
		try {
			conn=JDBCConnection.getConnection();
			sql = "update TBL_TEACHER set class_name=?, teacher_name=?, price=? where class_code=?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, vo.getClassName());
			stmt.setString(2, vo.getTeacherName());
			stmt.setInt(3, vo.getIntPrice());
			stmt.setString(4, vo.getClassCode());
			cnt = stmt.executeUpdate();
			if(cnt>0) {
				conn.commit();
			}else {
				conn.rollback();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	public String getMemberCode(String id) {
		String memberCode = "";
		try {
			conn = JDBCConnection.getConnection();
			sql = "select member_code from login where id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				memberCode = rs.getString("member_code");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberCode;
	}
	public selectedVO getMemberSelect(String memberCode) {
		selectedVO vo = new selectedVO();
		try {
			conn=JDBCConnection.getConnection();
			sql = "SELECT X.MEMBER_CODE, MEMBER_NAME FROM TBL_MEMBER X, LOGIN Y WHERE X.MEMBER_CODE = Y.MEMBER_CODE AND Y.MEMBER_CODE = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, memberCode);
			rs = stmt.executeQuery();
			if(rs.next()) {
				vo.setOne(rs.getString("member_code"));
				vo.setTwo(rs.getString("member_name"));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int registerMember(registerVO vo) {
		int cnt=0;
		try {
			conn = JDBCConnection.getConnection();
			
			sql = "INSERT INTO TBL_MEMBER VALUES(?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, vo.getMember_code());
			stmt.setString(2, vo.getMember_name());
			stmt.setString(3, vo.getIndate());
			stmt.setString(4, vo.getAddress());
			stmt.setString(5, vo.getGrade());
			
			cnt = stmt.executeUpdate();
			if(cnt>0) conn.commit();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return cnt;
	}
	public String findId(String name) {
		String id = "";
		try {
			conn = JDBCConnection.getConnection();
			sql = "select id from LOGIN x, TBL_MEMBER y where member_name = ? and x.member_code=y.member_code ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	public String findPassWord(String id, String memberCode) {
		String passWord = "";
		try {
			conn = JDBCConnection.getConnection();
			sql = "select password from LOGIN x where id=? and member_code =? ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, memberCode);
			rs = stmt.executeQuery();
			if(rs.next()) {
				passWord = rs.getString("password");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return passWord;
	}
	public ArrayList<String> getID(){
		ArrayList<String> list = new ArrayList<String>();
		try {
			conn = JDBCConnection.getConnection();
			sql = "select id from LOGIN";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("id"));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public int addLogin(loginVO vo) {
		int cnt = 0;
		try {
			conn = JDBCConnection.getConnection();
			sql = "INSERT INTO LOGIN VALUES(?,?,?,?) ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassWord());
			stmt.setString(3, vo.getMemberCode());
			stmt.setString(4, vo.getGrade());
			cnt = stmt.executeUpdate();
			if(cnt>0) {
				conn.commit();
			}else {
				conn.rollback();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
		
	}
	public ArrayList<Integer> getNoList(){
		ArrayList<Integer> list = new ArrayList<Integer>();
		try {
			conn = JDBCConnection.getConnection();
			sql = "select to_number(member_code) member_code from LOGIN";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt("member_code"));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
		
	
}