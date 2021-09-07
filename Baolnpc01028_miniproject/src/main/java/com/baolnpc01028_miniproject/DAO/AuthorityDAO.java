package com.baolnpc01028_miniproject.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.baolnpc01028_miniproject.entity.Account;
import com.baolnpc01028_miniproject.entity.Authority;



public interface AuthorityDAO extends JpaRepository<Authority, Integer> {
	
	@Query("SELECT DISTINCT a FROM Authority a WHERE a.account IN ?1")
	List<Authority> authoritiesOf(List<Account> accounts);

}
