package com.dynamic.chart.with.pojo;


public class SampleCase 
{
	
	public int id;
	public String caseName;
	public String caseStatus;
	
	
	public SampleCase() 
	{
		// TODO Auto-generated constructor stub
	}

	
	public int getId() 
	{
		return id;
	}

	public void setId(int id) 
	{
		this.id = id;
	}

	public String getCaseName() 
	{
		return caseName;
	}

	public void setCaseName(String caseName) 
	{
		this.caseName = caseName;
	}

	public String getCaseStatus() 
	{
		return caseStatus;
	}

	public void setCaseStatus(String caseStatus) 
	{
		this.caseStatus = caseStatus;
	}

	
	@Override
	public String toString() 
	{
		return " SampleCase : [ ID = " + id + " , CASE NAME = " + caseName + " , CASE STATUS = " + caseStatus + " ] ";
	} 
	
	
	/*@Override
	public String toString() 
	{
		return " SampleCase : [ CASE STATUS = " + caseStatus + " ] ";
	}*/
	
}
