package com.smart.sys.core.dao.manager;

import com.sqlmapper.entity.ExecEntity;
import com.sqlmapper.entity.QueryEntity;
import org.apache.commons.collections4.map.ListOrderedMap;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-7-29
 * Time: 上午10:34
 * To change this template use File | Settings | File Templates.
 */
public interface IUserRoleDao {

    /**
     * @description  用户授权角色
     * @param map
     * @return
     */
     public ExecEntity roleAuthorize(ListOrderedMap<String,Object> map);

    /**
     * @description  角色授权资源
     * @param map
     * @return
     */
     public ExecEntity resourceAuthorize(ListOrderedMap<String,Object> map);


    /**
     * @description  查询用户的角色信息
     * @param map
     * @return
     */
    public QueryEntity  queryUserRole(ListOrderedMap<String,Object>map) throws Exception;


    /**
     * @description  查询角色资源信息
     * @param map
     * @return
     */
    public QueryEntity  queryRoleResource(ListOrderedMap<String,Object> map) throws Exception;
}
