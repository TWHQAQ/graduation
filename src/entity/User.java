package entity;

import java.sql.Date;

public class User {
	private String usernmae;
	private String password;
	private Date register_time;    
	private String email;
	
	                               //��������ܴ���  
	                               /*java.util.Date��java.sql.Date ����Ӧ���ǣ�
	                                * java.util.Date ����д�����ݿ��洢��ֵ���Ե��룬java.sql.Date ���͵�д���ֻ�ܵ����ڡ�
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
