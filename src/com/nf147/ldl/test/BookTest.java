package com.nf147.ldl.test;

import com.nf147.ldl.dao.BookDAO;
import com.nf147.ldl.dao.BookInMemoryDAO;

public class BookTest {

    public static void main(String[] args) {
        BookDAO dao = new BookInMemoryDAO();
       System.out.println(dao.listAll());

        System.out.println(dao.getBookByName("他"));

//        String str = "要不然叫我大哥jQuery。";
//        String s = "jq";
//        if(str.toUpperCase().contains(s.toUpperCase())){
//            System.out.println(true);
//        }else{
//            System.out.println(false);
//        }

  //      showMessage("我听见 I say",true);

    }

    public static void showMessage(String s,boolean bool){
       if(bool){
           System.out.println(s.toLowerCase());
       }else{
           System.out.println(s.toUpperCase());
       }
    }

    public static void showMessage(String s){
        showMessage(s,true);
    }
}
