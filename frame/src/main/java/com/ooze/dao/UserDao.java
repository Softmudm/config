package com.ooze.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ooze.model.User;
import com.ooze.model.Permission;
import com.ooze.model.Role;
 

public interface UserDao {

	User selectUserById(Integer userId);
 
	User getUserByAccount(@Param("account")String account);
	
	int getUserIdByUserName(String username);
	
	int getRoleIdByUserId(int userId);
	
	List<Role> findRoles(int userId);
	
	List<Permission> findPermissions(int roleId);
	
	List<User> getUserList();
	
	int delUser(int userId) throws Exception;
	
	int addUser(User user) throws Exception;
	
	int delUsers(int[] userId) throws Exception;
	
	int updateUser(User user) throws Exception;
}
