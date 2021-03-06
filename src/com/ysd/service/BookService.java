package com.ysd.service;

import java.util.List;

import com.ysd.entity.Book;
import com.ysd.entity.BookCategory;
import com.ysd.entity.Fenye;

public interface BookService {
	/**
	 * 多条件分页查询
	 * @param fenye
	 * @return
	 */
	Fenye<Book> selectBook(Fenye<Book> fenye);
	
	/**
	 * 查询所有的部门名称
	 * @return
	 */
	List<BookCategory> selectBookCategory();
	
	/**
	 * 添加一条对象
	 * @param emp
	 * @return
	 */
	Integer insertBook(Book book);
	/**
	 * 修改，根据id修改
	 * @param emp
	 * @return
	 */
	Integer updateBook(Book book);
	/**
	 * 根据id删除
	 * @param empid
	 * @return
	 */
	Integer deleteBook(int bid);
}
