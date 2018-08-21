package mySession.session;

import java.util.HashMap;
import java.util.Map;

public class MemorySession implements IMySession {
    // 保存session对象保存的数据
    private Map<String,Object> data = new HashMap<>();
    // session 的 id
    private String id;

    public MemorySession(){}

    public MemorySession(String id){
        this.id=id;
    }

    @Override
    public String id() {  //获得id的方法
        return this.id;
    }

    @Override
    public void set(String key, Object value) {   //写入内容的方法
        data.put(key,value);
    }

    @Override
    public Object get(String key) {  //获得内容的方法
        return data.get(key);
    }
}
