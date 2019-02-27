package com.ooze.service.serviceImpl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ooze.dao.BlogDao;
import com.ooze.model.Blog;
import com.ooze.service.BlogService;

@Service
public class BlogServiceImpl implements BlogService{
	
	@Autowired
	private BlogDao blogDao;
 
	public List<Blog> getBlogList(){
		return blogDao.getBlogList();
	}
	
	public List<Blog> getBlogList1(int id){
		return blogDao.getBlogList1(id);
	}
	
	public int addBlog(Blog blog) throws Exception{
		return blogDao.addBlog(blog);
	}
}
