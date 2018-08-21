package com.nf147.ldl.dao;

import com.nf147.ldl.entity.Book;

import java.util.ArrayList;
import java.util.List;

public class BookInMemoryDAO implements BookDAO {
    private static List<Book> books = new ArrayList<>();
    static {
        //int id, String name, String author, float price
        books.add(new Book(1,"阿弥陀佛么么哒","大冰",34.0f,"南方出版社"));
        books.add(new Book(2,"他们最幸福","大冰",36.7f,"东方出版社"));
        books.add(new Book(3,"好吗？好的","大冰",40.0f,"北方出版社"));
        books.add(new Book(4,"你坏","大冰",54.0f,"西方出版社"));
        books.add(new Book(5,"平凡的世界","大冰",65.6f,"新华出版社"));
    }


    @Override
    public List<Book> listAll() {return books;}

    @Override
    public Book getBookById(int id) {
        for (Book book : books) {
            if(book.getId()==id){
                return book;
            }
        }
        return null;
    }

    @Override
    public List<Book> getBookByName(String name) {
        ArrayList<Book> book = new ArrayList<>();
        for (Book b : books) {
            if(b.getName().toLowerCase().contains(name.toLowerCase())){
                book.add(b);
            }
        }
        return book;
    }

    public List<Book> getAllField(String obj){
        ArrayList<Book> book = new ArrayList<>();
        //要搜索的信息
        String matchingField = obj.toString().toLowerCase();

        for (Book b : books) {
            if(
                    b.getName().toLowerCase().contains(matchingField)
                    || String.valueOf(b.getId()).contains(matchingField)
                    || b.getAuthor().toLowerCase().contains(matchingField)
                    || String.valueOf(b.getPrice()).contains(matchingField)
                    || b.getPress().toLowerCase().contains(matchingField)

            ){
                book.add(b);
            }
        }
        return book;
    }


    @Override
    public boolean update(Book book) {
        for (Book book1 : books) {
            if(book.getId()==book1.getId()){  //通过ID找到要修改的对象
                book1.setName(book.getName());
                book1.setAuthor(book.getAuthor());
                book1.setPrice(book.getPrice());
                book1.setPress(book.getPress());
                return true;
            }
        }

        return false;
    }

    @Override
    public boolean delete(int id) {
        for (Book book : books) {
            if(id==book.getId()){  //找到要删除的对象
                books.remove(book);
                return true;
            }
        }
        return false;
    }

    @Override
    public Book add(Book book) {
        books.add(book);
        return book;
    }
}
