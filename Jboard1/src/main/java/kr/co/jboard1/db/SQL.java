package kr.co.jboard1.db;

public class SQL {
	
	// User
	public static final String INSERT_USER = "INSERT INTO `user` SET "
											+ "`uid`=?,"
											+ "`pass`=SHA2(?, 256),"
											+ "`name`=?,"
											+ "`nick`=?,"
											+ " `email`=?,"
											+ " `hp`=?,"
											+ " `zip`=?,"
											+ " `addr1`=?,"
											+ " `addr2`=?,"
											+ " `regip`=?,"
											+ " `regDate`=NOW()";
	
	public static final String SELECT_USER = "SELECT * FROM `User` WHERE `uid`=? AND `pass`=SHA2(?, 256)";
	public static final String SELECT_COUNT_UID = "SELECT COUNT(*) FROM `user` WHERE `uid`=?";
	public static final String SELECT_COUNT_NICK = "SELECT COUNT(*) FROM `user` WHERE `nick`=?";
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(*) FROM `user` WHERE `email`=?";
	public static final String SELECT_COUNT_HP = "SELECT COUNT(*) FROM `user` WHERE `hp`=?";
	public static final String SELECT_TERMS = "SELECT * FROM `Terms`";
	
	// Article
	public final static String INSERT_ARTICLE = "INSERT INTO `Article` SET "
												+ "`title`=?, "
												+ "`content`=?, "
												+ "`writer`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";
	
	public final static String INSERT_COMMENT = "INSERT INTO `Article` SET "
												+ "`parent`=?, " //부모:글 자식:댓글
												+ "`content`=?, "
												+ "`writer`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";

	public final static String SELECT_ARTICLE = "SELECT * FROM `Article` WHERE `no`=?"; //데이터베이스에서 no 숫자이지만 문자열로 받아도됨
	public final static String SELECT_ARTICLES = "SELECT "
												+ "a.*, "
												+ "b.`nick` "
												+ "FROM `Article` AS a "
												+ "JOIN `User` AS b ON a.writer = b.uid "
												+ "WHERE `parent`=0 " // 원글(댓글제외)만 찾을 수 있도록
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10"; // 1페이지는 0 2페이지는 10 3페이지는 20
	
	public final static String SELECT_COMMENTS =  "SELECT "
												+ "a.*, "
												+ "b.`nick` " 
												+ "FROM `Article` AS a "
												+ "JOIN `User` AS b ON a.writer = b.uid "
												+ "WHERE `parent`=?"; // 총 12개 칼럼 나옴(Article테이블에 nick칼럼만 추가)
												
	public final static String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM `Article` WHERE `parent`=0"; // 원글(댓글제외)만 찾을 수 있도록
	
	public final static String UPDATE_ARTICLE = "UPDATE `Article` SET `title`=?, `content`=? WHERE `no`=?";
	public final static String UPDATE_ARTICLE_FOR_COMMENT_PLUS = "UPDATE `Article` SET `comment` = `comment` + 1 WHERE `no`=?";
	public final static String UPDATE_ARTICLE_FOR_COMMENT_MINUS = "UPDATE `Article` SET `comment` = `comment` - 1 WHERE `no`=?";
	
	public final static String DELETE_ARTICLE = "DELETE FROM `Article` WHERE `no`=? OR `parent`=?";
	public final static String DELETE_COMMENT = "DELETE FROM `Article` WHERE `no`=?";

	
												
												
}
