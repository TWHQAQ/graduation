package entity;

import java.sql.Date;

public class Budget {
	private int id;
	private String username;
	private Date budgetStart;
	private Date budgetEnd;
	private float food;
	private float communication;
	private float traffic;
	private float entertainment;
	private float medicine;
	private float sport;
	private float books;
	private float tourism;
	private float cashGift;
	private float housingLoan;
	private float clothing;
	private float allAmount;
	
	
	public float getAllAmount() {
		return allAmount;
	}
	public void setAllAmount(float allAmount) {
		this.allAmount = allAmount;
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
	public Date getBudgetStart() {
		return budgetStart;
	}
	public void setBudgetStart(Date budgetStart) {
		this.budgetStart = budgetStart;
	}
	public Date getBudgetEnd() {
		return budgetEnd;
	}
	public void setBudgetEnd(Date budgetEnd) {
		this.budgetEnd = budgetEnd;
	}
	public float getFood() {
		return food;
	}
	public void setFood(float food) {
		this.food = food;
	}
	public float getCommunication() {
		return communication;
	}
	public void setCommunication(float communication) {
		this.communication = communication;
	}
	public float getTraffic() {
		return traffic;
	}
	public void setTraffic(float traffic) {
		this.traffic = traffic;
	}
	public float getEntertainment() {
		return entertainment;
	}
	public void setEntertainment(float entertainment) {
		this.entertainment = entertainment;
	}
	public float getMedicine() {
		return medicine;
	}
	public void setMedicine(float medicine) {
		this.medicine = medicine;
	}
	public float getSport() {
		return sport;
	}
	public void setSport(float sport) {
		this.sport = sport;
	}
	public float getBooks() {
		return books;
	}
	public void setBooks(float books) {
		this.books = books;
	}
	public float getTourism() {
		return tourism;
	}
	public void setTourism(float tourism) {
		this.tourism = tourism;
	}
	public float getCashGift() {
		return cashGift;
	}
	public void setCashGift(float cashGift) {
		this.cashGift = cashGift;
	}
	public float getHousingLoan() {
		return housingLoan;
	}
	public void setHousingLoan(float housingLoan) {
		this.housingLoan = housingLoan;
	}
	
	public float getClothing() {
		return clothing;
	}
	public void setClothing(float clothing) {
		this.clothing = clothing;
	}
	@Override
	public String toString() {
		return "Budget [budgetStart=" + budgetStart + ", budgetEnd=" + budgetEnd + ", food=" + food + ", communication="
				+ communication + ", traffic=" + traffic + ", entertainment=" + entertainment + ", medicine=" + medicine
				+ ", sport=" + sport + ", books=" + books + ", tourism=" + tourism + ", cashGift=" + cashGift
				+ ", housingLoan=" + housingLoan + "]";
	}
	
	

}
