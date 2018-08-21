package com.nf147.ldl.dao;

import com.nf147.ldl.entity.Book;

import java.util.List;

public interface BookDAO {
    List<Book> listAll();
    Book getBookById(int id);
    List<Book> getBookByName(String name);
    boolean update(Book book);
    boolean delete(int id);
    Book add(Book book);
}
