package com.ooze.service;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;
import com.ooze.model.User;

public interface UserService {
	
	User selectUserById(Integer userId);
 
	User getUserByAccount(String account);
	
	int getUserIdByUserName(String username);
	
	int getRoleIdByUserId(int userId);
	
	Set<String> findRoles(int userId);
	
	Set<String> findPermissions(int roleId);
	
	List<User> getUserList();
	
	int delUser(int userId) throws Exception;
	
	int addUser(User user) throws Exception;
	
	int delUsers(int[] userId) throws Exception;
}
