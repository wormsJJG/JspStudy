package Test;

import java.util.ArrayList;

import DAO.GolfDAO;
import DAO.sessionDAO;
import VO.addVO;
import VO.loginVO;

public class test {

	public static void main(String[] args) {
		GolfDAO dao = new GolfDAO();

		ArrayList<String> list = dao.getID();
		for(String s: list) {
			System.out.println(s);
		}
	}
	

}
