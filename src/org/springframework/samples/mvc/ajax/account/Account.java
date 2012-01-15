package org.springframework.samples.mvc.ajax.account;

import java.util.Date;
import java.util.concurrent.atomic.AtomicLong;

import javax.validation.constraints.NotNull;

import org.springframework.core.style.ToStringCreator;

public class Account {

	private Long id;

	@NotNull(message ="Name shouldn't be emtly")
	private String name;

	@NotNull
	private Double balance = new Double("1000");

	@NotNull
	private Double equityAllocation = new Double(".60");

	
	private Date renewalDate = new Date(new Date().getTime() + 31536000000L);

	public Long getId() {
		return id;
	}

	void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public Double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
	}

	public Double getEquityAllocation() {
		return equityAllocation;
	}

	public void setEquityAllocation(Double equityAllocation) {
		this.equityAllocation = equityAllocation;
	}

	public static AtomicLong getIdsequence() {
		return idSequence;
	}

	public Date getRenewalDate() {
		return renewalDate;
	}

	public void setRenewalDate(Date renewalDate) {
		this.renewalDate = renewalDate;
	}

	Long assignId() {
		this.id = idSequence.incrementAndGet();
		return id;
	}

	private static final AtomicLong idSequence = new AtomicLong();

	public String toString() {
		return new ToStringCreator(this).append("id", id).append("name", name)
				.append("balance", balance).append("equityAllocation",
						equityAllocation).append("renewalDate", renewalDate)
				.toString();
	}

}