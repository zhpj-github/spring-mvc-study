package com.sealinetech.pojo;


import java.util.HashMap;
import java.util.Map;

/**
 * 返回处理结果
 */
public class ResultMsg {
    private String code;
    private String msg;
    private Map<String,Object> extend = new HashMap<>();

    public static ResultMsg success(){
        ResultMsg msg = new ResultMsg();
        msg.setCode("1");
        msg.setMsg("成功");
        return msg;
    }
    public static ResultMsg fail(){
        ResultMsg msg = new ResultMsg();
        msg.setCode("-1");
        msg.setMsg("失败");
        return msg;
    }
    public ResultMsg add(String key,Object value){
        this.extend.put(key,value);
        return this;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
