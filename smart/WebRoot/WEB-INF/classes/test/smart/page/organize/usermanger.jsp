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
<title>用户列表</title>
<link href="<%=path %>/css/bootstrap-responsive.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap-classic.css" rel="stylesheet">
<style type="text/css">
.query{
	   padding-top: 0px; 
		padding-top: 8px; 
		padding-left: 10px;
		width: 10%;
}
</style>
</head>
<body>
<div class="row-fluid sortable">		
			<div>
				<ul class="breadcrumb">
					<li>
						<a href="#">组织机构</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">用户管理</a>
					</li>
				</ul>
			</div>
			<form  action="<%=path %>/organize/toUserManage.do?offId=${offId }" name="myform" id="myform" method="POST" >
				<div class="box span11">
					<div class="box-header well" >
						<h2><i class="icon-user"></i> 用户管理</h2>
						<div class="box-icon">
							<a href="javascript:window.history.back()" class="btn btn-setting btn-round"><i class="icon-backward"></i></a>
						</div>
					</div>
							<div class="box-content">
									
									<table class="table table-striped table-bordered bootstrap-datatable ">
												<tr>
													<!-- <td align="right">查询数据： </td>
													<td  class="query"><input type="text" ></td>
													<td>		
													<a class="btn btn-info" href="#">
														<i class="icon-edit icon-white"></i>  
													  查 询       -->                                    
													</a>
														<a class="btn btn-info" href="#" onclick="Authorize()">
														<i class="icon-edit icon-white"></i>  
													 添加                               
													</a>
													
												
									</td>
												</tr>
											
									</table>
								
							</div>
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr >
							  	<th style="text-align: center;"> 选项</th>
							  	<th style="text-align: center;"> 头像</th>
								  <th style="text-align: center;">用户编号</th>
								  <th style="text-align: center;">用户名</th>
								  <th style="text-align: center;">用户邮箱</th>
								    <th style="text-align: center;">姓名</th>
								  <th style="text-align: center;">用户状态</th>
								  <th style="text-align: center;">更新时间</th>
							  </tr>
						  </thead>   
						  <tbody>
						  <c:forEach var ="list"  items="${list}" >
							<tr align="center">
								<td class="center">
									<input type="checkbox" name="uid"  value="${ list.uid}">
								</td>
								<td><img alt="" style="width: 50px;height: 50px" src="<%=path %>${ list.useravatar}"></td>
								<td class="center" align="center">${ list.uid}</td>
								<td class="center" align="center">${ list.uname}</td>
								<td class="center" align="center">${ list.email}</td>
								<td class="center" align="center">${ list.sname}</td>
								<td class="center" align="center">${ list.active}</td>
								<td class="center" align="center">${ list.update_date}</td>
								<td class="center">
								<!--	<a class="btn btn-success" href="#">
										<i class="icon-zoom-in icon-white"></i>  
										详细                                            
									</a>
									 <a class="btn btn-info" href="<%=path %>/SystemUser/editShowView.do?uid=${ list.uid}&nextpage=editSysUser">
										<i class="icon-edit icon-white"></i>  
										编辑                                           
									</a>
									<a class="btn btn-danger" href="<%=path %>/SystemUser/delUserinfo.do?uid=${ list.uid}">
										<i class="icon-trash icon-white"></i> 
										删除
									</a> -->
								</td>
							</tr>
							</c:forEach>
							
						  </tbody>
					  </table> 
					   <script type="text/javascript">
					//分页函数
					  function goFirst(){
						var pageIndex=document.getElementById("pageIndex").value;
					  	if(pageIndex<=1){
					  		return;
					  	}
					  	document.getElementById("pageIndex").value=1;
					  	document.forms[0].submit();
					  }
					  function goLast(){
						var pageIndex=document.getElementById("pageIndex").value;
						var totalPage=document.getElementById("totalPage").value;
						if(pageIndex>=totalPage){
							return;
						}
						document.getElementById("pageIndex").value=totalPage;
					  	document.forms[0].submit();
					  }
					  function goPrev(){
					  	var pageIndex=document.getElementById("pageIndex").value;
					  	if(pageIndex==1){
					  		return;
					  	}
					  	document.getElementById("pageIndex").value=pageIndex-1;
					  	document.forms[0].submit();
					  }
					  function goNext(){
					  	var pageIndex=document.getElementById("pageIndex").value;
					  	var totalPage=document.getElementById("totalPage").value;
					  	if(pageIndex==totalPage){
					  		return;
					  	}
					  	document.getElementById("pageIndex").value=parseInt(pageIndex)+1;
					  	document.forms[0].submit();
					  }
					  function changePage(){
					  	//每次条件查询都回到第1页
					  	document.getElementById("pageIndex").value=1;
					  	document.forms[0].submit();
					  }
					  </script>
					  <a href="javascript:void(0);" onclick="goFirst();">首页</a>
					  <a href="javascript:void(0);" onclick="goPrev();">上一页</a>
					  每页显示
					  <select id="pageSize" name="pageSize" style="width:50px;" onchange="changePage();">
					  	<option value="10" <c:if test="${pageModel.pageSize==10 }">selected</c:if>>10</option>
					  	<option value="20" <c:if test="${pageModel.pageSize==20 }">selected</c:if>>20</option>
					  </select>条
					  共${pageModel.totalCount}条记录
					 
					  页数：<input id="pageIndex" name="pageIndex" type="hidden" value="${pageIndex }"  />
					  <input id="totalCount" name="totalCount" type="hidden" value="${pageModel.totalCount }" />
					  <input id="totalPage" name="totalPage" type="hidden" value="${pageModel.pageCount }" />
					  ${pageIndex }/
					  ${pageModel.pageCount }
					  <a href="javascript:void(0);" onclick="goNext();">下一页</a>
					  <a href="javascript:void(0);" onclick="goLast();">尾页</a> 
					 <!-- 分页end -->             
					<div style="display:none;">
						<input type="text" id="userIds" value="" />
						<input type="text" id="offId" value="${offId }"/>
					</div>
					</div>
				</div><!--/span-->
				</form>
			</div><!--/row-->

</body>
<script type="text/javascript">
function  Authorize(){
	var uid = document.getElementsByName("uid");
	var offId =document.getElementById("offId").value;
	var userIds ="";
	for(var i=0;i<uid.length;i++){
		if(uid[i].checked){
			//window.location="<%=path%>/SysRole/loadAuthorize.do?uid="+uid[i].value;
			//userIds+=uid[i].value+",";
			if(userIds==""){
				userIds=uid[i].value;
			}else{
				userIds+= ","+uid[i].value;
			}
		}
	}
	if(userIds==""){
		alert("选则用户");
		return;
	}
	window.location="<%=path%>/organize/addUserOffice.do?offId="+offId+"&uids="+userIds;
	//parent.location="<%=path%>/organize/addUserOffice.do?offId="+offId+"&uids="+userIds;
	document.getElementById("userIds").value=userIds;
}
</script>
</html>