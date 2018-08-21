package com.nf147.ldl.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;

public class WebUtil {
    /**
     *  消息提示方法
     */
    public static String showMessage(HttpServletRequest req){
        HttpSession session = req.getSession();
        String msg = (String)session.getAttribute("msg");
        String result = "";
        if(msg != null && !msg.isEmpty()){
            result = "<div class=\"alert alert-primary\" role=\"alert\">"+msg+"</div>";
        }
        session.setAttribute("msg",null);
        return result;
    }

    /**
     *   编码格式设置
     * */
    public static void setEncoded(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
    }

}
