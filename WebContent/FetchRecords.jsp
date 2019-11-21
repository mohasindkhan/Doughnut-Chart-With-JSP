
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.google.gson.*"%>
<%@ page import="com.dynamic.chart.with.pojo.SampleCase"%>

<%

List<SampleCase> listCase = new ArrayList<>();

Class.forName("com.mysql.jdbc.Driver");
System.out.println("\n DRIVER LOADED SUCCESFULLY ");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chartdb", "root", "pass");
System.out.println("\n CONNECTION OK ");
String fetchQuery = " select id, caseName, count(caseStatus)str from donutchartcase group by caseStatus ";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(fetchQuery);
//System.out.println("\n -------------------------------------------------------------------------------------------- ");
while(rs.next())
{		
	SampleCase sc = new SampleCase();
	sc.setId(rs.getInt(1));
	sc.setCaseName(rs.getString(2)); 
	sc.setCaseStatus(rs.getString(3));
	listCase.add(sc);
}
//System.out.println("\n CASE RESULT : " +listCase);

/* for( SampleCase s : listCase )
{
	out.print(s);
} */

//System.out.println("\n -------------------------------------------------------------------------------------------- ");

Gson gson = new Gson();

String jsonData = gson.toJson(listCase);

//System.out.println("\n JSON RESULT : " +jsonData);

out.print(jsonData + "<br>");

//System.out.println("\n -------------------------------------------------------------------------------------------- "); 


List<SampleCase> listCaseCount = new ArrayList<>();
int count=0;
String countQuery = " select count(id) from donutchartcase ";
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(countQuery);
while(rs1.next())
{
	SampleCase sc1 = new SampleCase();
	sc1.setId(rs1.getInt(1));
	count=rs1.getInt(1);
	listCaseCount.add(sc1);
}
//System.out.println("\n CASE RESULT COUNT : " +listCaseCount);

//System.out.println("\n -------------------------------------------------------------------------------------------- ");

Gson gson1 = new Gson();

String jsonData1 = gson.toJson(listCaseCount);

//System.out.println("\n JSON RESULT COUNT : " +jsonData1);

out.print(count);

//System.out.println("\n -------------------------------------------------------------------------------------------- ");


/* String catData = jsonData1.concat(jsonData);

System.out.println("\n JOIN JSON : " +catData);

out.print(catData + "\n"); */

%>



<%-- <%

List<SampleCase> listCaseCount = new ArrayList<>();

String countQuery = " select count(caseStatus) from donutchartcase ";
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(countQuery);
while(rs1.next())
{
	SampleCase sc1 = new SampleCase();
	sc1.setId(rs1.getString(1));
	listCaseCount.add(sc1);
}
System.out.println("\n CASE RESULT COUNT : " +listCaseCount);

System.out.println("\n -------------------------------------------------------------------------------------------- ");

Gson gson1 = new Gson();

String jsonData1 = gson.toJson(listCaseCount);

System.out.println("\n JSON RESULT COUNT : " +jsonData1);

out.print(jsonData1 + "\n");

System.out.println("\n -------------------------------------------------------------------------------------------- ");


%> --%>
