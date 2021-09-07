package com.baolnpc01028_miniproject.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.baolnpc01028_miniproject.entity.Product;



public interface ProductDAO extends JpaRepository<Product, Integer> {

	@Query("SELECT p FROM Product p WHERE p.category.id=?1")
	List<Product> findByCategoryId(String cid);

}