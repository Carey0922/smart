package com.smart.sys.core.servlet;

import org.springframework.stereotype.Service;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-8-7
 * Time: 下午1:07
 * To change this template use File | Settings | File Templates.
 */
@Service
public class SmartUtil {
    public  <T>T  getArrayOfFirstData(T[] strings){
        T t=null;
        if(strings!=null) {
            if (strings.length > 0) {
                t = strings[0];
            }
        }
        return  t;
    }
}
