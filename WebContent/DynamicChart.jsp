<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<title> Dynamic Chart With JSP </title>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Chart.min.css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"> </script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"> </script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/Chart.min.js"> </script>
	
</head>

<body>

	<div class="container">
		<h1> DOUGHNUT CHART FOR CASE </h1> <hr />
	</div>
	
	<div class="container">
		<canvas id="myChart"> </canvas>
	</div>
	
	<div class="container" style="position:relative;margin-top: -200px; margin-left: 340px; font-weight: bolder;font-size: 40px;"> 10 </div>
	
	
	
	
	
	<script type="text/javascript">
	
		var ctx = document.getElementById("myChart").getContext("2d");
		
		var myDonutChart = new Chart(ctx, 
		{
			type: 'doughnut',
			
			data: {
				
				labels: [ 'Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange' ],
				datasets: [{
					
						label: 'Chart For Case Object',
						data: [12, 19, 3, 5, 2, 3],
						backgroundColor: [
							'rgba(255, 99, 132, 0.7)',
			                'rgba(54, 162, 235, 0.7)',
			                'rgba(255, 206, 86, 0.7)',
			                'rgba(75, 192, 192, 0.7)',
			                'rgba(153, 102, 255, 0.7)',
			                'rgba(255, 159, 64, 0.7)'
						],
						borderWidth: 5
				}]
			},
			
			options: {

				legend: {
					position: 'bottom'
				}
			}
		});
	
	</script>

</body>

</html>