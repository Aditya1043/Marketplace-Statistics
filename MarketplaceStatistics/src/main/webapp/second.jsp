<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Statistics: Graphs and Charts</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.1.1/jquery-confirm.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.1.1/jquery-confirm.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.4.0/dist/chartjs-plugin-datalabels.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>	
	<style>
		body{
	  		background: #e1ecf2;
		}
		a {
			color: inherit;
		}
		
		.effect1 {
			-webkit-box-shadow: 0 10px 6px -6px #777;
			-moz-box-shadow: 0 10px 6px -6px #777;
			box-shadow: 0 10px 6px -6px #777;
		}
		
		select {
			width: 150px;
			height: 30px;
			color: black;
		}
		
		select option {
			color: black;
		}
		
		select option:first-child {
			color: black;
		}
		.a:hover {
		  background-color: none;
		}
		button {
		    background-color: Transparent;
		    background-repeat:no-repeat;
		    border: none;
		    cursor:pointer;
		    overflow: hidden;
		    outline:none;
		    color:none;
		      padding: 12px 30px;
		   
		     text-align:center;
		}
		
		.button:hover {
		    background-color: none;
		}
		body {
		  font-family: "Lato", sans-serif;
		}
		
		.sidenav {
		  height: 100%;
		  width: 0;
		  position: fixed;
		  z-index: 1;
		  top: 0;
		  left: 0;
		  background-color: #111;
		  overflow-x: hidden;
		  transition: 0.5s;
		  padding-top: 60px;
		}
		
		.sidenav a {
		  padding: 8px 8px 8px 32px;
		  text-decoration: none;
		  font-size: 25px;
		  color: #818181;
		  display: block;
		  transition: 0.3s;
		}
		
		.sidenav a:hover {
		  color: #f1f1f1;
		}
		
		.sidenav .closebtn {
		  position: absolute;
		  top: 0;
		  right: 25px;
		  font-size: 36px;
		  margin-left: 50px;
		}
		
		.padd {
			padding-top: 12px;
		    padding-right: 50px;
		    padding-bottom: 10px;
		    padding-left: 100px;
		}
		
		.pad {
			padding-top: 17px;
		}
		
		#main {
		  transition: margin-left .5s;
		  padding: 16px;
		}
		
		@media screen and (max-height: 450px) {
		  .sidenav {padding-top: 15px;}
		  .sidenav a {font-size: 18px;}
		}
	</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
		<div class="col-sm-2 chart-container" style="position: relative">
			<span style="font-size:30px;cursor:pointer;color:white;" onclick="openNav()">&#9776; Charts</span>
		</div>
	    <div>
		<div class="row" >
		
			<div class="nav navbar-nav navbar-right padd" style="position: relative">
			<span style="color:white">Products : </span><select id="products" onchange="refreshChart(this.value)" style="border: #8dcca9; background-color: #f0f1f2;">
					<option>All</option>
					<option>BDM</option>
					<option>EDC</option>
					<option>PowerCenter</option>
					<option>IICS</option>
				</select>  
			</div>
			
			<div class="nav navbar-nav navbar-center pad" style="position: relative">
				<div id="reportrange"
					style="background: #fff; cursor: pointer;">
					<i class="fa fa-calendar"></i>&nbsp; 
					<span></span> <i class="fa fa-caret-down"></i>
				</div>
			</div>
			
		</div>
		</div>
	  </div>
	</nav>
	
	<div id="mySidenav" class="sidenav">
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  <a href="http://localhost:8080">Home</a>
	  <a href="http://localhost:8080/first">Sub/Month</a>
	  <a href="http://localhost:8080/second">Hours/Product</a>
	  <a href="http://localhost:8080/third">Hours/Company</a>
	  <a href="http://localhost:8080/fourth">Sub/Product</a>
	  <a href="http://localhost:8080/fifth">Sub/Country</a>
	</div>
	
	<div id="main">
	<div class="box effect1">
		<div class="row" >
			<div class="col-sm-12 chart-container" style="position: relative">
				<center><h5><b>Total Usage Hours</b></h5></center>
				<center><h5 id="numberOfHours">0</h5></center>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12 chart-container" style="position: relative; padding-top:30px;">
				<canvas id="myChart2"></canvas>
			</div>
		</div>
	</div>
	</div>
</body>

<script>
	function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	  document.getElementById("main").style.marginLeft = "250px";
	}

	function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	  document.getElementById("main").style.marginLeft= "0";
	}
	var startDate = "";
	var endDate = "";
	var chart2;
	$(document).ready(function () {
		setDate();
		refreshChart("All");
	});
	
	function setDate()  {
	    var start = moment().subtract(365, 'days');
	    var end =moment().subtract(1, 'days');
	    
	    var max = moment().subtract(1, 'days');
	    var start1 = new Date("11/2/2014");
	    var min = moment(start1.valueOf());

	    function cb(start, end) {
	        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
	        startDate = start.format('DD-MM-YYYY');
		    endDate = end.format('DD-MM-YYYY');
	    }

	    $('#reportrange').daterangepicker({
	        startDate: start,
	        endDate: end,
	        maxDate : max,
	        minDate : min,
	        minYear : 2014,
	        ranges: {
	           'Today': [moment(), moment()],
	           'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	           'Last 7 Days': [moment().subtract(6, 'days'), moment()],
	           'Last 30 Days': [moment().subtract(29, 'days'), moment()],
	           'This Month': [moment().startOf('month'), moment().endOf('month')],
	           'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	        }
	    }, cb);

	    startDate = start.format('DD-MM-YYYY');
	    endDate = end.format('DD-MM-YYYY');
	    
	    cb(start, end);
	};
	
	$('#reportrange').on('apply.daterangepicker', function(ev, picker) {
		chart2.destroy();
		product = document.getElementById("products");
		product.selectedIndex = 0;
		refreshChart("All");
	});
	
	function customerDetails(product){
		
	    $.ajax({
	        type: "GET",
	        contentType: "application/json",
	        url: "api/v1/customerDetails?toTime="+startDate+"&fromTime="+endDate+"&product="+product,
	        dataType: 'json',
	        cache: false,
	        timeout: 600000,
	        success: function (data1) {
	        	if(typeof chart2 !== "undefined") {
	    			chart2.destroy();
	    		}
	        	var labels = data1.map(function(e) {
        		   return e.product;
        		});
        		var data = data1.map(function(e) {
        		   return e.countSub;
        		});;
    			var ctx = document.getElementById('myChart2').getContext('2d');
    			ctx.canvas.parentNode.style.height = "400px";
    			var config = {
    					   type: 'bar',
    					   data: {
    					      labels: labels,
    					      datasets: [{
    					         label: 'Number of hours an Informatica Product was deployed',
    					         data: data,
    					         backgroundColor: ['rgb(255, 218, 179)','rgb(255, 119, 51)','rgb(179, 60, 0)','rgb(240, 160, 31)',
    					        	 'rgb(255, 85, 0)','rgb(255, 238, 230)','rgb(255, 150, 102)','rgb(255, 128, 0)','rgb(230, 115, 0)']		    					      }]
    					   },
    					   options: {
    						   legend: {
    						    	display: false
    						    },
    						    title: {
   						            display: true,
   						            text: 'Number of hours an Informatica Product was deployed',
						             fontSize: 14

   						        },
    						   scales: { 
    							   xAxes: [{
    					                ticks: {
    					                    autoSkip: false
    					                },
    					                barThickness: 40,
    					                scaleLabel: {
    							             display: true,
    							             labelString: 'Product',
    							             fontSize: 14
    							           }
    					            }],
    							   yAxes: [{
    							      ticks: {
    							             beginAtZero: true
    							           },
    							      scaleLabel: {
    							             display: true,
    							             labelString: 'Hours',
    							             fontSize: 14
    							           }
    							  }]
    							 },
    				            maintainAspectRatio: false,
    				            responsive: true
    				            }
    					};
    			
    			chart2 = new Chart(ctx, config);
	        }
	    });
	}

	function refreshChart(product){
	   $.ajax({
	        type: "GET",
	        contentType: "application/json",
	        url: "api/v1/countHours?product="+product+"&toTime="+startDate+"&fromTime="+endDate,
	        dataType: 'json',
	        cache: false,
	        timeout: 600000,
	        success: function (data1) {

	        	document.getElementById("numberOfHours").innerHTML = data1;
	        }
	    });
		customerDetails(product);
	}
	
</script>
</html>