package dao1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import entity.User;
import util.DBConnection;

public class SystemFunction {
	public void addUser(String name, String pword, String e) throws Exception {
		String username = name;
		String password = pword;
		String email = e;
		Connection conn = null;
		PreparedStatement pst = null;
		String sql = "INSERT INTO `graduation_project`.`user` (`username`, `password`, `register_time`,`email`) VALUES (?, ?, now(),?);";

		conn = new DBConnection().getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			pst.setString(3, email);
			pst.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {

			//  Õ∑≈”Ôæ‰∂‘œÛ
			if (pst != null) {
				try {
					pst.close();
					pst = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}

	}

	public ArrayList<User> getUser() {
		ArrayList<User> list = new ArrayList<User>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM graduation_project.user;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setUsernmae(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setRegister_time(rs.getDate("register_time"));
				u.setEmail(rs.getString("email"));
				list.add(u);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pst != null) {
				try {
					pst.close();
					pst = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	public void changeStatus(String name) {
		String username = name;
		Connection conn = null;
		PreparedStatement pst = null;
		String sql = "UPDATE `graduation_project`.`user` SET `status`='1' WHERE `username`=?;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pst != null) {
				try {
					pst.close();
					pst = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}
	}

	public String getUserByStatus() {
		String username = null;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT username FROM graduation_project.user where status=1;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			System.out.println(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pst != null) {
				try {
					pst.close();
					pst = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return username;
	}

	public User getUserByUsername(String name) {
		User u = new User();
		String username = name;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM graduation_project.user where username=?;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			while (rs.next()) {
				u.setEmail(rs.getString("email")); 
				u.setRegister_time(rs.getDate("register_time"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pst != null) {
				try {
					pst.close();
					pst = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return u;
	}
	
	public void changePasswordByUsername(String name,String pass) {
		String username = name;
		String password = pass;
		Connection conn = null;
		PreparedStatement pst = null;
		String sql = "UPDATE `graduation_project`.`user` SET `password`=? WHERE `username`=?;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, password);
			pst.setString(2, username);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pst != null) {
				try {
					pst.close();
					pst = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}
	}

}
