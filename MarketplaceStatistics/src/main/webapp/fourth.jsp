<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Statistics: Graphs and Charts</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
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
		  margin-top:50px;
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
		  margin-top:50px;
		}
		
		@media screen and (max-height: 450px) {
		  .sidenav {padding-top: 15px;}
		  .sidenav a {font-size: 18px;}
		}
	</style>
	<link rel="stylesheet" href="css/temp.css">
</head>

<body  id="page-top">
	
  <!-- Page Wrapper -->
  <div id="wrapper">

         <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Dash Board</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
     <!-- Nav Item - AWS Collapse Menu -->
     <div class="sidebar-heading">
        Amazon Web Service
      </div>
     
      <li class="nav-item">
        <a class="nav-link" href="aws.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>Main AWS Dashboard</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="first.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Monthly New Subscribers</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="second.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Hours of Deployment</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="third.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Subscribers per Product</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="fourth.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Usage units/Country</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="fifth.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Deployment hours per customer</span></a>
      </li>
      
      <!-- Divider -->
      <hr class="sidebar-divider">
  
       <!-- Nav Item - Azure Collapse Menu -->
       
             <!-- Nav Item - Dashboard -->
     <!-- Nav Item - AWS Collapse Menu -->
     <div class="sidebar-heading">
        Azure
      </div>
     
      <li class="nav-item">
        <a class="nav-link" href="azure.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>Main Azure Dashboard</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="firstaz.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Monthly New Subscribers</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="secondaz.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Usage Trends</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="thirdaz.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Usage units / Product</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="fourthaz.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Usage Units / Country</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="fifthaz.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Visits per Country</span></a>
      </li>
      
      
      <!-- Divider -->
      <hr class="sidebar-divider">
       
     
      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->    
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
            
            
            
<div class="nav navbar-nav navbar-center pad" style="position: relative">
				<div id="reportrange"
					style="background: #fff; cursor: pointer;">
					<i class="fa fa-calendar"></i>&nbsp; 
					<span></span> <i class="fa fa-caret-down"></i>
				</div>
			</div>
            
            <div class="nav navbar-nav navbar-right padd" style="position: relative">
			<span style="color:white">Products : </span><select id="products" onchange="refreshChart(this.value)" style="border: #8dcca9; background-color: #f0f1f2;">
					<option>All</option>
					<option>BDM</option>
					<option>EDC</option>
					<option>PowerCenter</option>
					<option>IICS</option>
				</select>  
			</div>
        

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
       <div class="container-fluid">
	            <div class="box effect1">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Usage Units / Country</h6>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myChart4"></canvas>
                  </div>
                </div>
          </div>
	</div>
	</div>
</body>

<script>
!function(s){"use strict";s("#sidebarToggle, #sidebarToggleTop").on("click",function(e){s("body").toggleClass("sidebar-toggled"),s(".sidebar").toggleClass("toggled"),s(".sidebar").hasClass("toggled")&&s(".sidebar .collapse").collapse("hide")}),s(window).resize(function(){s(window).width()<768&&s(".sidebar .collapse").collapse("hide"),s(window).width()<480&&!s(".sidebar").hasClass("toggled")&&(s("body").addClass("sidebar-toggled"),s(".sidebar").addClass("toggled"),s(".sidebar .collapse").collapse("hide"))}),s("body.fixed-nav .sidebar").on("mousewheel DOMMouseScroll wheel",function(e){if(768<s(window).width()){var o=e.originalEvent,l=o.wheelDelta||-o.detail;this.scrollTop+=30*(l<0?1:-1),e.preventDefault()}}),s(document).on("scroll",function(){100<s(this).scrollTop()?s(".scroll-to-top").fadeIn():s(".scroll-to-top").fadeOut()}),s(document).on("click","a.scroll-to-top",function(e){var o=s(this);s("html, body").stop().animate({scrollTop:s(o.attr("href")).offset().top},1e3,"easeInOutExpo"),e.preventDefault()})}(jQuery);

	var startDate = "";
	var endDate = "";
	var chart4;
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
		chart4.destroy();
		product = document.getElementById("products");
		product.selectedIndex = 0;
		refreshChart("All");
	});
	
	function countryDetails(product){
		
	    $.ajax({
	        type: "GET",
	        contentType: "application/json",
	        url: "api/v1/country?toTime="+startDate+"&fromTime="+endDate+"&product="+product,
	        dataType: 'json',
	        cache: false,
	        timeout: 600000,
	        success: function (data1) {

	        	if(typeof chart4 !== "undefined") {
	    			chart4.destroy();
	    		}
	        	var labels = data1.map(function(e) {
        		   return e.product;
        		});
        		var data = data1.map(function(e) {
        		   return e.countSub;
        		});;
    			var ctx = document.getElementById('myChart4').getContext('2d');
    			ctx.canvas.parentNode.style.height = "400px";
    			var config = {
   					   type: 'pie',
   					   data: {
   					      labels: labels,
   					      datasets: [{
   					    	  
   					         label: 'Number of Users / Country',
   					         data: data,
   					         backgroundColor: ['rgb(255, 218, 179)','rgb(255, 119, 51)','rgb(179, 60, 0)','rgb(240, 160, 31)',
   					        	 'rgb(255, 85, 0)','rgb(255, 238, 230)','rgb(255, 150, 102)','rgb(255, 128, 0)','rgb(230, 115, 0)']		    					      }]
   					   },
   					   options: {
   						   title: {
  						            display: true,
  						            text: 'Country/ No of Users',
					             fontSize: 14

  						        },
   						   legend: {
   						    	display: true
   						    },
   				            responsive: true,
   				            maintainAspectRatio: false
   				       }
    			};
    			chart4 = new Chart(ctx, config);
	        }
	    });
	}

	function refreshChart(product){
		countryDetails(product);
	}
</script>
</html>