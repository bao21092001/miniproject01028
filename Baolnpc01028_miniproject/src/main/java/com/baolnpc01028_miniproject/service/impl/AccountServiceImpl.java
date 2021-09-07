package com.baolnpc01028_miniproject.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baolnpc01028_miniproject.DAO.AccountDAO;
import com.baolnpc01028_miniproject.entity.Account;
import com.baolnpc01028_miniproject.service.AccountService;


@Service
public class AccountServiceImpl implements AccountService{
	
	@Autowired
	AccountDAO dao;

	@Override
	public Account findById(String username) {
		return dao.findById(username).get();
	}

	@Override
	public List<Account> getAdministrators() {
		return dao.getAdministrators();
	}

	@Override
	public List<Account> findAll() {
		return dao.findAll();
	}

	@Override
	public Account create(Account account) {
		return dao.save(account);
	}
	

}
