package com.smart.sys.core.servlet.user;

import com.smart.sys.core.service.user.IUserService;
import com.smart.sys.core.servlet.SmartUtil;
import org.apache.commons.collections4.map.ListOrderedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
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
@RequestMapping("/user")
public class UserServlet {
    @Autowired
    private IUserService iUserService;
    @Autowired
    private SmartUtil smartUtil;

    @RequestMapping("/userPageView.do")
    public String userListView(HttpServletRequest request,ModelMap modelMap){
       Map<String,Object> requestMap= request.getParameterMap();
        int  pageSize=10;
        int  offSize=0;
        ListOrderedMap listOrderedMap=new ListOrderedMap();
        listOrderedMap.put("pageSize",pageSize);
        listOrderedMap.put("offSize",offSize);
        listOrderedMap.put("isdel",0);
        List<Map<String, Object>> list= iUserService.queryUser(listOrderedMap);
        modelMap.put("list",list);
        return  "smart/user/indexUser";
    }


    @RequestMapping("/oldUserListView.do")
    public String oldUserListView(HttpServletRequest request,ModelMap modelMap){
        Map<String,Object> requestMap= request.getParameterMap();
        int  pageSize=10;
        int  offSize=0;
        ListOrderedMap listOrderedMap=new ListOrderedMap();
        listOrderedMap.put("pageSize",pageSize);
        listOrderedMap.put("offSize",offSize);
        listOrderedMap.put("isdel",1);
        List<Map<String, Object>> list= iUserService.queryUser(listOrderedMap);
        modelMap.put("list",list);
        return  "smart/user/oldUser";
    }

    /**
     * @description  增加、删除、修改 用户信息
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
        String[] uidArr= (String[]) requestMap.get("uid");
        if(null!=ctx&& "PhysicalRemoval".equals(ctx)&& uidArr.length>0) {
            listOrderedMap.clear();
            for (int i = 0; i < uidArr.length; i++) {
                listOrderedMap.put("uid", uidArr[i]);
                iUserService.delUser(listOrderedMap);
                listOrderedMap.clear();
            }
        }
        if(null!=ctx&&"update".equals(ctx)){
            whereListOrderedMap.put("uid",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("uid")));
            listOrderedMap.put("username",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("username")));
            listOrderedMap.put("sname",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("sname")));
            listOrderedMap.put("qq",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("qq")));
            listOrderedMap.put("phone_num",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("phone_num")));
            listOrderedMap.put("update_date",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("update_date")));
            listOrderedMap.put("update_user",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("update_user")));
            listOrderedMap.put("email",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("email")));
            iUserService.updateUser(listOrderedMap,whereListOrderedMap);
        }
        if(null!=ctx&&"save".equals(ctx)){
            Timestamp date=new Timestamp(System.currentTimeMillis());
            listOrderedMap.put("sname",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("sname")));
            listOrderedMap.put("username",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("username")));
            listOrderedMap.put("password",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("password")));
            listOrderedMap.put("create_user",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("create_user")));
            listOrderedMap.put("create_date",date);
            listOrderedMap.put("qq",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("qq")));
            listOrderedMap.put("phone_num",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("phone_num")));
            listOrderedMap.put("update_date",date);
            listOrderedMap.put("update_user",1);
            listOrderedMap.put("email",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("email")));
            iUserService.saveUser(listOrderedMap);
        }
        if(null!=ctx&&"logicDel".equals(ctx)) {
            listOrderedMap.put("isdel", 1);
            whereListOrderedMap.put("uid",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("uid")));
            iUserService.updateUser(listOrderedMap,whereListOrderedMap);
        }
        if(null!=ctx&&"restore".equals(ctx)) {
            listOrderedMap.put("isdel", 0);
            whereListOrderedMap.put("uid",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("uid")));
            iUserService.updateUser(listOrderedMap,whereListOrderedMap);
            return  oldUserListView(request,modelMap);
        }

            return  userListView(request,modelMap);
    }

    @RequestMapping("/getUserInfo.do")
    public String getUserInfo(HttpServletRequest request,ModelMap modelMap){
        String next=request.getParameter("next");
        Map<String,Object> requestMap= request.getParameterMap();
        ListOrderedMap listOrderedMap=new ListOrderedMap();
        listOrderedMap.put("uid",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("uid")));
        List<Map<String, Object>> list= iUserService.queryUser(listOrderedMap);
        if(!list.isEmpty()) {
            modelMap.put("userInfo", list.get(0));
        }
        return  "smart/user/"+next;
    }

}
