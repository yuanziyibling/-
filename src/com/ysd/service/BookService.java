package com.ysd.service;

import java.util.List;

import com.ysd.entity.Book;
import com.ysd.entity.BookCategory;
import com.ysd.entity.Fenye;

public interface BookService {
	/**
	 * ��������ҳ��ѯ
	 * @param fenye
	 * @return
	 */
	Fenye<Book> selectBook(Fenye<Book> fenye);
	
	/**
	 * ��ѯ���еĲ�������
	 * @return
	 */
	List<BookCategory> selectBookCategory();
	
	/**
	 * ���һ������
	 * @param emp
	 * @return
	 */
	Integer insertBook(Book book);
	/**
	 * �޸ģ�����id�޸�
	 * @param emp
	 * @return
	 */
	Integer updateBook(Book book);
	/**
	 * ����idɾ��
	 * @param empid
	 * @return
	 */
	Integer deleteBook(int bid);
}
