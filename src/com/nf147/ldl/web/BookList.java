package com.nf147.ldl.web;

import com.nf147.ldl.dao.BookInMemoryDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class BookList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BookInMemoryDAO dao = new BookInMemoryDAO();
        req.setAttribute("books",dao.listAll());
        //req.getSession().setAttribute("msg",null);
        req.getRequestDispatcher("index.jsp").forward(req,resp);
        //req.getRequestDispatcher("").include(req,resp);

    }
}
