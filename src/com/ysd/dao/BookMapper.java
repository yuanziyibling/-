package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Book;
import com.ysd.entity.BookCategory;
import com.ysd.entity.Fenye;

public interface BookMapper {
	/**
	 * ��������ҳ��ѯ
	 * @param fenye
	 * @return
	 */
	List<Book> selectBook(Fenye<Book> fenye);
	/**
	 * ��������ѯ������
	 * @param fenye
	 * @return
	 */
	Integer selectBookCount(Fenye<Book> fenye);
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
