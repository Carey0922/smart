package com.smart.sys.core.service.user;

import com.sqlmapper.entity.QueryEntity;
import org.apache.commons.collections4.map.ListOrderedMap;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-7-28
 * Time: 下午6:37
 * To change this template use File | Settings | File Templates.
 */
public interface IUserService {

    public List<Map<String, Object>> queryUser(ListOrderedMap<String, Object> map);

    public void saveUser(ListOrderedMap<String,Object> map);

    public void  updateUser(ListOrderedMap<String,Object> rowMap,ListOrderedMap<String,Object> whereMap);

    public void  delUser(ListOrderedMap<String,Object> map);
}
