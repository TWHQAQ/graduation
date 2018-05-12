package dao1;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import entity.AnnualTally;
import entity.Expense;
import entity.MonthTally;
import entity.Tally;
import util.DBConnection;

public class IncomesAndExpenses {
	public String transferType(String s) {
		String index = null;
		if ("餐饮食品".equals(s)) {
			index = "food";
		}
		if ("交通".equals(s)) {
			index = "traffic";
		}
		if ("通讯".equals(s)) {
			index = "communication";
		}
		if ("休闲娱乐".equals(s)) {
			index = "entertainment";
		}
		if ("运动健身".equals(s)) {
			index = "sport";
		}
		if ("医疗".equals(s)) {
			index = "medicine";
		}
		if ("服装".equals(s)) {
			index = "clothing";
		}
		if ("书刊".equals(s)) {
			index = "books";
		}
		if ("旅游".equals(s)) {
			index = "tourism";
		}
		if ("礼金".equals(s)) {
			index = "cashGift";
		}
		if ("房贷".equals(s)) {
			index = "housingLoan";
		}
		if ("工资".equals(s)) {
			index = "salary";
		}
		if ("转账".equals(s)) {
			index = "transfer";
		}
		if ("股票卖出".equals(s)) {
			index = "stock";
		}
		return index;
	}

	public String changeType(String s) {
		String index = null;
		if ("food".equals(s)) {
			index = "餐饮食品";
		}
		if ("traffic".equals(s)) {
			index = "交通";
		}
		if ("communication".equals(s)) {
			index = "通讯";
		}
		if ("entertainment".equals(s)) {
			index = "休闲娱乐";
		}
		if ("sport".equals(s)) {
			index = "运动健身";
		}
		if ("medicine".equals(s)) {
			index = "医疗";
		}
		if ("clothing".equals(s)) {
			index = "服装";
		}
		if ("books".equals(s)) {
			index = "书刊";
		}
		if ("tourism".equals(s)) {
			index = "旅游";
		}
		if ("cashGift".equals(s)) {
			index = "礼金";
		}
		if ("housingLoan".equals(s)) {
			index = "房贷";
		}
		if ("stock".equals(s)) {
			index = "工资";
		}
		if ("transfer".equals(s)) {
			index = "转账";
		}
		if ("stock".equals(s)) {
			index = "股票卖出";
		}
		return index;
	}

	public boolean addTally(Tally tally) {
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pst = null;
		Tally t = tally;
		String index = t.getTallyType();
		char c = t.getTallyType().charAt(0);
		int i = (int) c;
		if ((i >= 65 && i <= 90) || (i >= 97 && i <= 122)) {
			index = changeType(t.getTallyType());
		}
		String sql = "INSERT INTO `graduation_project`.`tally` (`tallyAmount`, `tallyAccount`, `tallyType`, `tallyTime`,`tag`,`flag`, `username`)"
				+ " VALUES (?,?,?,?,?,?,?);";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setFloat(1, t.getTallyAmount());
			pst.setString(2, t.getTallyAccount());
			pst.setString(3, index);
			pst.setDate(4, t.getTallyTime());
			pst.setString(5, t.getTag());
			pst.setInt(6, t.getFlag());
			pst.setString(7, t.getUsername());
			pst.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public boolean addExpense(Tally tally) {
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pst = null;
		Tally t = tally;
		String index = t.getTallyType();
		System.out.println(t.getTallyType() + "," + t.getTallyAmount() + "," + t.getUsername() + "," + t.getTallyTime());
		char c = t.getTallyType().charAt(0);
		int i = (int) c;
		if ((i >= 65 && i <= 90) || (i >= 97 && i <= 122)) {
			
		}else{
			index = transferType(tally.getTallyType());
		}

		String sql = "UPDATE `graduation_project`.`expense` SET `" + index + "`=? WHERE username=? AND expenseDate=?;";
		System.out.println(t.getTallyTime() + "," + t.getUsername() + "," + t.getTallyAmount());

		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setFloat(1, t.getTallyAmount());
			pst.setString(2, t.getUsername());
			pst.setDate(3, t.getTallyTime());
			pst.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public boolean addNewExpense(Tally tally) {
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pst = null;
		Tally t = tally;
		String index = t.getTallyType();
		System.out.println(t.getTallyType() + "," + t.getTallyAmount() + "," + t.getUsername() + "," + t.getTallyTime());
		char c = t.getTallyType().charAt(0);
		int i = (int) c;
		if ((i >= 65 && i <= 90) || (i >= 97 && i <= 122)) {
			
		}else{
			index = transferType(tally.getTallyType());
		}

		String sql = "INSERT INTO `graduation_project`.`expense` (`expenseDate`, `" + index
				+ "`, `username`) VALUES (?, ?, ?);";

		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setDate(1, t.getTallyTime());
			pst.setFloat(2, t.getTallyAmount());
			pst.setString(3, t.getUsername());
			pst.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public ArrayList<Tally> getAllTally(String name) {
		String username = name;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<Tally> list = new ArrayList<Tally>();
		String sql = "SELECT * FROM graduation_project.tally where username=?;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			while (rs.next()) {
				Tally t = new Tally();
				t.setTag(rs.getString("tag"));
				t.setTallyAccount(rs.getString("tallyAccount"));
				t.setTallyAmount(rs.getFloat("tallyAmount"));
				t.setTallyTime(rs.getDate("tallyTime"));
				t.setTallyType(rs.getString("tallyType"));
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Tally> getTallyByDate(String name, Date d) {
		ArrayList<Tally> list = new ArrayList<Tally>();
		String username = name;
		Date date = d;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM graduation_project.tally where username=? AND tallyTime=?;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setDate(2, date);
			rs = pst.executeQuery();
			while (rs.next()) {
				Tally t = new Tally();
				t.setTag(rs.getString("tag"));
				t.setTallyAccount(rs.getString("tallyAccount"));
				t.setTallyAmount(rs.getFloat("tallyAmount"));
				t.setTallyTime(rs.getDate("tallyTime"));
				t.setTallyType(rs.getString("tallyType"));
				t.setFlag(rs.getInt("flag"));
				t.setId(rs.getInt("tally_id"));
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Tally> getTallyByMonth(String name, String s) {
		ArrayList<Tally> list = new ArrayList<Tally>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String username = name;
		int year = Integer.parseInt(s.substring(0, 4));
		int month = Integer.parseInt(s.substring(5, 7));
		String sql = "SELECT sum(tallyAmount) amount,date_format(tallyTime,'%Y-%m') months ,tallyType,flag FROM graduation_project.tally "
				+ " where username=? AND year(tallyTime) = ? AND month(tallyTime) = ? group by months,tallyType;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setInt(2, year);
			pst.setInt(3, month);
			rs = pst.executeQuery();
			while (rs.next()) {
				Tally t = new Tally();
				t.setTallyAmount(rs.getFloat("amount"));
				t.setTallyType(rs.getString("tallyType"));
				t.setFlag(rs.getInt("flag"));
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteByID(int i) {
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pst = null;
		int id = i;
		String sql = "DELETE FROM `graduation_project`.`tally` WHERE `tally_id`=?;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public void updateByID(int i, String t) {

		Connection conn = null;
		PreparedStatement pst = null;
		int id = i;
		String type = transferType(t);
		String sql = "UPDATE `graduation_project`.`expense` SET `" + type + "`=NULL WHERE `id`=?;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public int getID(String name, Date d) {
		int n = 0;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String username = name;
		Date date = d;
		String sql = "SELECT id FROM graduation_project.expense where username=? AND expenseDate=?;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setDate(2, date);
			rs = pst.executeQuery();
			while (rs.next()) {
				n = rs.getInt("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return n;
	}

	public ArrayList<MonthTally> getTallyIncomeByMonth(String name) {
		String username = name;
		ArrayList<MonthTally> list = new ArrayList<MonthTally>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "select DATE_FORMAT(tallyTime,'%Y-%m') months,sum(tallyAmount), flag from tally where flag='1' AND username=? group by months ;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			while (rs.next()) {
				MonthTally mt = new MonthTally();
				mt.setAmount(rs.getFloat("sum(tallyAmount)"));
				mt.setDate(rs.getString("months"));
				mt.setFlag(rs.getInt("flag"));
				list.add(mt);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Expense> getTallyExpenseByMonth(String name, String d) {
		ArrayList<Expense> list = new ArrayList<Expense>();
		String date = d;
		int month = Integer.parseInt(date.substring(5, 7));
		int year = Integer.parseInt(date.substring(0, 4));
		String username = name;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM graduation_project.expense where username = ? AND  year(expenseDate) = ? and month(expenseDate) = ?;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setInt(2, year);
			pst.setInt(3, month);
			rs = pst.executeQuery();
			while (rs.next()) {
				Expense e = new Expense();
				e.setId(rs.getInt("id"));
				e.setBooks(rs.getFloat("books"));
				e.setCashGift(rs.getFloat("cashGift"));
				e.setClothing(rs.getFloat("clothing"));
				e.setCommunication(rs.getFloat("communication"));
				e.setEntertainment(rs.getFloat("entertainment"));
				e.setExpenseDate(rs.getDate("expenseDate"));
				e.setFood(rs.getFloat("food"));
				e.setHousingLoan(rs.getFloat("housingLoan"));
				e.setMedicine(rs.getFloat("medicine"));
				e.setSport(rs.getFloat("sport"));
				e.setTourism(rs.getFloat("tourism"));
				e.setTraffic(rs.getFloat("traffic"));
				e.setSalary(rs.getFloat("salary"));
				e.setStock(rs.getFloat("stock"));
				e.setTransfer(rs.getFloat("transfer"));
				e.setExpense(e.getBooks() + e.getCashGift() + e.getClothing() + e.getCommunication()
						+ e.getEntertainment() + e.getFood() + e.getHousingLoan() + e.getMedicine() + e.getSport()
						+ e.getTourism() + e.getTraffic());
				e.setSalary(rs.getFloat("salary"));
				e.setStock(rs.getFloat("stock"));
				e.setTransfer(rs.getFloat("transfer"));
				e.setIncome(e.getSalary() + e.getStock() + e.getTransfer());
				e.setUsername(username);
				list.add(e);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return list;
	}

	public ArrayList<Expense> getExpenseByYear(String name, String start, String end) {
		ArrayList<Expense> list = new ArrayList<Expense>();
		String username = name;
		java.sql.Date st = java.sql.Date.valueOf(start);
		java.sql.Date en = java.sql.Date.valueOf(end);
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT  id,date_format(expenseDate,'%Y-%m') months, expenseDate,"
				+ "sum(food) food,sum(communication) communication,sum(traffic) traffic,sum(medicine) medicine,sum(entertainment) entertainment,"
				+ "sum(sport) sport,sum(clothing) clothing,sum(books) books,sum(tourism) tourism,sum(cashGift) cashGift,sum(housingLoan) housingLoan,"
				+ "sum(salary) salary,sum(stock) stock,sum(transfer) transfer" + " FROM graduation_project.expense"
				+ " where username=? AND expenseDate between ? AND ? group by months;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setDate(2, st);
			pst.setDate(3, en);
			rs = pst.executeQuery();
			while (rs.next()) {
				Expense e = new Expense();
				e.setId(rs.getInt("id"));
				e.setExpenseDate(rs.getDate("expenseDate"));
				e.setBooks(rs.getFloat("books"));
				e.setCashGift(rs.getFloat("cashGift"));
				e.setClothing(rs.getFloat("clothing"));
				e.setCommunication(rs.getFloat("communication"));
				e.setEntertainment(rs.getFloat("entertainment"));
				e.setMonths(rs.getString("months"));
				e.setFood(rs.getFloat("food"));
				e.setHousingLoan(rs.getFloat("housingLoan"));
				e.setMedicine(rs.getFloat("medicine"));
				e.setSport(rs.getFloat("sport"));
				e.setTourism(rs.getFloat("tourism"));
				e.setTraffic(rs.getFloat("traffic"));
				e.setSalary(rs.getFloat("salary"));
				e.setStock(rs.getFloat("stock"));
				e.setTransfer(rs.getFloat("transfer"));
				e.setExpense(e.getBooks() + e.getCashGift() + e.getClothing() + e.getCommunication()
						+ e.getEntertainment() + e.getFood() + e.getHousingLoan() + e.getMedicine() + e.getSport()
						+ e.getTourism() + e.getTraffic());
				e.setSalary(rs.getFloat("salary"));
				e.setStock(rs.getFloat("stock"));
				e.setTransfer(rs.getFloat("transfer"));
				e.setIncome(e.getSalary() + e.getStock() + e.getTransfer());
				e.setUsername(username);
				list.add(e);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return list;
	}

	public float getExpenseByDate(String name, Date start, Date end) {
		float amount = 0;
		String username = name;
		java.sql.Date st = start;
		java.sql.Date en = end;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT  id,"
				+ "sum(food) food,sum(communication) communication,sum(traffic) traffic,sum(medicine) medicine,sum(entertainment) entertainment,"
				+ "sum(sport) sport,sum(clothing) clothing,sum(books) books,sum(tourism) tourism,sum(cashGift) cashGift,sum(housingLoan) housingLoan,"
				+ "sum(salary) salary,sum(stock) stock,sum(transfer) transfer" + " FROM graduation_project.expense"
				+ " where username=? AND expenseDate between ? AND ? ;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setDate(2, st);
			pst.setDate(3, en);
			rs = pst.executeQuery();
			while (rs.next()) {
				Expense e = new Expense();
				e.setId(rs.getInt("id"));

				e.setBooks(rs.getFloat("books"));
				e.setCashGift(rs.getFloat("cashGift"));
				e.setClothing(rs.getFloat("clothing"));
				e.setCommunication(rs.getFloat("communication"));
				e.setEntertainment(rs.getFloat("entertainment"));
				e.setFood(rs.getFloat("food"));
				e.setHousingLoan(rs.getFloat("housingLoan"));
				e.setMedicine(rs.getFloat("medicine"));
				e.setSport(rs.getFloat("sport"));
				e.setTourism(rs.getFloat("tourism"));
				e.setTraffic(rs.getFloat("traffic"));
				amount = e.getBooks() + e.getCashGift() + e.getClothing() + e.getCommunication() + e.getEntertainment()
						+ e.getFood() + e.getHousingLoan() + e.getMedicine() + e.getSport() + e.getTourism()
						+ e.getTraffic();

			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return amount;
	}

	public float getAmountByType(String name, String st, String en, String str) {
		float amount = 0;
		String username = name;
		java.sql.Date start = java.sql.Date.valueOf(st);
		java.sql.Date end = java.sql.Date.valueOf(en);
		String type = changeType(str);
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "SELECT sum(tallyAmount) sum FROM graduation_project.tally where username=? AND tallyType=? AND tallyTime between ? AND ?;";
		try {
			conn = new DBConnection().getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, type);
			pst.setDate(3, start);
			pst.setDate(4, end);
			rs = pst.executeQuery();
			while (rs.next()) {
				amount = rs.getFloat("sum");
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
		return amount;
	}

}
