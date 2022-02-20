package com.gwk.pojo;

public class User {
	
	private String name;

	private int permission;

	private String account;

	private String password;

	public User() {
	}

	public User(String name, int permission, String account, String password) {
		this.name = name;
		this.permission = permission;
		this.account = account;
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPermission() {
		return permission;
	}

	public void setPermission(int permission) {
		this.permission = permission;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User{" +
				"name='" + name + '\'' +
				", permission=" + permission +
				", account='" + account + '\'' +
				", password='" + password + '\'' +
				'}';
	}
}
