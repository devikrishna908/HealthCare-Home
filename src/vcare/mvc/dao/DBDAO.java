package vcare.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBDAO {
	private static Connection dbCon;
	private static String dbURL;
	private static String dbDriver;
	private static String userName;
	private static String passWord;

	// ---------------------START--------------------database initialization---------------
	/**
	 *
	 *
	 * @author: Devi
	 * @Date: 12/04/2024
	 * @version : 1.0
	 * @purpose :Initialize database connection values
	 * @param : Nothing
	 * @see : Nothing
	 * @return: Nothing
	 * 
	 */
	private static void dbInit(){
		try {
			dbDriver = "com.mysql.cj.jdbc.Driver";
			dbURL = "jdbc:mysql://localhost:3306/vcarejsp";
			userName = "root";
			passWord = "mysql";

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//------------------------END---------------------database initialization---------------

	
	
	//------------------------START-------------------database connection ------------------
	/**
	*
	*
	* @author: Devi
	* @Date: 12/04/2024
	* @version : 1.0
	* @purpose : database connection
	* @param : Nothing
	* @throws : Exception in case of missing driver class
	* @return: Connection
	* 
	*/

	public static void connect()throws ClassNotFoundException,SQLException{
	dbInit();
	Connection con = null;
	
	try{
		Class.forName(dbDriver);
		con=DriverManager.getConnection(dbURL,userName,passWord);
		setDbCon(con);
		}catch(ClassNotFoundException cnfe){
			cnfe.printStackTrace();
		}catch(SQLException ex){
			ex.printStackTrace();
		}
	}

	//--------------------------END---------------------database connection ------------------
	
	
	
	//--------------------------START-------------------get db connection --------------------
	/**
	*
	*
	* @author : Devi
	* @date : 27/03/2024
	* @version: 1.0
	* @purpose: Get Connection
	* @param : Nothing
	* @return : Connection
	* 
	*/

	public static Connection getDbCon(){
		return dbCon;
	}
	//-------------------------END----------------------get db connection------------------------

	
	
	//-------------------------START-------------------set db connection ---------------------

	/**
	*
	*
	* @author : Devi
	* @date : 12/04/2024
	* @version: 1.0
	* @purpose: Set Connection
	* @param : Connection
	* @return : Nothing
	* 
	*/

	public static void setDbCon(Connection con){
		dbCon=con;
	}
	
	//---------------------------END----------------------set db connection------------------------
	
	
	
	//--------------------------START-------------------closing connection ------------

	/**
	*
	*
	* @author : Devi
	* @date : 12/04/2024
	* @version: 1.0
	* @purpose: Close connection
	* @param : Nothing
	* @throws :Exception in case of closing connection
	* @return : Nothing
	* 
	*/

	public static void close()throws SQLException{
		dbCon.close();
	}
	
	//--------------------------END-------------------closing connection---------
}
