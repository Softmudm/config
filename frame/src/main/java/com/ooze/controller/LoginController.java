package com.ooze.controller;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ooze.util.ShiroDbRealm;
import com.ooze.model.User;
 
@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private ShiroDbRealm shiroDbRealm;
	
	/*登录之后，不退出再次进入登陆界面，能直接变成登陆后的页面*/
	@RequestMapping("/goLogin")  
    public String goLogin(){ 
		if (SecurityUtils.getSubject().isAuthenticated()) {
            return "index";
        }
        return "login"; 
    }
	
	/*登陆认证，接受前端传来的数据与数据库对比*/
	@RequestMapping(value="/goIndex",method=RequestMethod.POST)
	@ResponseBody
    public String goIndex(String account, String password){
		System.out.println("--------------测试-----------------");
        Subject user = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(account, password);
        // 设置记住密码
        try {
            user.login(token);
            //token.setRememberMe(true);
            return "success";
        } catch (UnknownAccountException e) {
            throw new RuntimeException("账号不存在！", e);
        } catch (DisabledAccountException e) {
            throw new RuntimeException("账号未启用！", e);
        } catch (IncorrectCredentialsException e) {
            throw new RuntimeException("密码错误！", e);
        } catch (Throwable e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }
	/*登陆成功调用的方法*/
	@RequestMapping("/index")
    public String index(Model model){
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		model.addAttribute("user", user);
        return "index"; 
    }
	/*退出登录*/
	@RequestMapping(value="/logOut")
	@ResponseBody
	public String logOut() {
        shiroDbRealm.removeUserCache((User) SecurityUtils.getSubject().getPrincipal());
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
		return "success";
	}
}