package kr.co.jboard1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.SQL;
import kr.co.jboard1.dto.TermsDTO;
import kr.co.jboard1.dto.UserDTO;

public class UserDAO extends DBHelper { // UserDAO 클래스를 만드는 이유는 여러 메서드를 실행하기 위한 틀

	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	public void insertUser(UserDTO dto) {
		
		try{
			conn = getConnection();
			
			
			psmt = conn.prepareStatement(SQL.INSERT_USER);
			
			
			psmt.setString(1, dto.getUid()); // 객체의 속성을 이용해서 파라미터 지정
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getNick());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getHp());
			psmt.setString(7, dto.getZip());
			psmt.setString(8, dto.getAddr1());
			psmt.setString(9, dto.getAddr2());
			psmt.setString(10, dto.getRegip());
			
			
			psmt.executeUpdate();
			close();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public UserDTO selectUser(String uid, String pass) {
		
		UserDTO user = null;
		try{
			
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_USER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			rs = psmt.executeQuery(); // rs 객체는 하나의 레이블이고, 13개의 칼럼을 가지고 있음
			
			if(rs.next()){
				user = new UserDTO(); // 객체생성
				user.setUid(rs.getString(1));
				user.setPass(rs.getString(2));
				user.setName(rs.getString(3));
				user.setNick(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setHp(rs.getString(6));
				user.setRole(rs.getString(7));
				user.setZip(rs.getString(8));
				user.setAddr1(rs.getString(9));
				user.setAddr2(rs.getString(10));
				user.setRegip(rs.getString(11));
				user.setRegDate(rs.getString(12));
				user.setLeaveDate(rs.getString(13));
				
			}
			close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return user; // loginProc에서 user객체를 이용하기 때문에 리턴값을 user로 해준다
	}
			
	public int selectCountUid(String uid) { // String uid 변수 선언 해줘야 psmt.setString(1, uid)에서 참조할 수 있다
		int result = 0;
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_UID); // count값이 1 이면 중복, 0이면 아이디 가능
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1); // 쿼리 실행하면 count 칼럼에 숫자 들어감 / 1번 칼럼 즉, count 값을 result로
			}
			close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public int selectCountNick(String nick) {
		int result = 0;
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_NICK);
			psmt.setString(1, nick);
			rs = psmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
			close();
		}catch(Exception e){
				e.printStackTrace();
			}
		return result;
	}
	
	public int selectCounthp(String hp) {
		int result = 0;
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_HP);
			psmt.setString(1, hp);
			rs = psmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
			close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public int selectCountEmail(String email) {
		int result = 0;
		try{
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_EMAIL);
			psmt.setString(1, email);
			rs = psmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
			close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public TermsDTO selectTerms() {
		TermsDTO dto = new TermsDTO();
		
		try{
			conn = getConnection();
			stmt = conn.createStatement(); //preparedStatement는 안되는감?? preparedStatement는 파라미터 있을 때 쓴다???
			rs = stmt.executeQuery(SQL.SELECT_TERMS);
			
			if(rs.next()){
				dto.setTerms(rs.getString(1));
				dto.setPrivacy(rs.getString(2));
			}
			close();
			
			}catch(Exception e){
				e.printStackTrace();
			}
		return dto;
	}
	
	public void selectUsers() {}
	public void updateUser() {}
	public void deletetUser() {}
}
