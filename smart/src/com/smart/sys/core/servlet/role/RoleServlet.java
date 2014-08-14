package com.smart.sys.core.servlet.role;

import com.smart.sys.core.service.role.IRoleService;
import com.smart.sys.core.servlet.SmartUtil;
import org.apache.commons.collections4.map.ListOrderedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Carey
 * Date: 14-7-28
 * Time: 下午8:15
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/role")
public class RoleServlet {

    @Autowired
    private IRoleService iRoleService;
    @Autowired
    private SmartUtil smartUtil;

    @RequestMapping("/roleListView.do")
    public String roleListView(HttpServletRequest request,ModelMap modelMap){
       Map<String,Object> requestMap= request.getParameterMap();
        int  pageSize=10;
        int  offSize=0;
        ListOrderedMap listOrderedMap=new ListOrderedMap();
        listOrderedMap.put("pageSize",pageSize);
        listOrderedMap.put("offSize",offSize);
        listOrderedMap.put("isdel",0);
        List<Map<String, Object>> list= iRoleService.queryRole(listOrderedMap);
        modelMap.put("list",list);
        return  "smart/role/indexRole";
    }


    @RequestMapping("/oldRoleListView.do")
    public String oldRoleListView(HttpServletRequest request,ModelMap modelMap){
        Map<String,Object> requestMap= request.getParameterMap();
        int  pageSize=10;
        int  offSize=0;
        ListOrderedMap listOrderedMap=new ListOrderedMap();
        listOrderedMap.put("pageSize",pageSize);
        listOrderedMap.put("offSize",offSize);
        listOrderedMap.put("isdel",1);
        List<Map<String, Object>> list= iRoleService.queryRole(listOrderedMap);
        modelMap.put("list",list);
        return  "smart/role/oldRole";
    }

    /**
     * @description  增加、删除、修改
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("/execUpdate.do")
    public String execUpdate(HttpServletRequest request,ModelMap modelMap){
        Map<String,Object> requestMap= request.getParameterMap();
        ListOrderedMap listOrderedMap =new ListOrderedMap();
        ListOrderedMap whereListOrderedMap =new ListOrderedMap();
        String ctx= request.getParameter("ctx");
        String[] ridArr= (String[]) requestMap.get("rid");
        if(null!=ctx&& "PhysicalRemoval".equals(ctx)&& ridArr.length>0) {
            listOrderedMap.clear();
            for (int i = 0; i < ridArr.length; i++) {
                listOrderedMap.put("rid", ridArr[i]);
                iRoleService.delRole(listOrderedMap);
                listOrderedMap.clear();
            }
        }
        if(null!=ctx&&"update".equals(ctx)){
            whereListOrderedMap.put("rid",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("rid")));
            Timestamp date=new Timestamp(System.currentTimeMillis());
            listOrderedMap.put("role_name",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("role_name")));
            listOrderedMap.put("role_type",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("role_type")));
            listOrderedMap.put("role_lock",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("role_lock")));
            listOrderedMap.put("role_describe",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("role_describe")));
            iRoleService.updateRole(listOrderedMap,whereListOrderedMap);
            return  roleListView(request, modelMap);
        }
        if(null!=ctx&&"save".equals(ctx)){
            Timestamp date=new Timestamp(System.currentTimeMillis());
            listOrderedMap.put("role_name",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("role_name")));
            listOrderedMap.put("role_type",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("role_type")));
            listOrderedMap.put("role_lock",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("role_lock")));
            listOrderedMap.put("role_describe",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("role_describe")));
            iRoleService.saveRole(listOrderedMap);
            return  roleListView(request, modelMap);
        }
        if(null!=ctx&&"logicDel".equals(ctx)) {
            listOrderedMap.put("isdel", 1);
            whereListOrderedMap.put("rid",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("rid")));
            iRoleService.updateRole(listOrderedMap,whereListOrderedMap);
            return  roleListView(request,modelMap);
        }
        if(null!=ctx&&"restore".equals(ctx)) {
            listOrderedMap.put("isdel", 0);
            whereListOrderedMap.put("rid",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("rid")));
            iRoleService.updateRole(listOrderedMap,whereListOrderedMap);
            return  oldRoleListView(request, modelMap);
        }

            return  roleListView(request,modelMap);
    }

    @RequestMapping("/getRoleInfo.do")
    public String getRoleInfo(HttpServletRequest request,ModelMap modelMap){
        String next=request.getParameter("next");
        Map<String,Object> requestMap= request.getParameterMap();
        ListOrderedMap listOrderedMap=new ListOrderedMap();
        listOrderedMap.put("rid",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("rid")));
        List<Map<String, Object>> list= iRoleService.queryRole(listOrderedMap);
        if(!list.isEmpty()) {
            modelMap.put("roleInfo", list.get(0));
        }
        return  "smart/role/"+next;
    }

}
