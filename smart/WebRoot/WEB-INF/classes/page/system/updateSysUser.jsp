<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="<%=path %>/css/bootstrap-responsive.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap-classic.css" rel="stylesheet">
<script type="text/javascript" src="<%=path %>/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=path %>/jquery/jquery.form.js"></script>
<style type="text/css">
.table td{
  padding: 8px;
  line-height: 20px;
  text-align: left;
  vertical-align: top;
  border-top: 1px solid #dddddd;
}
</style>
</head>
<body>
	<form id="SystemUserForm"  name="SystemUserForm" action="<%=path%>/SystemUser/saveUsers.do"  method="post" >
	<input type="hidden"  name="imageName" id="imageName"> 
		<input type="hidden"  name="imageURL" id="imageURL"> 
		<div class="row-fluid sortable">
			<div>
				<ul class="breadcrumb">
					<li><a href="#">系统管理</a> <span class="divider">/</span></li>
					<li><a href="#">用户管理</a><span class="divider">/</span></li>
					<li><a href="#">用户添加</a></li>
				</ul>
			</div>

			<div class="box span11">
				<div class="box-header well">
					<h2>
						<i class="icon-user"></i> 用户添加
					</h2>
					<div class="box-icon">
						<a href="#" class="btn btn-setting btn-round"><i
							class="icon-cog"></i></a> <a href="#"
							class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
						<a href="#" class="btn btn-close btn-round"><i
							class="icon-remove"></i></a>
					</div>
				</div>
				<div>
					<table
						class="table table-striped table-bordered bootstrap-datatable datatable">
						<tr>
							<td>用户名称：</td>
							<td><input type="text" name="username" size="25"></td>
							<td>姓名：</td>
							<td><input type="text" size="25" name="sname"></td>
						</tr>
						<tr>
							<td>用户邮箱：</td>
							<td><input type="text" size="25" name="email"></td>
							<td>手机号码：</td>
							<td><input type="text" size="25" name="phonenumber"></td>
						</tr>

						<tr>
							<td>用户状态：</td>
							<td>
									<select name="active"> 
								 		<option value="1">活动的</option>
								 		<option value="0">禁用的</option>
								 </select>
								 
							</td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td>密码设置：</td>
							<td><input type="text" size="25"></td>
							<td>确认密码：</td>
							<td><input type="text" size="25" name="password"></td>
						</tr>

						<tr>
							
							<td>请选择头像</td>
							<td id="userAvatartd">
							
							<input type="file" size="19"
								class="btn btn-close btn-round" name="userAvatar"> <input type="button"  class="btn btn-primary" value="上传头像" onclick="ajaxS()"></td>
							<td></td>
							<td></td>
						</tr>
							<tr>
				            
					
							<td  style="text-align: right;"   ><h5>所属区域：</h5></td>
							<td>
								<select name="orzid" id="orzid">
                       			<option value="">------选择机构------</option>
                       			<option value="1">枣阳市国土局</option>
                       			<option value="2">枣阳市规划局</option>
                       			<option value="3">枣阳市建设局</option>
                       			<option value="4">枣阳市房产局</option>
                       			<option value="5">枣阳市执法局</option>
                       </select>
							</td>
					</tr>
					</table>
				</div>
				<div class="form-actions" align="center">
					<button class="btn  btn-large btn-primary" type="button" onclick=" submitFrom()">保存用户</button>
					&nbsp; &nbsp;
					<button class="btn btn-large btn-danger" type="reset">重 置</button>
				</div>
			</div>
			<!--/span-->


		</div>
		<!--/row-->
	</form>

</body>


</html>
