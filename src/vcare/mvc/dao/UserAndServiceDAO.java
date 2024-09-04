package vcare.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vcare.mvc.beans.UserAndServiceConnectionBean;

public class UserAndServiceDAO {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static boolean flag = false;

	// ------------------START---------------get database connection------------------------
	/**
	 * 
	 * @author Devi
	 * @Date 15/04/2024
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
	
	// -------------------START--------------list UserANdServices------------------------------
	/**
	 * 
	 * @author Devi
	 * @Date 15/04/2024
	 * @param Nothing
	 * @see Nothing
	 * @return UserAndServiceConnectionBean Object
	 * @throws SQLException
	 * 
	 */

    public static List<UserAndServiceConnectionBean> getUsersWithServiceDetails() throws SQLException {
        List<UserAndServiceConnectionBean> userAndServiceList = new ArrayList<UserAndServiceConnectionBean>();
		con = getDbConnection();
		try{
			pst = con.prepareStatement("SELECT u.user_id, u.name, u.email_id, u.phone_number, u.address, "
                   + "s.service_id, s.service_name, sp.service_person_id, "
                   + "sp.qualification "
                   + "FROM users u "
                   + "JOIN service_person sp ON u.user_id = sp.person_id "
                   + "JOIN services s ON sp.service_id = s.service_id");
			rs = pst.executeQuery();
            while (rs.next()) {
                UserAndServiceConnectionBean userAndService = new UserAndServiceConnectionBean();
                userAndService.setUserId(rs.getInt("user_id"));
                userAndService.setName(rs.getString("name"));
                userAndService.setEmailId(rs.getString("email_id"));
                userAndService.setPhoneNumber(rs.getString("phone_number"));
                userAndService.setAddress(rs.getString("address"));
                userAndService.setServiceId(rs.getInt("service_id"));
                userAndService.setServiceName(rs.getString("service_name"));
                userAndService.setQualification(rs.getString("qualification"));
                userAndService.setService_person_id(rs.getInt("service_person_id"));
             
                userAndServiceList.add(userAndService);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions
        }

        return userAndServiceList;
    }
// -------------------END--------------list UserANdServices------------------------------
    
// -------------------START--------------list UserAndServiceDetailsByID------------------------------
	/**
	 * 
	 * @author Devi
	 * @Date 15/04/2024
	 * @param UserAndServiceConnectionBean Object
	 * @see Nothing
	 * @return UserAndServiceConnectionBean
	 * @throws SQLException
	 * 
	 */

    public static UserAndServiceConnectionBean getUsersWithServiceDetailsByID(UserAndServiceConnectionBean userServiceBean) throws SQLException {

        UserAndServiceConnectionBean userAndService = new UserAndServiceConnectionBean();
    	con = getDbConnection();
		try{
			pst = con.prepareStatement("SELECT u.user_id, u.name, u.email_id, u.phone_number, u.address, "
                   + "s.service_id, s.service_name, sp.service_person_id, "
                   + "sp.qualification "
                   + "FROM users u "
                   + "JOIN service_person sp ON u.user_id = sp.person_id "
                   + "JOIN services s ON sp.service_id = s.service_id WHERE u.user_id=?");
			pst.setInt(1,userServiceBean.getUserId() );
			rs = pst.executeQuery();
			while (rs.next()) {
                userAndService.setUserId(rs.getInt("user_id"));
                userAndService.setName(rs.getString("name"));
                userAndService.setEmailId(rs.getString("email_id"));
                userAndService.setPhoneNumber(rs.getString("phone_number"));
                userAndService.setAddress(rs.getString("address"));
                userAndService.setServiceId(rs.getInt("service_id"));
                userAndService.setServiceName(rs.getString("service_name"));
                userAndService.setQualification(rs.getString("qualification"));
                userAndService.setService_person_id(rs.getInt("service_person_id"));
             
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions
        }

        return userAndService;
    }
// -------------------END--------------list UserAndServiceDetailsByID------------------------------

 // -------------------START--------------list Staff Details By Service ID------------------------------
 	/**
 	 * 
 	 * @author Devi
 	 * @Date 15/04/2024
 	 * @param UserAndServiceConnectionBean Object
 	 * @see Nothing
 	 * @return UserAndServiceConnectionBean
 	 * @throws SQLException
 	 * 
 	 */

     public static List<UserAndServiceConnectionBean> getStaffDetailsByServiceID(UserAndServiceConnectionBean userServiceBean) throws SQLException {
    	        List<UserAndServiceConnectionBean> userAndServiceList = new ArrayList<UserAndServiceConnectionBean>();
    			con = getDbConnection();
    			try{
    				pst = con.prepareStatement("SELECT u.name, u.email_id, u.phone_number, u.address, "
    	                   + "sp.service_person_id, "
    	                   + "sp.qualification "
    	                   + "FROM users u "
    	                   + "JOIN service_person sp ON u.user_id = sp.person_id "
    	                   + "JOIN services s ON sp.service_id = s.service_id WHERE s.service_id=?");
    				pst.setInt(1, userServiceBean.getServiceId());
    				rs = pst.executeQuery();
    				
    	            while (rs.next()) {
    	                UserAndServiceConnectionBean userAndService = new UserAndServiceConnectionBean();
    	                userAndService.setName(rs.getString("name"));
    	                userAndService.setEmailId(rs.getString("email_id"));
    	                userAndService.setPhoneNumber(rs.getString("phone_number"));
    	                userAndService.setAddress(rs.getString("address"));
    	                userAndService.setQualification(rs.getString("qualification"));
    	                userAndService.setService_person_id(rs.getInt("service_person_id"));
    	             
    	                userAndServiceList.add(userAndService);
    	            }

    	        } catch (SQLException e) {
    	            e.printStackTrace();
    	            // Handle exceptions
    	        }

    	        return userAndServiceList;
    	    }
    // -------------------END--------------list Staff Details By Service ID------------------------------

    
    // ------------------START----------------Update User Details -------------------------

	/**
	 * 
	 * @author Devi
	 * @Date 15/04/2024
	 * @param UserBean Object
	 * @see Nothing
	 * @return boolean
	 * @throws SQLException
	 * 
	 */
	public static boolean updateUserAndService(UserAndServiceConnectionBean userAndServiceConnectionBean) throws SQLException {
		boolean flag = false;
		try {
			con = getDbConnection();
			con.setAutoCommit(false);
			
			pst = con.prepareStatement("UPDATE users SET name=?, email_id=?, phone_number=?, address=? WHERE  user_id=?");
			pst.setString(1, userAndServiceConnectionBean.getName());
			pst.setString(2, userAndServiceConnectionBean.getEmailId());
			pst.setString(3, userAndServiceConnectionBean.getPhoneNumber());
			pst.setString(4, userAndServiceConnectionBean.getAddress());
			pst.setInt(5, userAndServiceConnectionBean.getUserId());
			pst.executeUpdate();
			
			pst = con.prepareStatement("UPDATE service_person SET qualification=? WHERE service_person_id=?");
			pst.setString(1, userAndServiceConnectionBean.getQualification());
			pst.setInt(2, userAndServiceConnectionBean.getService_person_id());
			pst.executeUpdate();
			flag=true;
			con.commit();

		} catch (SQLException ex) {
			con.rollback();
			ex.printStackTrace();
		}
		return flag;
	}
// -------------------END-----------------Update User Details-------------------------


}
