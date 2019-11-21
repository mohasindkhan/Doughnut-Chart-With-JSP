package com.dynamic.chart.with.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dynamic.chart.with.pojo.SampleCase;

public class SampleCaseDAO 
{
	
	public List<SampleCase> getAllRecords()
	{
		
		List<SampleCase> listCase = new ArrayList<>();
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("\n DRIVER LOADED SUCCESFULLY ");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chartdb", "root", "pass");
			System.out.println("\n CONNECTION OK ");
			String fetchQuery = " select * from donutchartcase ";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(fetchQuery);
			System.out.println("\n -------------------------------------------------------------------------------------------- ");
			while(rs.next())
			{		
				SampleCase sc = new SampleCase();
				sc.setId(rs.getInt(1));
				sc.setCaseName(rs.getString(2));
				sc.setCaseStatus(rs.getString(3));
				listCase.add(sc);
			}
			System.out.println("\n CASE RESULT : " +listCase);
			
			/*HttpSession hs = request.getSession();
			hs.setAttribute("caseResult", listCase);*/
			
			System.out.println("\n -------------------------------------------------------------------------------------------- ");
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
			System.out.println("\n CONNECTION FAILED ");
		}
		
		return listCase;

	}

}
