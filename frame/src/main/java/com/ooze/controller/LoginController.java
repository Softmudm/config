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
	
	/*��¼֮�󣬲��˳��ٴν����½���棬��ֱ�ӱ�ɵ�½���ҳ��*/
	@RequestMapping("/goLogin")  
    public String goLogin(){ 
		if (SecurityUtils.getSubject().isAuthenticated()) {
            return "index";
        }
        return "login"; 
    }
	
	/*��½��֤������ǰ�˴��������������ݿ�Ա�*/
	@RequestMapping(value="/goIndex",method=RequestMethod.POST)
	@ResponseBody
    public String goIndex(String account, String password){
		System.out.println("--------------����-----------------");
        Subject user = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(account, password);
        // ���ü�ס����
        try {
            user.login(token);
            //token.setRememberMe(true);
            return "success";
        } catch (UnknownAccountException e) {
            throw new RuntimeException("�˺Ų����ڣ�", e);
        } catch (DisabledAccountException e) {
            throw new RuntimeException("�˺�δ���ã�", e);
        } catch (IncorrectCredentialsException e) {
            throw new RuntimeException("�������", e);
        } catch (Throwable e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }
	/*��½�ɹ����õķ���*/
	@RequestMapping("/index")
    public String index(Model model){
		User user = (User)SecurityUtils.getSubject().getPrincipal();
		model.addAttribute("user", user);
        return "index"; 
    }
	/*�˳���¼*/
	@RequestMapping(value="/logOut")
	@ResponseBody
	public String logOut() {
        shiroDbRealm.removeUserCache((User) SecurityUtils.getSubject().getPrincipal());
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
		return "success";
	}
}