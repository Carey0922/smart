<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
	<%
	String path = request.getContextPath();
    %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>角色管理</title>
</head>
	<style type="text/css">
	input[type="text"] {
	 background-color: transparent;
}

</style>

</head>
<body >

<form  name="SysRolerForm"   action="#" method="POST"  onkeydown="if(event.keyCode==13){return false;}">
    <div id="bodyInfo" >
    </div>
    <!--数据查询-->
    <div class="box">
        <div class="box-head">
            <h2>角色管理</h2>
            <div class="baracts">
                <a href="javascript:;" class="toggle-btn"></a>
                <a href="javascript:;" class="close-btn"></a>
            </div>
        </div>
        <div class="box-body">

            <!--//查询条件-->
            <!--查询结果-->
            <div class="query-result-table m10-b">
                <table width="100%" class="table">
                    <tr>
                        <td style="text-align: center">查询</td>
                        <td  colspan="5" ><input type="text" name ="type" vlaue="" >&nbsp;<input type="button" value="基本检索" class="btn-orange1"></td>
                        <td>
                            <input type="button" value="创建" class="btn-orange5" onclick="ShowCreateRole()"/>
                            <input type="button" value="批量删除" class="btn-orange3"/>
                        </td>

                    </tr>
                    <tr>
                        <th>全选&nbsp;<input type="checkbox"  name="checkbox"/></th>
                        <th>角色编号</th>
                        <th>角色类型</th>
                        <th>角色命名</th>
                        <th>角色描述</th>
                        <th>是否被锁定</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach var="list" items="${list}">
                    <tr>
                        <td><input type="checkbox"  name="checkbox"/> </td>
                        <td>${list.rid}</td>
                        <td>${list.role_type}</td>
                        <td>${list.role_name}</td>
                        <td>${list.role_describe}</td>
                        <td>${list.role_lock}</td>、
                        <td>
                        <input type="button"  value="逻辑删除"  class="btn-orange1"  onclick="logicDel('${list.rid}')"/>
                        <input type="button"  value="物理清除" id="physicalRemoval"  class="btn-orange3" onclick="Removal('${list.rid}')"/>
                        <input type="button"  value="启动更新"  class="btn-orange5" onclick="ShowUpdate('${list.rid}')"/>
                        <input type="button"  value="详细信息"  class="btn-orange2" onclick="ShowRoleInfo('${list.rid}')"/>
                         </td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
            <!--//查询结果-->
            <!--翻页-->
            <div class="pages clearfix">
                <div class="pages-l">共<span class="f-red1">30</span>条记录　每页显示<span class="f-red1">5</span>条记录　当前第<span class="f-red1">1/6</span>页</div>
                <div class="pages-r">
                    <a href="#" class="first">首页</a>
                    <a href="#" class="p">上一页</a>
                    <a href="#" class="n">下一页</a>
                    <a href="#" class="last">尾页</a>
                    <em>跳转</em>
                    <input type="text" class="page-num" />
                    <em>页</em>
                    <input type="button" value="确定" class="sub-btn" />
                </div>
            </div>
            <!--//翻页-->
        </div>
    </div>
	
</form>
</body>
<script type="text/javascript">
      function  Removal(rid){
          loadPageForPost('<%=path%>/role/execUpdate.do?ctx=PhysicalRemoval',{rid:rid});
      }

      function  logicDel(rid){
          loadPageForPost('<%=path%>/role/execUpdate.do?ctx=logicDel',{rid:rid});
      }

      function ShowCreateRole() {
          $.ajax({
              url: '<%=path%>/page/smart/role/createRole.jsp',
              success: function (data) {
               $("#bodyInfo").html(data);
              },
              cache: false
          });

      }
      function ShowRoleInfo(id) {
          $.ajax({
              url: '<%=path%>/role/getRoleInfo.do?rid='+id+'&next=roleInfo',
              success: function (data) {
                  $("#bodyInfo").html(data);
              },
              cache: false
          });

      }
      function ShowUpdate(id) {
          $.ajax({
              url: '<%=path%>/role/getRoleInfo.do?rid='+id+'&next=updateRole',
              success: function (data) {
                  $("#bodyInfo").html(data);
              },
              cache: false
          });
      }

</script>
</html>