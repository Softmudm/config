package com.ooze.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ooze.util.ShiroDbRealm;
import com.ooze.model.User;
import com.ooze.service.UserService;
 
@Controller
@RequestMapping("/hygl")
public class HyglController extends BaseController{
	@Autowired
	private UserService userService;
	
	/*查询用户列表&&去用户管理页面*/
	@RequestMapping("/goHy")
    public String goHy(){
		return "user-list";
    }
	@RequestMapping("/goTj")
    public String goTj(){
		return "user-add";
    }
}