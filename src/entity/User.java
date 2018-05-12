package entity;

import java.sql.Date;

public class User {
	private String usernmae;
	private String password;
	private Date register_time;    
	private String email;
	
	                               //导入包可能错误  
	                               /*java.util.Date和java.sql.Date 区别应该是：
	                                * java.util.Date 类型写到数据库后存储的值可以到秒，java.sql.Date 类型的写入后只能到日期。
	                                */
	
	public String getUsernmae() {
		return usernmae;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setUsernmae(String usernmae) {
		this.usernmae = usernmae;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getRegister_time() {
		return register_time;
	}
	public void setRegister_time(Date register_time) {
		this.register_time = register_time;
	}
	
	@Override
	public String toString() {
		return "User [usernmae=" + usernmae + ", password=" + password + ", register_time=" + register_time
				+ ", status=" + "]";
	}
	
	

}
