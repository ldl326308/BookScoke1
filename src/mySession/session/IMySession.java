package mySession.session;

public interface IMySession {
    String id();  //获得Session id方法
    void set(String key,Object value);  //写入一个Session的数据
    Object get(String key);  //通过key获得value值
}
