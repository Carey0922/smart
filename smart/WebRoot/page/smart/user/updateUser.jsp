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
        <h2>用户更新</h2>
        <div class="baracts">
            <a href="javascript:;" class="toggle-btn"></a>
            <a href="javascript:;" class="close-btn"  onclick="closeBox('bodyInfo')"></a>
        </div>
    </div>
    <div class="box-body">
        <!--查询条件-->
            <input type="hidden" id="uid" value="${userInfo.uid}">
        <!--//查询条件-->
        <!--查询结果-->
        <div class="query-result-table m10-b">
            <table width="100%" class="table">
                <tr>
                    <td>用户名：</td>
                    <td><input type="text" id="username" value="${userInfo.username}"></td>

                </tr>
                <tr>
                    <td>Email：</td>
                    <td><input type="text" id="email" value="${userInfo.email}"></td>

                </tr>
                <tr>
                    <td>真实姓名 ：</td>
                    <td><input type="text" id="sname" value="${userInfo.sname}"></td>
                </tr>
                <tr>
                    <td>联系电话：</td>
                    <td><input type="text" id="phone_num" value="${userInfo.phone_num}"></td>

                </tr>
                <tr>
                    <td>QQ：</td>
                    <td><input type="text" id="qq" value="${userInfo.qq}"></td>
                </tr>

                <tr><td>  <input type="button"  value="更新用户"  class="btn-orange1" onclick="updateUser()"/></td>
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
    function  updateUser(){
        var  uid=$("#uid").val();
        var  username=$("#username").val();  var  password=$("#password").val();  var  email=$("#email").val();
        var  sname=$("#sname").val();  var  phone_num=$("#phone_num").val();  var  qq=$("#qq").val();
        $.ajax({
            url: '<%=path%>/user/execUpdate.do?ctx=update',
            type: "post",//使用get方法访问后台
            dataType: "json",//返回json格式的数据
            data: {uid:uid,username:username,password:password,email:email,sname:sname,phone_num:phone_num,qq:qq},
            success: function (data) {
                $("#mainFrame").html(data);
            },
            cache: false
        });
    }



</script>
</html>
