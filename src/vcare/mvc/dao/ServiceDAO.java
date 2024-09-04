package vcare.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vcare.mvc.beans.ServiceBean;

public class ServiceDAO {

	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static boolean flag = false;

	// ------------------START---------------get database connection------------------------
	/**
	 * 
	 * @author Devi
	 * @Date 12/04/2024
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

	// ------------------END-----------------get database connection--------------------

	// -------------------START--------------list Services------------------------------
	/**
	 * 
	 * @author Devi
	 * @Date 12/04/2024
	 * @param ServiceBean Object
	 * @see Nothing
	 * @return Boolean
	 * @throws SQLException
	 * 
	 */
	
	public static ArrayList<ServiceBean> getAllServices() throws SQLException {

		ArrayList<ServiceBean> serviceBean = new ArrayList<ServiceBean>();

		con = getDbConnection();

		try {
			pst = con.prepareStatement("SELECT * FROM services");
			rs = pst.executeQuery();

			while (rs.next()) {
				ServiceBean services = new ServiceBean();
				services.setService_id(rs.getInt(1));
				services.setService_name(rs.getString(2));
				services.setPrice(rs.getDouble(3));
				serviceBean.add(services);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return serviceBean;
	}

	// --------------END -------------------------list Services------------------------
	
	// ------------------START----------------insert service---------------------------
	/**
	 * 
	 * @author Devi
	 * @Date 12/04/2024
	 * @param ServiceBean Object
	 * @see Nothing
	 * @return Boolean
	 * @throws SQLException
	 * 
	 */

	public static boolean insertService(ServiceBean serviceBean) throws SQLException {
		boolean flag = false;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("insert into services(service_name, price) values(?,?)");
			pst.setString(1,serviceBean.getService_name());
			pst.setDouble(2, serviceBean.getPrice());

			pst.executeUpdate();
			flag = true;

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
	}
	// -------------------END-----------------insert service-------------------------
	
	
	// -------------------START--------------Get Category Details By ID--------------
	/**
	 * 
	 * @author Devi
	 * @Date 12/04/2024
	 * @param ServiceBean Object
	 * @see Nothing
	 * @return ServiceBean object
	 * @throws SQLException
	 * 
	 */
	public static ServiceBean getServiceDetailsById(ServiceBean serviceBean) throws SQLException {

		con = getDbConnection();
		ServiceBean service = new ServiceBean();
		try {
			pst = con.prepareStatement("SELECT * FROM services WHERE service_id=?");
			pst.setInt(1, serviceBean.getService_id());
			rs = pst.executeQuery();

			while (rs.next()) {
				service.setService_id(rs.getInt(1));
				service.setService_name(rs.getString(2));
				service.setPrice(rs.getDouble(3));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return service;
	}

// --------------END ----------------Get Category Details By ID---------------------
	
// ------------------START----------------Update Service -------------------------

	/**
	 * 
	 * @author Devi
	 * @Date 12/04/2024
	 * @param ServiceBean Object
	 * @see Nothing
	 * @return boolean
	 * @throws SQLException
	 * 
	 */
	public static boolean updateService(ServiceBean serviceBean) throws SQLException {
		boolean flag = false;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("update services set service_name = ?, price=? WHERE service_id =?");
			pst.setString(1, serviceBean.getService_name());
			pst.setDouble(2, serviceBean.getPrice());
			pst.setInt(3, serviceBean.getService_id());
			pst.executeUpdate();
			flag = true;

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
	}
// -------------------END-----------------Update Service-------------------------

// ------------------START----------------Delete Service -------------------------

		/**
		 * 
		 * @author Devi
		 * @Date 12/04/2024
		 * @param ServiceBean Object
		 * @see Nothing
		 * @return boolean
		 * @throws SQLException
		 * 
		 */
		public static boolean deleteService(ServiceBean serviceBean) throws SQLException {
			boolean flag = false;
			try {
				con = getDbConnection();
				pst = con.prepareStatement("DELETE FROM services WHERE service_id =?");
				pst.setInt(1, serviceBean.getService_id());
				pst.executeUpdate();
				flag = true;

			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return flag;
		}
	// -------------------END-----------------Delete Service-------------------------


}
