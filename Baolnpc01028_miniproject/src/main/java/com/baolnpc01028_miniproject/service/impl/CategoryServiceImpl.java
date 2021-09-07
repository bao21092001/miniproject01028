package com.baolnpc01028_miniproject.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baolnpc01028_miniproject.DAO.CategoryDAO;
import com.baolnpc01028_miniproject.entity.Category;
import com.baolnpc01028_miniproject.service.CategoryService;


@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryDAO cdao;

	@Override
	public List<Category> findAll() {
		return cdao.findAll();
	}

}
