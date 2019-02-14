package com.ooze.controller;

import java.io.BufferedReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ooze.util.CipherUtil;
import com.ooze.util.JsonUtils;
import com.ooze.util.ShiroDbRealm;
import com.ooze.model.User;
import com.ooze.service.UserService;
 
/**
 * 
 * <p>Title: UserController</p>  
 * <p>Description: 用户管理</p>  
 * @author 王鑫  
 * @date 2019年2月13日
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
	@Autowired
	private UserService userService;
	
	/*查询用户列表&&去用户管理页面*/
	@RequestMapping("/getUserList")
    public String getUserList(Model model){
		List<User> user= userService.getUserList();
		model.addAttribute("users", user);
		return "usermanager";
    }
	
	@RequestMapping("/delUser")
	@ResponseBody
	public String delUser(){
		String id = request.getParameter("id");
		String msg = "Success";
		try {
			userService.delUser(Integer.parseInt(id));
		} catch(Exception e) {
			msg = "Fail";
			e.printStackTrace();
		}
		return msg;
	}
	
	@RequestMapping("/delUsers")
	@ResponseBody
	public String delUsers(){
		String msg = "Success";
		String[] data = request.getParameterValues("data");
		int[] userId = new int[data.length];
		//String数组转Int数组
		for(int i=0;i<data.length;i++){
		        userId[i] = Integer.parseInt(data[i]);
		    }
		try {
			userService.delUsers(userId);
		} catch(Exception e) {
			msg = "Fail";
			e.printStackTrace();
		}
		return msg;
	}
	
	@RequestMapping("/saveUser")
	@ResponseBody
	public String saveUser(){
		String data = request.getParameter("data");
		User newUser = (User)JsonUtils.jsonStr2Entity(data,User.class);
		User user = userService.getUserByAccount(newUser.getAccount());
		String msg = "Success";
		try{
			if(user == null){
				newUser.setPassword(CipherUtil.generatePassword(newUser.getPassword()));
				userService.addUser(newUser);
			}else{
				msg = "Fail";
			}
		}catch(Exception e){
			e.printStackTrace();
			msg = "Fail";
		}
		return msg;
	}
	
	@RequestMapping("/getEditUser")
	@ResponseBody
	public User getEditUser(){
		String id = request.getParameter("id");
		User user = userService.selectUserById(Integer.parseInt(id));
		return user;
	}
	
	@RequestMapping("/editUser")
	@ResponseBody
	public String editUser(){
		String data = request.getParameter("data");
		User newUser = (User)JsonUtils.jsonStr2Entity(data,User.class);
		User user = userService.getUserByAccount(newUser.getAccount());
		String msg = "Success";
		try{
			if(user.getPassword().equals(newUser.getPassword())){
				userService.updateUser(newUser);
			}else{
				newUser.setPassword(CipherUtil.generatePassword(newUser.getPassword()));
				userService.updateUser(newUser);
			}
		}catch(Exception e){
			e.printStackTrace();
			msg = "Fail";
		}
		return msg;
	}
}