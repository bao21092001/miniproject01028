package com.baolnpc01028_miniproject.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baolnpc01028_miniproject.DAO.AccountDAO;
import com.baolnpc01028_miniproject.DAO.AuthorityDAO;
import com.baolnpc01028_miniproject.entity.Account;
import com.baolnpc01028_miniproject.entity.Authority;
import com.baolnpc01028_miniproject.service.AuthorityService;


@Service
public class AuthorityServiceImpl implements AuthorityService{
	
	@Autowired
	AuthorityDAO dao;
	
	@Autowired
	AccountDAO acdao;

	@Override
	public List<Authority> findAuthoritiesOfAdministrators() {
		List<Account> accounts = acdao.getAdministrators();
		return dao.authoritiesOf(accounts);
	}

	@Override
	public List<Authority> findAll() {
		return dao.findAll();
	}

	@Override
	public Authority create(Authority auth) {
		return dao.save(auth);
	}

	@Override
	public void delete(Integer id) {
		dao.deleteById(id);
	}

}
