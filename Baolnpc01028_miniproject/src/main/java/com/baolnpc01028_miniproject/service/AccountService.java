package com.baolnpc01028_miniproject.service;

import java.util.List;

import com.baolnpc01028_miniproject.entity.Account;



public interface AccountService {
	
	public Account findById(String username);
	public List<Account> getAdministrators();
	public List<Account> findAll();
	public Account create(Account account);
}	
