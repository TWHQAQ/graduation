package entity;

import java.sql.Date;

public class Stock {
	private String stockCode;
	private String stockName;
	private float cost;
	private Date buyDate;
	private String accountName;
	private String username;
	
	@Override
	public String toString() {
		return "Stock [stockCode=" + stockCode + ", stockName=" + stockName + ", cost=" + cost + ", buyDate=" + buyDate
				+ "]";
	}
	public String getStockCode() {
		return stockCode;
	}
	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
	public Date getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	

}
