package entity;

import java.sql.Date;

public class Account {
	private String accountName;
	private String accountType;
	private Date account_opening_time;
	private float startAmount;
	private String keyword;
	private float amount;
	
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public Date getAccount_opening_time() {
		return account_opening_time;
	}
	public void setAccount_opening_time(Date account_opening_time) {
		this.account_opening_time = account_opening_time;
	}
	public float getStartAmount() {
		return startAmount;
	}
	public void setStartAmount(float startAmount) {
		this.startAmount = startAmount;
	}
	
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "Account [accountName=" + accountName + ", accountType=" + accountType + ", account_opening_time="
				+ account_opening_time + ", startAmount=" + startAmount + ", keyword=" + keyword + "]";
	}
	
	

}
