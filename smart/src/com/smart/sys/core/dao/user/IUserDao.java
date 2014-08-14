package com.smart.sys.core.dao.user;

import com.sqlmapper.entity.ExecEntity;
import com.sqlmapper.entity.QueryEntity;
import org.apache.commons.collections4.map.ListOrderedMap;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-7-28
 * Time: 下午1:07
 * To change this template use File | Settings | File Templates.
 */
public interface IUserDao {

    public QueryEntity queryUser(ListOrderedMap<String,Object> map);

    public ExecEntity saveUser(ListOrderedMap<String,Object> map);

    public ExecEntity  updateUser(ListOrderedMap<String,Object> rowMap,ListOrderedMap<String,Object> whereMap);

    public ExecEntity  delUser(ListOrderedMap<String,Object> map);
}
