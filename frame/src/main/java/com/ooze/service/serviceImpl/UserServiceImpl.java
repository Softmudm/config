package com.ooze.service.serviceImpl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ooze.model.Permission;
import com.ooze.model.Role;
import com.ooze.dao.UserDao;
import com.ooze.model.User;
import com.ooze.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
 
	public User selectUserById(Integer userId) {
		return userDao.selectUserById(userId);
	}
	
	public User getUserByAccount(String account) {
		return userDao.getUserByAccount(account);
	}
	
	public int getUserIdByUserName(String username){
		return userDao.getUserIdByUserName(username);
	}
	
	public int getRoleIdByUserId(int userId){
		return userDao.getRoleIdByUserId(userId);
	}
 
	public Set<String> findRoles(int userId) {
		Set<String> roles = new HashSet<String>();
		List<Role> roleIdList = userDao.findRoles(userId);
		if(roleIdList != null && roleIdList.size() > 0) {
        	Integer[] roleIds = new Integer[roleIdList.size()];
            for(int i = 0; i < roleIds.length; i++) {
            	roleIds[i] = roleIdList.get(i).getRoleId();
            	roles.add(roleIdList.get(i).getRoleId().toString());
            }
		}
		return roles;
	}
	
	public Set<String> findPermissions(int roleId){
		Set<String> permissions = new HashSet<String>();
		List<Permission> permissionIdList = userDao.findPermissions(roleId);
		if(permissionIdList != null && permissionIdList.size() > 0) {
        	Integer[] permissionIds = new Integer[permissionIdList.size()];
            for(int j = 0; j < permissionIds.length; j++) {
            	permissionIds[j] = permissionIdList.get(j).getPermissionId();
            	permissions.add(permissionIdList.get(j).getPermissionId().toString());
            }
		}
		return permissions;
	}
	
	public List<User> getUserList(){
		return userDao.getUserList();
	}
	
	public int delUser(int userId) throws Exception{
		return userDao.delUser(userId);
	}
	
	public int addUser(User user) throws Exception{
		return userDao.addUser(user);
	}
	
	public int delUsers(int[] userId) throws Exception{
		return userDao.delUsers(userId);
	}
}
