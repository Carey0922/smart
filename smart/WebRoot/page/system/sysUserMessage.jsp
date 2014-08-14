<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	input, textarea {
    width: 400px;
}
	
	input[type="file"] {
	width: 400px;
	background-color: transparent;
	
}
	input[type="text"] {
	 background-color: transparent;
}



 

.table th, .table td  { border-top: 0px solid #DDDDDD;}


</style>
</head>
<body >
		<input type="hidden"  name="imageURL" id="imageURL" value="${jsh_user.useravatar}" > 
		<input type="hidden"  name="uid" id="uid" value="${jsh_user.uid }"> 
	

			<div>
				<ul class="breadcrumb">
					<li>
						  系统管理<span class="divider">/</span>
					</li>
					<li>
						 用户管理<span class="divider">/</span>
					</li>
						<li>
						用户修改
					</li>
				</ul>
			</div>

				
						
			<div>
			<table class="table  table2 table-striped  table-condensed ">
				<thead>
					<tr>
						<th colspan="2"><img src="<%=path %>/images/tablehrard.png"/>&nbsp;&nbsp;<font color="White">用户信息</font></th>
					</tr>
				</thead>
				<tbody>
				<tr>
					<td  colspan="2">
					 <fieldset>
						<legend>查询用户详细信息</legend>
						</fieldset>
					</td>
						<tr >
							<td  style="text-align: right;" width="30%"><h5>头像设置：</h5></td>
							<td id="userAvatartd">
									<img  src="<%=path %>${jsh_user.useravatar}">  
								</td>
						</tr>
					<tr>
						<td  style="text-align: right;" width="30%"><h5>用户名称：</h5></td>
						<td><input type="text" name="username" id="username" size="25" value="${jsh_user.uname }" readonly="readonly"></td>

					</tr>
					<tr>
						<td   style="text-align: right;" ><h5>用户邮箱：</h5></td>
						<td><input type="text" size="25" name="email" value="${jsh_user.email }" readonly="readonly"></td>

					</tr>

					<tr>
						<td   style="text-align: right;" ><h5> 用户状态：</h5></td>
						<td >	<c:if test="${jsh_user.active ==1}"><span class="label label-info">活动状态</span></c:if>
								 <c:if test="${jsh_user.active ==0}"> <span class="label label-warning">禁用状态</span></c:if>
					  </td>
					</tr>
					<tr>
						<td   style="text-align: right;" ><h5>密码设置：</h5></td>
						<td><input type="text" size="25" name="password" id="password"  value="${jsh_user.upassword}" readonly="readonly"></td>
					</tr>
							<tr>
								<td   style="text-align: right;" ><h5>手机号码：</h5></td>
							<td><input type="text" size="25" name="phonenumber" value="${jsh_user.phonenumber }" readonly="readonly"></td>
						</tr>
						

						<tr>
				            
					
							<td   style="text-align: right;" ><h5>真实姓名：</h5></td>
							<td><input type="text" size="25" name="sname" id="sname" value="${jsh_user.sname }" readonly="readonly"></td>
					</tr>
			<tr >
			
		
					<tr>
					<td colspan="2"style="text-align:center;">
						<button class="btn   btn-primary" type="button" onclick="indexlocalhost()">返回用户列表</button>
				</td>
				</tr>
						
		</tbody>
					</table>
					
		
			<!--/span-->
</div>

</body>
<script type="text/javascript">
function  indexlocalhost(){
gotoAddPage("<%=path %>/SystemUser/displayIndex.do");
}
</script>

</html>
