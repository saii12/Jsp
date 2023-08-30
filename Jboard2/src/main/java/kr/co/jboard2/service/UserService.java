package kr.co.jboard2.service;

import java.util.List;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.dto.UserDTO;

public class UserService {
	private static UserService instance = new UserService();
	public static UserService getInstance() {
		return instance;
	}
	private UserService() {}
	
	private static String generatedCode;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserDAO dao = UserDAO.getInstance();

	public void insertUser(UserDTO dto) {
		dao.insertUser(dto);
	}
	
	public int selectCountUid(String uid) {
		return dao.selectCountUid(uid);
	}
	
	public int selectCountNick(String nick) {
		return dao.selectCountNick(nick);
	}
	
	public int selectCountHp(String hp) {
		return dao.selectCountHp(hp);
	}
	
	public int selectCountEmail(String email) {
		return dao.selectCountEmail(email);
	}
	
	public int selectCountNameAndEmail(String name, String email) {
		return dao.selectCountNameAndEmail(name, email);
	}
	
	public int selectCountUidAndEmail(String uid, String email) {
		return dao.selectCountNameAndEmail(uid, email);
	}
	
	public UserDTO selectUser(String uid, String pass) {
		return dao.selectUser(uid, pass);
	}
	
	public UserDTO selectUserByNameAndEmail(String name, String email) {
		return dao.selectUserByNameAndEmail(name, email);
	}
	
	public List<UserDTO> selectUsers() {
		return dao.selectUsers();
	}
	public void updateUser(UserDTO dto) {
		dao.updateUser(dto);
	}
	
	public int updateUserPass(String uid, String pass) {
		return dao.updateUserPass(uid, pass);
	}
	
	public int updateUserForWithdraw(String uid) {
		return dao.updateUserForWithdraw(uid);
	}
	
	public void deleteUser(String uid) {
		dao.deleteUser(uid);
	}
	
	public int sendCodeByEmail(String receiver) {
		
		// 인증코드 생성
		int code = ThreadLocalRandom.current().nextInt(100000, 1000000);
		generatedCode = ""+code;
		
		// 기본정보
		String sender = "hansan9611@gmail.com";
		String password = "cdcelknzyvxywzqb";
		String title = "Jboard2 인증코드입니다.";
		String content = "<h1>인증코드는 " + code + "</h1>";
		
		// Gmail SMTP 서버 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		// Gmail STMP 세션 생성
		Session gmailSession = Session.getInstance(props, new Authenticator(){ // 여기서 Session은 javax.mail.session 객체
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		}); 
		
		
		// 메일 발송
		int status = 0;
		Message message = new MimeMessage(gmailSession);
		
		try{
			logger.info("here1...");
			message.setFrom(new InternetAddress(sender, "보내는 사람", "UTF-8"));
			logger.info("here2...");
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			logger.info("here3...");
			message.setSubject(title);
			logger.info("here4...");
			message.setContent(content, "text/html;charset=UTF-8");
			logger.info("here5...");
			Transport.send(message);
			logger.info("here6...");
			status = 1;
			
		}catch(Exception e){
			status = 0;
			logger.error("here7... : " + e.getMessage());
		}
		
		return status;
	} // sendCodeByEmail end
	
	public int confirmCodeByEmail(String code) { // 사용자가 인증코드 창에 입력한 code
		
		if(code.equals(generatedCode)) {
			logger.info("return 1...");
			return 1;
		}else {
			logger.info("return 0...");
			return 0;
		}
		
	}
}
