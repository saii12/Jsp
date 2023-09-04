package kr.co.farmstory2.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.db.DBHelper;
import kr.co.farmstory2.db.SQL;
import kr.co.farmstory2.dto.TermsDTO;

public class TermsDAO extends DBHelper {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public TermsDTO selectTerms() { // 매개변수 필요없음
		TermsDTO dto = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_TERMS);
			
			if(rs.next()) {
				dto = new TermsDTO();
				dto.setPrivacy(rs.getString(1));
				dto.setTerms(rs.getString(2));
			}
			close();
			
		}catch (Exception e) {
			logger.error("selectTerms() : " + e.getMessage());
		}
		return dto;
	}
	
}
