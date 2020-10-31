package com.example.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.model.AzureSecond;

@Repository
public interface AzureSecondDAO extends JpaRepository<AzureSecond, Integer>{
	@Query(value = "select count(c.subId), EXTRACT(MONTH FROM c.acquiredDate), EXTRACT(YEAR FROM c.acquiredDate) from AzureSecond c where "
    		+ "c.acquiredDate BETWEEN ?1 AND ?2 group by EXTRACT(MONTH FROM c.acquiredDate),EXTRACT(YEAR FROM c.acquiredDate)")
	 List<Object[]> findSubscribersByDate(Date start, Date end,String product);
	 
	 @Query(value = "select count(c.subId), EXTRACT(MONTH FROM c.acquiredDate), EXTRACT(YEAR FROM c.acquiredDate) from AzureSecond c where "
	    		+ "c.acquiredDate BETWEEN ?1 AND ?2 group by EXTRACT(MONTH FROM c.acquiredDate),EXTRACT(YEAR FROM c.acquiredDate)")
	 List<Object[]> findAllSubscribersByDate(Date start, Date end);
	 //
	 //
	 @Query(value = "select count(c.subId) from AzureSecond c where "
	    		+ "c.acquiredDate BETWEEN ?1 AND ?2")
	 Integer findcountSubscribers(Date start, Date end,String product);
	 
	 @Query(value = "select count(c.subId) from AzureSecond c where "
	    		+ "c.acquiredDate BETWEEN ?1 AND ?2")
	 Integer findAllcountSubscribers(Date start, Date end);
}
