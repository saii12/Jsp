package kr.farmsotry1.db;

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
	
	public static final String SELECT_TERMS = "SELECT * FROM `Terms`";
	
}
