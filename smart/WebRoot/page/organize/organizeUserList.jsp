<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>组织机构人员管理</title>
<link href="<%=path %>/css/bootstrap-responsive.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap-classic.css" rel="stylesheet">
</head>
<script type="text/javascript">
	function serch(){
	}
</script>
<body>
<div class="row-fluid sortable">		
	
				<div class="box span11" style="width: 100%">
					<div class="box-header well" >
						<h2><i class="icon-user"></i> 区域组织人员管理</h2>
							<a href="<%=path %>/organize/toUserManage.do?offId=${offId }" class="btn btn-setting btn-round"><i class="icon-plus"></i>aaa</a>
					</div>
					
					<form action="<%=path %>/organize/getUserInfoByOfficeId.do" id="myform" name="myform" method="post">
					<div class="box-content" >
						
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
						<input type="hidden" value="${offId }" id="offId" name="offId"/>
						  <thead>
							  <tr>
							  	 <th style="text-align: center;">用户编号</th>
								  <th style="text-align: center;">用户名</th>
								  <th style="text-align: center;">真实姓名</th>
								  <th style="text-align: center;">QQ</th>
								  <th style="text-align: center;">手机号码</th>
								  <th style="text-align: center;">操作</th>
							  </tr>
						  </thead>   
						  <tbody>
						 <c:forEach var ="list"  items="${list}" >
							<tr>
								<td style="" align="center">${ list.uid}</td>
								<td class="center" align="center">${ list.uname}</td>
								<td class="center" align="center">${ list.sname}</td>
								<td class="center" align="center">${ list.qq}</td>
								<td class="center" align="center">${ list.phonenumber}</td>
								<td>
									<a class="btn btn-danger" href="<%=path %>/organize/deleteUserOrganize.do?offId=${offId }&uid=${list.uid}">
										<i class="icon-trash icon-white"></i> 
										删除
									</a> 
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
					</div>
				</form>
				</div><!--/span-->
			
			</div><!--/row-->
</body>
</html>