<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html>

<head>

	<meta charset="utf-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<title> Dynamic Chart </title>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Chart.min.css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"> </script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/Chart.min.js"> </script>
	
	<style>
	
		#doughnutChart
		{
			padding: 30px 20px;
			height: 300px !important;
			width: 100% !important; 
		}
		
		#chart_block
		{
			margin: 10px 10px;
			padding: 30px;
		}
		
		#caseCount
		{
			margin-top: -35.5%;
			margin-left: 47.5%;
			font-size: 24;
			font-weight: bolder;
			position: relative;
		}
		
		/* @media only screen and (min-width: 400px)
		{
			#caseCount
			{
				margin-top: -44%;
				margin-left: 46%;
				position: relative;
			}
		}
		
		@media only screen and (max-width: 768px)
		{
			#caseCount
			{
				margin-top: -42%;
				margin-left: 46.5%;
				position: relative;
			}
		}
		
		@media only screen and (max-width: 992px)
		{
			#caseCount
			{
				margin-top: -40%;
				margin-left: 46.5%;
				position: relative;
			}
		}
 */	
	</style>
	
</head>

<body>

<div> 
	<!-- <button onClick="myData()"> GET DATA </button> -->
</div>

<div class="container"> 
	<h1> DOUGHNUT CHART USING CHART.JS </h1> <hr />
	
	<div class="row">
		<div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
			<div class="card">
				<canvas id="doughnutChart"> </canvas>
			</div>
			<div id="caseCount"> </div>
		</div>
	</div>
	
</div>

<script>

$(document).ready(function()
{
	$.ajax
	({
		url: "FetchRecords.jsp",
		type: "GET",
		success:function(data)
		{
			/* LOGGING JSON FETCH DATA */ 
			//console.log(data);
			
			var z = data.split("<br>");
			console.log(z[0]);
			console.log(z[1]);
			
			document.getElementById("caseCount").innerHTML = z[1];
			
			/* PARSE JSON DATA */
			var a = JSON.parse(z[0]);
			console.log(a);
			
			/* EMPTY ARRAY FOR PUSHING RESPONSE DATA INTO CHART DATASET */
			var caseStatusData = [];
			
			$.each(a,function(i, item)
			{
				//console.log(item.caseStatus);
				var d = item.caseStatus;
				//console.log(d);
				caseStatusData.push(d);
			});
			
			var chartData = {
					
					labels: [ "Submitted", "Open", "Overdue", "Resolved", "Closed" ],
					
					datasets: [{

						data: caseStatusData,
						backgroundColor: [
							'rgba(255, 99, 132, 0.7)',
					        'rgba(54, 162, 235, 0.7)',
					        'rgba(255, 206, 86, 0.7)',
					        'rgba(75, 192, 192, 0.7)',
					        'rgba(153, 102, 255, 0.7)'
						],
						borderWidth: 3
					}]
			};
			
			var chartOptions = {
					title: {
						display: false,
						text: "Case Data",
						fontSize: 20,
						fontFamily: 'times new roman',
						fontStyle: 'bold',
						fontColor: '#4A235A'
					},
					legend: {
						position: 'bottom',
						labels: 
							{
				                fontSize: 12,
								fontStyle: 'normal',
								boxWidth: 12,
								padding: 20
				            }
					}
			};
			
			var ctx = document.getElementById("doughnutChart").getContext("2d");
			var doughnut = new Chart(ctx, {
				
				type: "doughnut",
				data: chartData,
				options: chartOptions
			});
		}
	});
});

</script>

</body>

</html>