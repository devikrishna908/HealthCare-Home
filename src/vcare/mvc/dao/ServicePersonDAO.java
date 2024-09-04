package vcare.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vcare.mvc.beans.ServicePersonBean;

public class ServicePersonDAO {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static boolean flag = false;

	// ------------------START---------------get database
	// connection------------------------

	/**
	 * 
	 * @author Devi
	 * @Date 13/04/2024
	 * @param Nothing
	 * @see Nothing
	 * @return Connection
	 * @throws SQLException
	 * 
	 */

	public static Connection getDbConnection() throws SQLException {
		try {
			DBDAO.connect();
			con = DBDAO.getDbCon();
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	// ------------------END-----------------get database
	// connection--------------------
	
	// ------------------START----------------Update service_person Details -------------------------

	/**
	 * 
	 * @author Devi
	 * @Date 13/04/2024
	 * @param ServicePerson Object
	 * @see Nothing
	 * @return boolean
	 * @throws SQLException
	 * 
	 */
	public static boolean updateService(ServicePersonBean servicepersonBean) throws SQLException {
		boolean flag = false;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("UPDATE service_person SET qualification=? WHERE service_person_id=?");
			pst.setString(1, servicepersonBean.getQualification());
			pst.setInt(2, servicepersonBean.getService_person_id());
			pst.executeUpdate();
			flag = true;

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
	}
// -------------------END-----------------Update service_person Details-------------------------
	
// ------------------START----------------insert service_person---------------------------
	/**
	 * 
	 * @author Devi
	 * @Date 13/04/2024
	 * @param ServiceBean Object
	 * @see Nothing
	 * @return Boolean
	 * @throws SQLException
	 * 
	 */

	public static boolean insertServicePerson(ServicePersonBean servicePersonBean) throws SQLException {
		boolean flag = false;
		try {
			con = getDbConnection();
			
			pst = con.prepareStatement("insert into service_person(service_id, person_id, qualification) values(?,?,?)");
			pst.setInt(1,servicePersonBean.getService_id());
			pst.setInt(2,servicePersonBean.getPerson_id());
			pst.setString(3, servicePersonBean.getQualification());
			
			pst.executeUpdate();
			flag = true;

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
	}
// -------------------END-----------------insert service_person-------------------------


}
