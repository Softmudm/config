package com.ooze.service;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.ooze.model.Blog;

public interface BlogService {
	
	List<Blog> getBlogList();
	
	List<Blog> getBlogList1(int id);
	
	int addBlog(Blog blog) throws Exception;
}
