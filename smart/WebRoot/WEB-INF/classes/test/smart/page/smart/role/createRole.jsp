<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/8/8
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<from id="create">
<div class="box">
    <div class="box-head">
        <h2>角色创建</h2>
        <div class="baracts">
            <a href="javascript:;" class="toggle-btn"></a>
            <a href="javascript:;" class="close-btn"  onclick="closeBox('bodyInfo')"></a>
        </div>
    </div>
    <div class="box-body">
        <!--查询条件-->

        <!--//查询条件-->
        <!--查询结果-->
        <div class="query-result-table m10-b">
            <table width="100%" class="table">
                <tr>
                    <td>角色命名：</td>
                    <td><input type="text" id="role_name"></td>

                </tr>
                <tr>
                    <td>角色状态：</td>
                    <td><input type="text" id="role_lock"></td>

                </tr>
                <tr>
                    <td>描述</td>
                    <td><input type="text" id="role_describe"></td>
                 </tr>
                <tr>
                <td>角色类型：</td>
                <td><input type="text" id="role_type"></td>
                </tr>

                <tr><td>  <input type="button"  value="创建角色"  class="btn-orange1" onclick="createRole()"/></td>
                    <td>  <input type="button"  value="取消"  class="btn-orange1"  onclick="closeBox('bodyInfo')"/> </td></tr>
            </table>
        </div>
    </div>

</div>
</from>


</body>

<script>
    function  closeBox(did){
        $("#"+did).html("");
    }

    function  createRole(){
       var  role_name=$("#role_name").val();  var  role_type=$("#role_type").val();  var  role_lock=$("#role_lock").val();
        var  role_describe=$("#role_describe").val();
        $.ajax({
            url: '<%=path%>/role/execUpdate.do?ctx=save',
            type: "post",//使用get方法访问后台
            dataType: "json",//返回json格式的数据
            data: {role_name:role_name,role_type:role_type,role_lock:role_lock,role_describe:role_describe},
            success: function (data) {
                  $("#mainFrame").html(data);
            },
            cache: false
        });
    }

</script>
</html>
