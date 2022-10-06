package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {
	
	
	private Connection conn;	//db에 접근하는 객체
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public userDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "scott";
			String dbPassword = "tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//로그인 과정
	public int login(String u_id, String u_password) {
		String SQL = "SELECT u_password FROM tblUser WHERE u_id = ?"; 
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(u_password))
					return 1; //로그인 성공
				else
					return 0; //비밀번호 불일치
			}
			return -1; //아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	//회원가입 과정
	//한명의 사용자를 입력받고 userDTO 활용하여 하나의 인스턴스 만들기
	public int join(userDTO user) {
		String SQL = "INSERT INTO tblUser VALUES(?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getU_id());
			pstmt.setString(2, user.getU_password());
			pstmt.setString(3, user.getU_name());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	
	

}
