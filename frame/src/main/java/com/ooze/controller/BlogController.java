package com.ooze.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ooze.util.CipherUtil;
import com.ooze.util.JsonUtils;
import com.ooze.util.ShiroDbRealm;
import com.ooze.model.Blog;
import com.ooze.model.User;
import com.ooze.service.BlogService;
import com.ooze.service.UserService;
 
@Controller
@RequestMapping("/blog")
public class BlogController extends BaseController{
	@Autowired
	private BlogService blogService;
	
	/*管理员查询全部博客列表&&去博客管理页面*/
	@RequestMapping("/getBlogList")
    public String getBlogList(Model model){
		List<Blog> blog = blogService.getBlogList();
		model.addAttribute("blogs", blog);
		return "blog";
    }
	/*查询个人博客列表&&管理页面*/
	@RequestMapping("/getBlogList1")
    public String getBlogList1(Model model){
		String userId = request.getParameter("userId");
		int id = Integer.parseInt(userId);
		List<Blog> blog= blogService.getBlogList1(id);
		model.addAttribute("blogs", blog);
		return "blog1";
    }
	/*转到写博客页面*/
	@RequestMapping("/goWriteBlog")
    public String goWriteBlog(){
		return "writeblog";
    }
	/*保存博客*/
	@RequestMapping("/saveBlog")
	@ResponseBody
    public String saveBlog(){
		String data = request.getParameter("data");
		Blog blog = (Blog)JsonUtils.jsonStr2Entity(data,Blog.class);
		User user = (User) SecurityUtils.getSubject().getPrincipal();//获取当前登录用户id设为作者
		String msg = "Success";
		try{
			blog.setUserId(user.getUserId());
			blogService.addBlog(blog);
		}catch(Exception e){
			e.printStackTrace();
			msg = "Fail";
		}
		return msg;
    }
}