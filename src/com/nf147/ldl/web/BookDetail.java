package com.nf147.ldl.web;

import com.nf147.ldl.dao.BookDAO;
import com.nf147.ldl.dao.BookInMemoryDAO;
import com.nf147.ldl.entity.Book;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class BookDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        System.out.println(id);
        BookDAO dao = new BookInMemoryDAO();
        Book book = dao.getBookById(id);
        req.setAttribute("book",book);
        req.getSession().setAttribute("msg","修改成功！");
        req.getRequestDispatcher("detail_book.jsp").forward(req,resp);
    }
}
