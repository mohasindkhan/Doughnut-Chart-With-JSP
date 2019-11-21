package com.dynamic.chart.with.data;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dynamic.chart.with.pojo.SampleCase;
import com.google.gson.Gson;


/**
 * Servlet implementation class DynamicChart
 */
@WebServlet("/DynamicChart")
public class DynamicChart extends HttpServlet 
{
	
	HttpServletResponse response;
	
	private static final long serialVersionUID = 1L;

	
    /**
     * Default constructor. 
     */
    public DynamicChart() 
    {
        // TODO Auto-generated constructor stub
    }

    
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		
		doGet(request, response);
	}

	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		System.out.println("\n DYNAMIC CHART WITH CASE OBJECT");
		
		List<SampleCase> sc = getRecs();

	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		
		doGet(request, response);
	}
	
	public List<SampleCase> getRecs()
	{
		
		List<SampleCase> listCase = new ArrayList<>();
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("\n DRIVER LOADED SUCCESFULLY ");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chartdb", "root", "pass");
			System.out.println("\n CONNECTION OK ");
			String fetchQuery = " select id, caseName, count(caseStatus) from donutchartcase group by caseStatus ";
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

			/* for( SampleCase s : listCase )
			{
				out.print(s);
			} */

			System.out.println("\n -------------------------------------------------------------------------------------------- ");

			Gson gson = new Gson();

			String jsonData = gson.toJson(listCase);

			System.out.println("\n JSON RESULT : " +jsonData);

			PrintWriter out = response.getWriter();
			
			out.println(jsonData + "\n");

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
