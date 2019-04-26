package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.BookMapper;
import com.ysd.entity.Book;
import com.ysd.entity.BookCategory;
import com.ysd.entity.Fenye;

@Service
public class BookServiceImpl implements BookService{
	@Autowired
	private BookMapper bookMapper;
	
	@Override
	public Fenye<Book> selectBook(Fenye<Book> fenye) {
		// TODO Auto-generated method stub
		List<Book> rows = bookMapper.selectBook(fenye);
		fenye.setRows(rows);
		Integer total = bookMapper.selectBookCount(fenye);
		fenye.setTotal(total);
		return fenye;
	}

	@Override
	public List<BookCategory> selectBookCategory() {
		// TODO Auto-generated method stub
		return bookMapper.selectBookCategory();
	}

	@Override
	public Integer insertBook(Book book) {
		// TODO Auto-generated method stub
		return bookMapper.insertBook(book);
	}

	@Override
	public Integer updateBook(Book book) {
		// TODO Auto-generated method stub
		return bookMapper.updateBook(book);
	}

	@Override
	public Integer deleteBook(int bid) {
		// TODO Auto-generated method stub
		return bookMapper.deleteBook(bid);
	}
	
}
