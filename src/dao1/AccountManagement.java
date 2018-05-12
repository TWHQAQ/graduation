package dao1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Account;
import entity.Stock;
import entity.User;
import util.DBConnection;

public class AccountManagement {
	public void addAccount(String name, String type, float amount, String keywords,String username) throws Exception {
		String accountName = name;
		String accountType = type;
		float startAmount = amount;
		String keyword = keywords;
		Connection conn = null;
		PreparedStatement pst = null;
		String sql = "INSERT INTO `graduation_project`.`account`"
				+ " (`accountName`, `accountType`, `account_opening_time`,`startAmount`, `keyword`,`amount`,`username`)"
				+ " VALUES (?, ?,now(), ?, ?,?,?);";

		conn = new DBConnection().getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, accountName);
			pst.setString(2, accountType);
			pst.setFloat(3, startAmount);
			pst.setString(4, keyword);
			pst.setFloat(5, startAmount);
			pst.setString(6, username);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			// 释放语句对象
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
	
	public ArrayList<Account> getAllAccount(String username){
		String name = username;
		ArrayList<Account> list = new ArrayList<Account>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM graduation_project.account where username=?;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			rs = pst.executeQuery();
			while(rs.next()){
				Account a = new Account();
				a.setAccountName(rs.getString("accountName"));
				a.setAccountType(rs.getString("accountType"));
				a.setAccount_opening_time(rs.getDate("account_opening_time"));
				a.setStartAmount(rs.getFloat("startAmount"));
				a.setKeyword(rs.getString("keyword"));
				a.setAmount(rs.getFloat("amount"));
				list.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs!=null){
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pst!=null){
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
	
	public boolean addStock(Stock s) throws Exception {
		boolean flag = false;
		
		Connection conn = null;
		PreparedStatement pst = null;
		String sql = "INSERT INTO `graduation_project`.`stock` (`stockCode`, `stockName`, `cost`, `buyDate`,`accountName`,`username`)"
				+ " VALUES (?, ?, ?, ?, ?, ?);";

		conn = new DBConnection().getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, s.getStockCode());
			pst.setString(2, s.getStockName());
			pst.setFloat(3,s.getCost());
			pst.setDate(4, s.getBuyDate());
			pst.setString(5, s.getAccountName());
			pst.setString(6, s.getUsername());
			pst.executeUpdate();
			System.out.println(s.getAccountName());
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			// 释放语句对象
			if (pst != null) {
				try {
					pst.close();
					pst = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return flag;
	}
	
	public ArrayList<Stock> getAllStock(String str){
		String username = str;
		ArrayList<Stock> list = new ArrayList<Stock>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM graduation_project.stock where username=?;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			while(rs.next()){
				Stock s = new Stock();
				s.setAccountName(rs.getString("accountName"));
				s.setStockCode(rs.getString("stockCode"));
				s.setStockName(rs.getString("stockName"));
				s.setCost(rs.getFloat("cost"));
				s.setBuyDate(rs.getDate("buyDate"));
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs!=null){
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pst!=null){
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
	
	public boolean delete(String accountName,String username){
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pst = null;
		System.out.println(accountName+","+username);
		String sql = "DELETE FROM `graduation_project`.`account` WHERE `accountName`=? AND `username`=?;";
		conn = new DBConnection().getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, accountName);
			pst.setString(2, username);
			System.out.print("4");
			pst.executeUpdate();
			System.out.print("5");
			flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			// 释放语句对象
			if (pst != null) {
				try {
					pst.close();
					pst = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return flag;
	}
	
	public boolean saleStock(String code,String name){
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pst = null;
		System.out.println(code+","+name);
		String sql = "DELETE FROM `graduation_project`.`stock` WHERE `stockCode`=? AND `username`= ?;";
        /* 1.sql语句属性名称和属性值符号不同
         * 2.这是因为MySql运行在safe-updates模式下，该模式会导致非主键条件下无法执行update或者delete命令。
         * 执行命令SET SQL_SAFE_UPDATES = 0;修改下数据库模式
         * 
         * */
		conn = new DBConnection().getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, code);
			pst.setString(2, name);
			pst.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			// 释放语句对象
			if (pst != null) {
				try {
					pst.close();
					pst = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return flag;
	}
	
	public boolean updateAmount(float amount,String accountName,String username){
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pst = null;
		String sql = "UPDATE `graduation_project`.`account` SET `amount`=? WHERE `accountName`=? AND `username`=?";
		conn = new DBConnection().getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setFloat(1, amount);
			pst.setString(2, accountName);
			pst.setString(3, username);
			pst.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			// 释放语句对象
			if (pst != null) {
				try {
					pst.close();
					pst = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return flag;
	}
	
	public float getAmount(String accountName,String username){
		float amount = 0;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT amount FROM graduation_project.account where accountName=? and username=?;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, accountName);
			pst.setString(2, username);
			rs = pst.executeQuery();
			while(rs.next()){
				amount = rs.getFloat("amount");
			}
			System.out.println(amount);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs!=null){
				try {
					rs.close();
					rs = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pst!=null){
				try {
					pst.close();
					pst = null;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return amount;
	}
	
	

}
