package com.example.controller;

import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.service.CustomerService;

@Controller
public class MarketplaceStatisticsController {
	@Autowired
	private CustomerService cs;
	
	@RequestMapping("/")
	public String showHome() throws ParseException {
		return "index.jsp";
	}
	
	@RequestMapping("/first")
	public String showFirst() throws ParseException {
		return "first.jsp";
	}
	
	@RequestMapping("/second")
	public String showSecond() throws ParseException {
		return "second.jsp";
	}
	
	@RequestMapping("/third")
	public String showThird() throws ParseException {
		return "third.jsp";
	}
	
	@RequestMapping("/fourth")
	public String showFourth() throws ParseException {
		return "fourth.jsp";
	}
	
	@RequestMapping("/fifth")
	public String showFifth() throws ParseException {
		return "fifth.jsp";
	}
	
	@RequestMapping("api/v1/subscriberDetails")
	@ResponseBody
	public String NumberOfSubscribers(Model model, @RequestParam(value="toTime") String startDate,
			@RequestParam(value="fromTime") String endDate, @RequestParam(value="product") String product) throws ParseException {
		return cs.NumberOfSubscribers(startDate, endDate, product);
	}
	
	@RequestMapping("api/v1/customerDetails")
	@ResponseBody
	public String UsagePerProduct(Model model, @RequestParam(value="toTime") String startDate,
			@RequestParam(value="fromTime") String endDate, @RequestParam(value="product") String product) throws ParseException {
		return cs.UsagePerProduct(startDate, endDate, product);
	}
	
	@RequestMapping("api/v1/customerDetailsStacked")
	@ResponseBody
	public String CompanyData(Model model, @RequestParam(value="toTime") String startDate,
			@RequestParam(value="fromTime") String endDate, @RequestParam(value="product") String product) throws ParseException {
		return cs.CompanyData(startDate, endDate, product);
	}
	
	@RequestMapping("api/v1/countSubscribers")
	@ResponseBody
	public int countSubscribers(Model model, @RequestParam(value="toTime") String startDate,
			@RequestParam(value="fromTime") String endDate, @RequestParam(value="product") String product) throws ParseException {
		return cs.countSubscribers(startDate, endDate, product);
	}
	
	@RequestMapping("api/v1/countHours")
	@ResponseBody
	public int countHours(Model model, @RequestParam(value="toTime") String startDate,
			@RequestParam(value="fromTime") String endDate, @RequestParam(value="product") String product) throws ParseException {
		return cs.countHours(startDate, endDate, product);
	}
	
	@RequestMapping("api/v1/customerDetailsByDate")
	@ResponseBody
	public String customerDetailsByDate(Model model, @RequestParam(value="toTime") String startDate,
			@RequestParam(value="fromTime") String endDate, @RequestParam(value="product") String product) throws ParseException {
		return cs.customerDetailsByDate(startDate, endDate, product);
	}
	
	@RequestMapping("api/v1/country")
	@ResponseBody
	public String countryDetails(Model model, @RequestParam(value="toTime") String startDate,
			@RequestParam(value="fromTime") String endDate, @RequestParam(value="product") String product) throws ParseException {
		return cs.countryDetails(startDate, endDate, product);
	}
}