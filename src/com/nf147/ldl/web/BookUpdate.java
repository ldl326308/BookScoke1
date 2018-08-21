package com.nf147.ldl.web;

import com.nf147.ldl.dao.BookInMemoryDAO;
import com.nf147.ldl.entity.Book;
import com.nf147.ldl.util.WebUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BookUpdate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        WebUtil.setEncoded(req,resp);

        int id = Integer.parseInt(req.getParameter("id"));
        Book book = new BookInMemoryDAO().getBookById(id);
        req.setAttribute("book",book);
        req.getRequestDispatcher("/update_book.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        WebUtil.setEncoded(req,resp);

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String author = req.getParameter("author");
        float price = Float.parseFloat(req.getParameter("price"));
        String press = req.getParameter("press");
        new BookInMemoryDAO().update(new Book(id,name,author,price,press));
        req.getSession().setAttribute("msg","修改成功！");
        resp.sendRedirect("/bookList");


    }
}
