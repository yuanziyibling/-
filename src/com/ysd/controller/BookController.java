package com.ysd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Book;
import com.ysd.entity.BookCategory;
import com.ysd.entity.Fenye;
import com.ysd.service.BookService;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	
	@RequestMapping(value="/selectBook",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Book> selectBook(Fenye<Book> fenye,Book book,BookCategory bookCategory,Double startPrice,Double endprice){
		book.setBookCategory(bookCategory);
		fenye.setBook(book);
		return bookService.selectBook(fenye);
	}
	
	@RequestMapping(value="/selectBookCategory",method=RequestMethod.POST)
	@ResponseBody
	public List<BookCategory> selectBookCategory(){
		return bookService.selectBookCategory();
	}
	
	@RequestMapping(value="/insertBook",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertBook(Book book,BookCategory bookCategory){
		book.setBookCategory(bookCategory);
		return bookService.insertBook(book);
	}
	
	@RequestMapping(value="/updateBook",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateBook(Book book,BookCategory bookCategory){
		book.setBookCategory(bookCategory);
		System.out.println(book);
		return bookService.updateBook(book);
	}
	
	@RequestMapping(value="/deleteBook",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteBook(Integer bid){
		return bookService.deleteBook(bid);
	}
}
