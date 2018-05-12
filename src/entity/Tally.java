package entity;

import java.sql.Date;

public class Tally {
	private float tallyAmount;
	private String tallyAccount;
	private String tallyType;
	private Date tallyTime;
	private String tag;
	private int flag;
	private int id;
	private String username;
	public float getTallyAmount() {
		return tallyAmount;
	}
	public void setTallyAmount(float tallyAmount) {
		this.tallyAmount = tallyAmount;
	}
	public String getTallyAccount() {
		return tallyAccount;
	}
	public void setTallyAccount(String tallyAccount) {
		this.tallyAccount = tallyAccount;
	}
	public String getTallyType() {
		return tallyType;
	}
	public void setTallyType(String tallyType) {
		this.tallyType = tallyType;
	}
	public Date getTallyTime() {
		return tallyTime;
	}
	public void setTallyTime(Date tallyTime) {
		this.tallyTime = tallyTime;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "Tally [tallyAmount=" + tallyAmount + ", tallyAccount=" + tallyAccount + ", tallyType=" + tallyType
				+ ", tallyTime=" + tallyTime + ", tag=" + tag + ", username=" + username + "]";
	}
	
	

}
