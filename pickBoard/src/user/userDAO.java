package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {
	
	
	private Connection conn;	//db�� �����ϴ� ��ü
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
	
	//�α��� ����
	public int login(String u_id, String u_password) {
		String SQL = "SELECT u_password FROM tblUser WHERE u_id = ?"; 
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(u_password))
					return 1; //�α��� ����
				else
					return 0; //��й�ȣ ����ġ
			}
			return -1; //���̵� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //�����ͺ��̽� ����
	}
	
	//ȸ������ ����
	//�Ѹ��� ����ڸ� �Է¹ް� userDTO Ȱ���Ͽ� �ϳ��� �ν��Ͻ� �����
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
		return -1; //�����ͺ��̽� ����
	}
	
	
	

}
