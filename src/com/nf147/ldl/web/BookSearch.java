package com.nf147.ldl.web;

import com.nf147.ldl.dao.BookInMemoryDAO;
import com.nf147.ldl.entity.Book;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BookSearch extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        if(name!=null || name!="") {
            List<Book> books = new BookInMemoryDAO().getAllField(name);
            req.setAttribute("books", books);
            req.getSession().setAttribute("msg","搜索的条件是：["+name+"]");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }else{
            resp.sendRedirect("/bookList");
        }




    }
}
