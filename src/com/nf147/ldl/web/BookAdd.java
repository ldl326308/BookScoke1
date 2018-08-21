package com.nf147.ldl.web;


import com.nf147.ldl.dao.BookDAO;
import com.nf147.ldl.dao.BookInMemoryDAO;
import com.nf147.ldl.entity.Book;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class BookAdd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String author = req.getParameter("author");
        float price = Float.parseFloat(req.getParameter("price"));
        String press = req.getParameter("press");
        BookDAO dao = new BookInMemoryDAO();
        dao.add(new Book(id,name,author,price,press));
        System.out.println(dao.listAll());
        req.getSession().setAttribute("msg","添加成功！");
        resp.sendRedirect("bookList");

    }
}
