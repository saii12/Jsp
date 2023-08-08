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
	public static final String INSERT_ARTICLE = "INSERT INTO `Article` SET "
												+ "`title`=?, "
												+ "`content`=?, "
												+ "`writer`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";

	public final static String SELECT_ARTICLES = "SELECT "
												+ "a.*, "
												+ "b.`nick` "
												+ "FROM `Article` AS a "
												+ "JOIN `User` AS b ON a.writer = b.uid "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10"; // 1페이지는 0 2페이지는 10 3페이지는 20
	
	public final static String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM `Article`";
												
												
}
