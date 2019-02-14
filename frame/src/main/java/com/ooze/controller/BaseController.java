package com.ooze.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;

/**
 * 
 * <p>Title: BaseController</p>  
 * <p>Description: 基础类，其他controller都继承这个类</p>  
 * @author 王鑫  
 * @date 2019年2月13日
 */
public class BaseController{
	
	protected HttpServletRequest request;
	protected HttpServletResponse response;
    protected HttpSession session;
	
    @ModelAttribute  
    public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){  
        this.request = request;  
        this.response = response; 
        this.session = request.getSession();
    }
}