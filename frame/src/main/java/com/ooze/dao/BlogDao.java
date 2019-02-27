package com.ooze.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ooze.model.Blog;


public interface BlogDao {

	List<Blog> getBlogList();
	
	List<Blog> getBlogList1(int id);
	
	int addBlog(Blog blog) throws Exception;
}
