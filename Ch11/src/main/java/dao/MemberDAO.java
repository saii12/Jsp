package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.tomcat.util.descriptor.web.ContextResource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import dto.MemberDTO;

public class MemberDAO {

	public static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	private MemberDAO() {}
	
	// 로거 생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertMember(MemberDTO dto) {
		
		try {
			logger.info("MemberDAO inserMember...1");
			
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");		
			Connection conn = ds.getConnection();
			
			PreparedStatement psmt = conn.prepareStatement("INSERT INTO `member` VALUES (?, ?, ?, ?, ?, NOW())");
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getHp());
			psmt.setString(4, dto.getPos());
			psmt.setInt(5, dto.getDep());
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
				
		}catch (Exception e) {
			logger.error("MemberDAO insertMember error : " + e.getMessage());
		}
		
	}
	
	public MemberDTO selectMember(String uid) {

		MemberDTO member = new MemberDTO();
		
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");		
			Connection conn = ds.getConnection();
			
			PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `member` WHERE `uid`=?");
			psmt.setString(1, uid);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {

				member.setUid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setHp(rs.getString(3));
				member.setPos(rs.getString(4));
				member.setDep(rs.getString(5));
				member.setRdate(rs.getString(6));
			}
			
			rs.close();
			psmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public List<MemberDTO> selectMembers() {
		
		List<MemberDTO> members = new ArrayList<MemberDTO>();
		
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");		
			Connection conn = ds.getConnection();
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM `member`");
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setUid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setHp(rs.getString(3));
				member.setPos(rs.getString(4));
				member.setDep(rs.getString(5));
				member.setRdate(rs.getString(6));
				members.add(member);
			}
			
			rs.close();
			stmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return members;
	}
	
	public void updateMember(MemberDTO dto) {
		
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");		
			Connection conn = ds.getConnection();
			
			PreparedStatement psmt = conn.prepareStatement("UPDATE `member` SET `name`=?, `hp`=?, `pos`=?, `dep`=? WHERE `uid`=?");
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getHp());
			psmt.setString(3, dto.getPos());
			psmt.setInt(4, dto.getDep());
			psmt.setString(5, dto.getUid());
			psmt.executeUpdate();
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public void deleteMember(String uid) {
		
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
			Connection conn = ds.getConnection();
			
			PreparedStatement psmt = conn.prepareStatement("DELETE FROM `member` WHERE `uid`=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}






