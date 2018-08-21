package mySession.session;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class SessionFactory {

    /*
            Cookie 的数据保存在浏览器
            Session 的数据保存在服务器端

            1 session保存在服务器，客户端不知道其中的信息；cookie保存在客户端，服务端可以知道其中的信息
　　        2 session中保存的是对象，cookie中保存的是字符串
            3 session不能区分路径，同一个用户在访问一个网站期间，所有的session在任何一个地方都可以访问到；
                而cookie中如果设置了路径参数，那么同一个网站中不同路径下的cookie互相是访问不道德。
     */


    //为每个连接的Session 设置一个id,通过下面的变量保存
    private final static String THISSESSION_KEY = "MY_SESSION_NAME";

    //定义一个静态集合，保存所有连接过的Session，静态的只要服务器在运行就会一直存在
    private static Map<String,MemorySession> sessions = new HashMap<>();

    //获得Session方法
    public static MemorySession getSession(HttpServletRequest req, HttpServletResponse resp){
        String sid = null;
        MemorySession session = null;

        //Cookie key = 某个程序的标志   value = Session 的标志
        //获得所有Cookie，查找出Session 的 id
        Cookie[] cookies = req.getCookies();
        for (Cookie cookie : cookies) {
            if(cookie.getName().equals(THISSESSION_KEY)){
                sid = cookie.getValue();
                break;
            }
        }

        //如果Cookie集合没有取到session 的id，则说明是第一次访问
        //初始化session
        if(checkSessionId(sid)){
            //生成唯一id，并生成session，保存到cookie里
            sid = createSessionId();
            System.out.println("sid   :   "+sid);
            session = createNewSession(sid);
            resp.addCookie(new Cookie(THISSESSION_KEY,sid));
        }else{
            //如果不是第一次访问，通过sessions获得session对象
            session = sessions.get(sid);
            //如果拿到是null，则需要创建session
            if(session==null){
                session = createNewSession(sid);
            }
        }
        //创建或查找完成，则返回session对象
        return session;
    }



    /**
     *  sid 验证方法
     */
    private static boolean checkSessionId(String sid){     return sid==null || sid.isEmpty();    }

    /**
     *    生成唯一Session id
     */
    private static String createSessionId(){ return String.valueOf(UUID.randomUUID()); }

    /**
    *   创建一个session ,并保存到sessions中
    */
    private static MemorySession createNewSession(String sid){
        MemorySession session = new MemorySession(sid);
        sessions.put(sid,session);
        return session;
    }
}
