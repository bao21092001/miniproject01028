package com.baolnpc01028_miniproject.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baolnpc01028_miniproject.DAO.RoleDAO;
import com.baolnpc01028_miniproject.entity.Role;
import com.baolnpc01028_miniproject.service.RoleService;


@Service
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	RoleDAO dao;

	@Override
	public List<Role> findAll() {
		return dao.findAll();
	}

}
