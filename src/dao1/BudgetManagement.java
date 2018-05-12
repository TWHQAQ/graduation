package dao1;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Account;
import entity.Budget;
import util.DBConnection;

public class BudgetManagement {
	public boolean addBudget(Budget b){
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pst = null;
		String sql = "INSERT INTO `graduation_project`.`budget` "
				+ "(`budgetStart`, `budgetEnd`, `food`, `communication`, `traffic`, `medicine`,"
				+ " `entertainment`, `sport`, `clothing`, `books`, `tourism`, `cashGift`, `housingLoan`,`username`)"
				+ " VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?,?);";

		conn = new DBConnection().getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setDate(1, b.getBudgetStart());
			pst.setDate(2, b.getBudgetEnd());
			pst.setFloat(3, b.getFood());
			pst.setFloat(4, b.getCommunication());
			pst.setFloat(5, b.getTraffic());
			pst.setFloat(6,b.getMedicine() );
			pst.setFloat(7, b.getEntertainment());
			pst.setFloat(8,b.getSport() );
			pst.setFloat(9,b.getClothing() );
			pst.setFloat(10, b.getBooks());
			pst.setFloat(11, b.getTourism());
			pst.setFloat(12, b.getCashGift());
			pst.setFloat(13,b.getHousingLoan() );
			pst.setString(14, b.getUsername());
			pst.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		return flag;
	}
	
	public ArrayList<Budget> getAllBudget(String str){
		String username = str;
		ArrayList<Budget> list = new ArrayList<Budget>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM graduation_project.budget where username=? order by budgetStart;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			while(rs.next()){
				Budget b = new Budget();
				b.setBudgetStart(rs.getDate("budgetStart"));
				b.setBudgetEnd(rs.getDate("budgetEnd"));
				b.setFood(rs.getFloat("food"));
				b.setBooks(rs.getFloat("books"));
				b.setCashGift(rs.getFloat("cashGift"));
				b.setClothing(rs.getFloat("clothing"));
				b.setCommunication(rs.getFloat("communication"));
				b.setEntertainment(rs.getFloat("entertainment"));
				b.setHousingLoan(rs.getFloat("housingLoan"));
				b.setId(rs.getInt("budget_id"));
				b.setMedicine(rs.getFloat("medicine"));
				b.setSport(rs.getFloat("sport"));
				b.setTourism(rs.getFloat("tourism"));
				b.setTraffic(rs.getFloat("traffic"));
				b.setAllAmount(rs.getFloat("allAmount"));
				b.setUsername(rs.getString("username"));
				list.add(b);
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
	
	public Budget getAllBudgetByID(int id){
		int budgetID = id;
		Budget b = new Budget();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM graduation_project.budget where budget_id=?;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, budgetID);
			rs = pst.executeQuery();
			while(rs.next()){
				
				b.setBudgetStart(rs.getDate("budgetStart"));
				b.setBudgetEnd(rs.getDate("budgetEnd"));
				b.setFood(rs.getFloat("food"));
				b.setBooks(rs.getFloat("books"));
				b.setCashGift(rs.getFloat("cashGift"));
				b.setClothing(rs.getFloat("clothing"));
				b.setCommunication(rs.getFloat("communication"));
				b.setEntertainment(rs.getFloat("entertainment"));
				b.setHousingLoan(rs.getFloat("housingLoan"));
				b.setId(rs.getInt("budget_id"));
				b.setMedicine(rs.getFloat("medicine"));
				b.setSport(rs.getFloat("sport"));
				b.setTourism(rs.getFloat("tourism"));
				b.setTraffic(rs.getFloat("traffic"));
				b.setUsername(rs.getString("username"));

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
		return b;
	}
	
	public boolean delete(int id){
		int budgetID = id;
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pst = null;
		String sql = "DELETE FROM `graduation_project`.`budget` WHERE budget_id=?";
		try {
			System.out.println("3");
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			System.out.println("4");
			pst.setInt(1, budgetID);
			System.out.println("5");
			pst.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
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
		return flag;
	}
	
	public float getSumByType(String name,Date st,Date en,String ty){
		float amount = 0;
		String username = name;
		Date start = st;
		Date end = en;
		String type = ty;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT sum("+type+") sum FROM graduation_project.expense where username=? AND expenseDate between ? AND ? ;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setDate(2, start);
			pst.setDate(3, end);
			rs = pst.executeQuery();
			while(rs.next()){
				amount = rs.getFloat("sum");
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
		return amount;
	}

}
