package vcare.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import vcare.mvc.beans.UserBean;

public class UserDAO {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static boolean flag = false;

	// ------------------START---------------get database
	// connection------------------------

	/**
	 * 
	 * @author Devi
	 * @Date 12/03/2024
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

	// ------------------START--------------User Login
	// Validation------------------------

	/**
	 * 
	 * @author Devi
	 * @Date 12/03/2024
	 * @param Nothing
	 * @see Nothing
	 * @return Connection
	 * @throws SQLException
	 * 
	 */

	public static UserBean userValidation(UserBean usBean) throws SQLException {
		UserBean userBean = new UserBean();
		try {
			con = getDbConnection();
			pst = con.prepareStatement("SELECT * FROM users WHERE user_name=? AND password=?");
			pst.setString(1, usBean.getUser_name());
			pst.setString(2, usBean.getPassword());
			rs = pst.executeQuery();
			while (rs.next()) {
				userBean.setUser_id(rs.getInt(1));
				userBean.setName(rs.getString(2));
				userBean.setEmail_id(rs.getString(3));
				userBean.setPhone_number(rs.getString(4));
				userBean.setAddress(rs.getString(5));
				userBean.setUser_role(rs.getString(6));
				userBean.setUser_name(rs.getString(7));
				userBean.setPassword(rs.getString(8));
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return userBean;
	}

	// ------------------END-----------------User Login
	// Validation--------------------------

	// ------------------START----------------insert
	// User---------------------------
	/**
	 * 
	 * @author Devi
	 * @Date 13/04/2024
	 * @param UserBean
	 *            Object
	 * @see Nothing
	 * @return generated primary key
	 * @throws SQLException
	 * 
	 */

	public static int insertUser(UserBean userBean) throws SQLException {
		boolean flag = false;
		int user_id = 0;
		try {
			con = getDbConnection();
			pst = con.prepareStatement(
					"insert into users(name, email_id, phone_number, address, user_role, user_name, password) values(?,?,?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			pst.setString(1, userBean.getName());
			pst.setString(2, userBean.getEmail_id());
			pst.setString(3, userBean.getPhone_number());
			pst.setString(4, userBean.getAddress());
			pst.setString(5, userBean.getUser_role());
			pst.setString(6, userBean.getUser_name());
			pst.setString(7, userBean.getPassword());

			pst.executeUpdate();

			flag = true;
			if (flag) {
				rs = pst.getGeneratedKeys();
				if (rs.next()) {
					user_id = rs.getInt(1);
				}
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return user_id;
	}
	// -------------------END-----------------insert
	// User-------------------------

	// ------------------START----------------Update User Details
	// -------------------------

	/**
	 * 
	 * @author Devi
	 * @Date 13/04/2024
	 * @param UserBean
	 *            Object
	 * @see Nothing
	 * @return boolean
	 * @throws SQLException
	 * 
	 */
	public static boolean updateService(UserBean userBean) throws SQLException {
		boolean flag = false;
		try {
			con = getDbConnection();
			pst = con.prepareStatement(
					"UPDATE users SET name=?, email_id=?, phone_number=?, address=? WHERE  user_id=?");
			pst.setString(1, userBean.getName());
			pst.setString(2, userBean.getEmail_id());
			pst.setString(3, userBean.getPhone_number());
			pst.setString(4, userBean.getAddress());
			pst.setInt(5, userBean.getUser_id());
			pst.executeUpdate();
			flag = true;

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
	}
	// -------------------END-----------------Update User Details-------------------------

	// ------------------START----------------Delete User -------------------------

	/**
	 * 
	 * @author Devi
	 * @Date 13/04/2024
	 * @param ServiceBean
	 *            Object
	 * @see Nothing
	 * @return boolean
	 * @throws SQLException
	 * 
	 */
	public static boolean deleteUser(UserBean userBean) throws SQLException {
		boolean flag = false;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("DELETE FROM users WHERE user_id =?");
			pst.setInt(1, userBean.getUser_id());
			pst.executeUpdate();
			flag = true;

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
	}
	// -------------------END-----------------Delete User-------------------------

}
