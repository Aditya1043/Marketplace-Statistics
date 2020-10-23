package com.example.service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.FirstDAO;
import com.example.dao.FirstPartDAO;
import com.example.dao.SecondDAO;
import com.example.model.CompanyData;
import com.example.model.CountSubscribers;
import com.example.model.First;
import com.example.model.FirstPart;
import com.example.model.RevenueData;
import com.example.model.Second;
import com.google.gson.Gson;

@Service
public class CustomerService {

	@Autowired
	private FirstDAO fdto;
	@Autowired
	private FirstPartDAO fpdto;
	@Autowired
	private SecondDAO sdto;
	
	// function to parse the daily usage excel sheet, process the data and store it in h2 DB
	public void saveFirst() {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Map<String,String> map=new HashMap<String,String>();     
		map.put("Informatica Big Data Management", "BDM");
		map.put("Informatica Data Management as a Service for Amazon Web Services", "BDM");
		map.put("Informatica Enterprise Data Catalog", "EDC");
		map.put("Informatica Enterprise Data Catalog - Bastion", "EDC");
		map.put("Informatica Enterprise Data Catalog - Rhel", "EDC");
		map.put("Informatica Hadoop-Cluster Image for EDC", "EDC");
		map.put("Informatica Intelligent Cloud Services ETL for Amazon PAYG", "IICS");
		map.put("Informatica PowerCenter For Red Hat Linux (BYOL)", "PowerCenter");
		map.put("Informatica PowerCenter For Red Hat Linux (PAYG)", "PowerCenter");
		map.put("Informatica Remote Access Jump Server", "BDM");
		
		try {
			String d = "12-10-2020";
			BufferedReader br = new BufferedReader(new FileReader("src/main/resources/daily_business_usage_by_instance_type_2020-04-07.csv"));
		    CSVParser csvParser = new CSVParser(br,
		    CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());
		    List<First> first = new ArrayList<>();
		    
	        Iterable<CSVRecord> csvRecords = csvParser.getRecords();
	        for (CSVRecord csvRecord : csvRecords) {
	    	    First f=new First();
				f.setCompany(csvRecord.get("Customer Email Domain"));
				f.setCustomer(csvRecord.get("Customer Reference ID"));
				f.setProduct(map.get(csvRecord.get("Product Title")));			
				f.setUsage(Integer.valueOf(csvRecord.get("Usage Units")));
				f.setInstance(csvRecord.get("Instance Type"));
				f.setRevenue(Double.valueOf(csvRecord.get("Estimated Revenue")));
				f.setDate(format.parse(d));
				first.add(f);
	        }
	        fdto.saveAll(first);
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
	}

	// created the separate schema for countries for purpose of normalization
	public void saveFirstPart() {
		Map<String,String> map=new HashMap<String,String>();    
		try {
			BufferedReader br = new BufferedReader(new FileReader("src/main/resources/daily_business_usage_by_instance_type_2020-04-07.csv"));
			CSVParser csvParser = new CSVParser(br,
				    CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());
			List<FirstPart> firstpart = new ArrayList<>();
		    
	        Iterable<CSVRecord> csvRecords = csvParser.getRecords();
	        for (CSVRecord csvRecord : csvRecords) {
	    	    FirstPart fp=new FirstPart();
				fp.setCountry(csvRecord.get("Customer Country"));
				fp.setCompany(csvRecord.get("Customer Email Domain"));
				if(!map.containsKey(csvRecord.get("Customer Email Domain")))
				{
					firstpart.add(fp);
					map.put(csvRecord.get("Customer Email Domain"), csvRecord.get("Customer Country"));
				}	
	        }
	        fpdto.saveAll(firstpart);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// function to parse the customer_subscriber excel sheet, process the data and store it in h2 DB
	public void saveSecond() {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Map<String,String> map=new HashMap<String,String>();
		map.put("Informatica Big Data Management", "BDM");
		map.put("Informatica Big Data Management (BYOL)", "BDM");
		map.put("Informatica Big Data Quality", "DQ");
		map.put("Informatica Big Data Streaming", "BDS");
		map.put("Informatica Data Engineering Integration - Bastion", "DEI");
		map.put("Informatica Data Engineering Integration - Rhel", "DEI");
		map.put("Informatica Data Engineering Quality - Bastion", "DQ");
		map.put("Informatica Data Engineering Quality - Rhel", "DQ");
		map.put("Informatica Data Management as a Service for Amazon Web Services",	"BDM");
		map.put("Informatica Data Quality For RHEL (BYOL)", "DQ");
		map.put("Informatica Data Quality For Windows (BYOL)", "DQ");
		map.put("Informatica Enterprise Data Catalog", "EDC");
		map.put("Informatica Enterprise Data Catalog - Bastion", "EDC");
		map.put("Informatica Enterprise Data Catalog - Rhel", "EDC");
		map.put("Informatica Enterprise Data Preparation - Rhel", "EDP");
		map.put("Informatica Enterprise Data Preparation -Bastion", "EDP");
		map.put("Informatica Hadoop-Cluster Image for EDC", "EDC");
		map.put("Informatica Intelligent Cloud Services ETL for Amazon PAYG", "IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon Aurora (Linux)",	"IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon Aurora (Windows)", "IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon RDS (Linux)", "IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon RDS (Windows)", "IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon Redshift (Linux)", "IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon Redshift (Windows)",	"IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon S3 (Linux)", "IICS");
		map.put("Informatica Intelligent Cloud Services for Amazon S3 (Windows)", "IICS");
		map.put("Informatica Intelligent Cloud Services Secure Agent Windows (BYOL)", "IICS");
		map.put("Informatica PowerCenter For Red Hat Linux (BYOL)", "PowerCenter");
		map.put("Informatica PowerCenter For Red Hat Linux (PAYG)", "PowerCenter");
		map.put("Informatica PowerCenter For Windows (BYOL)", "PowerCenter");
		map.put("Informatica PowerCenter For Windows (PAYG)", "PowerCenter");
		map.put("Informatica Remote Access Jump Server", "BDM");
		map.put("RulePoint", "RulePoint");
		map.put("Vibe Data Stream for Machine Data", "VDS");
		
		try {
			BufferedReader br = new BufferedReader(new FileReader("src/main/resources/customer_subscriber_hourly_monthly_subscriptions_2020-04-07.csv"));
			CSVParser csvParser = new CSVParser(br,
				    CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim());
			List<Second> second = new ArrayList<>();
		    
	        Iterable<CSVRecord> csvRecords = csvParser.getRecords();
	        for (CSVRecord csvRecord : csvRecords) {
	    	    Second s=new Second();
				s.setCustomer(csvRecord.get("Customer AWS Account Number"));
				s.setProduct(map.get(csvRecord.get("Product Title")));
				Date date = format.parse(csvRecord.get("Subscription Start Date"));
				s.setStartDate(date);
				second.add(s);	
	        }
	        sdto.saveAll(second);
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
	}
	
	// fetching the data from the DB for Subscribers per product chart, converting it to json format and return
	public String NumberOfSubscribers(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<CountSubscribers> l=new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list=sdto.findAllCustomersPerProduct(dd, dd1);
		}
		else {
			list=sdto.findCustomersPerProduct(dd, dd1, product);
		}
		list.forEach(data->{
			CountSubscribers cs=new CountSubscribers();
			cs.setCountSub((Long)data[0]);
			cs.setProduct((String)data[1]);
			l.add(cs);
		});
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
	// fetching data from DB for hours per product chart 
	public String UsagePerProduct(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<CountSubscribers> l=new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list=fdto.findAllUsagePerProduct(dd, dd1);
		}
		else {
			list=fdto.findUsagePerProduct(dd, dd1, product);
		}
		list.forEach(data->{
			CountSubscribers cs=new CountSubscribers();
			cs.setCountSub((Long)data[0]);
			cs.setProduct((String)data[1]);
			l.add(cs);
		});
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
	//fetching data from DB for Deployment Hours / Customers graph
	public String CompanyData(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<CompanyData> l = new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list=fdto.findAllCompanyDetails(dd, dd1);
		} else {
			list=fdto.findCompanyDetails(dd, dd1, product);
		}
		list.forEach(data->{
			CompanyData cd=new CompanyData();
			cd.setCompany((String)data[0]);
			long temp=(Long)data[2];
			int t=(int)temp;
			switch((String)data[1]) {
			   case "BDM" :
				   cd.setBDMhours(t);
					cd.setEDChours(0);
					cd.setIICShours(0);
					cd.setPChours(0);
			      break;
			   case "EDC" :
				   cd.setBDMhours(0);
					cd.setEDChours(t);
					cd.setIICShours(0);
					cd.setPChours(0);
				   break;
			   case "PowerCenter" :
				   cd.setBDMhours(0);
					cd.setEDChours(0);
					cd.setIICShours(0);
					cd.setPChours(t);
				   break;
			   case "IICS" :
				   cd.setBDMhours(0);
					cd.setEDChours(0);
					cd.setIICShours(t);
					cd.setPChours(0);
				   break;	      
			   default :
				   cd.setBDMhours(0);
					cd.setEDChours(0);
					cd.setIICShours(0);
					cd.setPChours(0);
			}
			l.add(cd);
		});
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
	//fetching total number of subscribers from DB
	public int countSubscribers(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		int i;
		if(product.equals("All")) {
			i=(Integer)sdto.findAllcountSubscribers(dd, dd1);
		} else {
			i=(Integer)sdto.findcountSubscribers(dd, dd1, product);
		}
		return i;
	}
		
	// fetching total number of hours from DB
	public int countHours(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		int i;
		if(product.equals("All")) {
			i=(Integer)fdto.findAllcountHours(dd, dd1);
		} else {
			i=(Integer)fdto.findcountHours(dd, dd1, product);
		}
		return i;
	}
	
	//fetching data from DB for monthly new subscribers 
	public String customerDetailsByDate(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<CountSubscribers> l=new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list = sdto.findAllSubscribersByDate(dd, dd1);
		} else {
			list = sdto.findSubscribersByDate(dd, dd1, product);
		}
		list.forEach(data->{
			CountSubscribers cs=new CountSubscribers();
			cs.setCountSub((Long)data[0]);
			Integer m=(int)data[1];
			Integer y=(int)data[2];
			cs.setProduct(y.toString()+"-"+m.toString());
			l.add(cs);
		});
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
	// fetching data from DB for Usage Units / Country graph
	public String countryDetails(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<CountSubscribers> l=new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list=fdto.findAllCountryDetails(dd, dd1);
		}
		else {
			list=fdto.findCountryDetails(dd, dd1, product);
		}
		list.forEach(data->{
			CountSubscribers cs=new CountSubscribers();
			cs.setCountSub((Long)data[0]);
			cs.setProduct((String)data[1]);
			l.add(cs);
		});
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
/*	public String usagepercountry(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list;
		if(product.equals("All")) {
			list=fdto.findAllUsagePerCountry(dd, dd1);
		} else {
			list=fdto.findUsagePerCountry(dd, dd1, product);
		}
		
		Gson json=new Gson();
		String res=json.toJson(list);
		return res;
	}
	
	public String revenueperproduct(String startDate, String endDate, String product) throws ParseException {
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		List<RevenueData> l=new ArrayList<>();
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list=fdto.findRevenuePerProduct(dd, dd1, product);
		list.forEach(data->{
			RevenueData rd=new RevenueData();
			rd.setRevenue((Double)data[0]);
			rd.setProduct((String)data[1]);
			l.add(rd);
		});
		
		Gson json=new Gson();
		String res=json.toJson(l);
		return res;
	}
	
	public String instanceperproduct(String startDate, String endDate, String product) throws ParseException {
		Map<String,Map<String,Long>> m=new HashMap<>();
		DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date dd = format.parse(startDate);
		Date dd1 = format.parse(endDate);
		List<Object[]> list=fdto.findInstanceDetails(dd, dd1, product);
		list.forEach(data->{
			String p = (String)data[0];
			String i = (String)data[1];
			Long c = (Long)data[2];
			if(m.containsKey(p)) {
				
			} else {
				
			}
		});
		
		Gson json=new Gson();
		String res=json.toJson(list);
		return res;
	}*/
}
