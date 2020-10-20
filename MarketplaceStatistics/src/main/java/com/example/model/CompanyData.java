package com.example.model;

public class CompanyData {
	private String company;
	private int BDMhours;
	private int EDChours;
	private int PChours;
	private int IICShours;
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getBDMhours() {
		return BDMhours;
	}
	public void setBDMhours(int bDMhours) {
		BDMhours = bDMhours;
	}
	public int getEDChours() {
		return EDChours;
	}
	public void setEDChours(int eDChours) {
		EDChours = eDChours;
	}
	public int getPChours() {
		return PChours;
	}
	public void setPChours(int pChours) {
		PChours = pChours;
	}
	public int getIICShours() {
		return IICShours;
	}
	public void setIICShours(int iICShours) {
		IICShours = iICShours;
	}
	@Override
	public String toString() {
		return "CompanyData [company=" + company + ", BDMhours=" + BDMhours + ", EDChours=" + EDChours + ", PChours="
				+ PChours + ", IICShours=" + IICShours + "]";
	}
}
