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
<body  style="background-image: url('<%=path %>/images/officebg.png');  ">
	<form id="SystemUserForm"  name="SystemUserForm" action="<%=path%>/SystemUser/saveOrUpdateUsers.do"  method="post" >
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
						<th colspan="2"><img src="<%=path %>/images/tablehrard.png"/>&nbsp;&nbsp;<font color="White">用户修改</font></th>
					</tr>
				</thead>
				<tbody>
				<tr>
					<td  colspan="2">
					 <fieldset>
						<legend>修改用户信息</legend>
						</fieldset>.
					</td>
				
					
						<tr >
							<td style="text-align: right;"width="30%"><h5>头像设置：</h5></td>
							<td id="userAvatartd">
							<img style="width: 70px;height: 70px"  src="<%=path %>${jsh_user.useravatar}">  <input type='button' class='btn btn-primary' value='删除' onclick='deluserAvatar()'>
							<!-- <input type="file" size="19"
								class="btn btn-close btn-round" name="userAvatar"> <input type="button"  class="btn btn-primary" value="上传头像" onclick="ajaxS()">
								 -->
								</td>
						</tr>
					<tr>
						<td style="text-align: right;"width="30%"><h5>用户名称：</h5></td>
						<td><input type="text" name="username" id="username" size="25" value="${jsh_user.uname }" readonly="readonly"></td>

					</tr>
					<tr>
						<td  style="text-align: right;"><h5>用户邮箱：</h5></td>
						<td><input type="text" size="25" name="email" id="email" value="${jsh_user.email }"></td>

					</tr>

					<tr>
						<td  style="text-align: right;"><h5> 用户状态：</h5></td>
						<td><select name="active"  id="active">	
										<option value="1"  selected="selected" <c:if test="${jsh_user.active ==1}"> selected="selected"</c:if>>活动的</option>
								 		<option value="0" <c:if test="${jsh_user.active ==0}"> selected="selected"</c:if>>禁用的</option>
								 </select>
					  </td>
					</tr>
					<tr>
						<td  style="text-align: right;"><h5>密码设置：</h5></td>
						<td><input type="text" size="25" name="password" id="password"  value="${jsh_user.upassword}"></td>
					</tr>
							<tr>
								<td  style="text-align: right;"><h5>手机号码：</h5></td>
							<td><input type="text" size="25" id="phonenumber" name="phonenumber" value="${jsh_user.phonenumber }"></td>
						</tr>
						

						<tr>
				            
					
							<td  style="text-align: right;"><h5>真实姓名：</h5></td>
							<td><input type="text" size="25" name="sname" id="sname" value="${jsh_user.sname }"></td>
					</tr>
			<tr >
				<tr>
				            
					
							<td  style="text-align: right;"   ><h5>所属区域：</h5></td>
							<td>
							
								<select name="orzid" id="orzid">
                       			<option value="">------选择机构------</option>
                       			<option value="1" <c:if test="${jsh_user.orzid ==1 }"> selected="selected"</c:if>>枣阳市国土局</option>
                       			<option value="2" <c:if test="${jsh_user.orzid ==2 }"> selected="selected"</c:if>>枣阳市规划局</option>
                       			<option value="3" <c:if test="${jsh_user.orzid ==3 }"> selected="selected"</c:if>>枣阳市建设局</option>
                       			<option value="4" <c:if test="${jsh_user.orzid ==4 }"> selected="selected"</c:if>>枣阳市房产局</option>
                       			<option value="5" <c:if test="${jsh_user.orzid ==5 }"> selected="selected"</c:if>>枣阳市执法局</option>
                       </select>
							</td>
					</tr>
		
					<tr>
					<td colspan="2" style=" text-align: center;">
						<button class="btn   btn-primary" type="button" onclick=" submitFrom()">修 改</button>
					&nbsp; &nbsp;
						<button class="btn   btn-primary" type="button" onclick="indexlocalhost()">返回用户列表</button>
					&nbsp; &nbsp;
					<button class="btn  btn-danger" type="reset">重 置</button>
				</td>
				</tr>
						
		</tbody>
					</table>
				</div>
			<!--/span-->


	</form>

</body>

<script type="text/javascript">
function ajaxS() {
	var headImage=document.getElementById("headImage").value;
	if(null==headImage||""==headImage){
		alert("请选择上传图片");
		return;
	}
   var  pojectNmae='<%=path %>';
    var options = {
        url: "<%=path %>/SystemUser/uploadImg.do?id="+Math.random(),
        dataType: "html",
        type: 'POST',
        success: function (data,status) {
            if(status=="success"){
            	if(data!='Image is to large!'){
            	 $('#userAvatartd').empty();
            	  var imageURL=data;
            	 document.getElementById("imageURL").value=imageURL;
            	 var imagepath="<img  src='"+pojectNmae+imageURL+"'>  <input type='button' class='btn btn-primary' value='删除' onclick='deluserAvatar()'>";
                   $('#userAvatartd').prepend(imagepath);
            	}else{
            		alert("文件过大，请重新选择！");
            	}
            	}else{
				alert("导入失败！");
            }
        }
    };
    var form = $('#SystemUserForm');
        form.attr("enctype", "multipart/form-data");
    $('#SystemUserForm').ajaxSubmit(options);
    $('#SystemUserForm').remove("multipart/form-data");
      alert("");

} 

function  deluserAvatar(){
	 $('#userAvatartd').empty();
	 document.getElementById("imageURL").value="";
	 $('#userAvatartd').prepend("<input id='headImage' type='file' size='19' class='btn btn-close btn-round' name='userAvatar'> <input type='button'  class='btn btn-primary' value='上传头像' onclick='ajaxS()'>");
}
function  submitFrom(){
	 if(document.getElementById("username").value==""){
		 alert("用户名不可为空！");
		 return;
	 }
	if(document.getElementById("sname").value==""){
		 alert("真实姓名不可为空！");
		 return;
	}
	if( document.getElementById("password").value==""){
		 alert("密码不可为空！");
		 return;
	}
    var username=$("#username").val();
	var sname= $("#sname").val();
	 var email=$("#email").val();
    var phonenumber= $("#phonenumber").val();
	 var active=$("#active").val();
	 var password=$("#password").val();
	var imageURL= $("#imageURL").val();
	var uid= $("#uid").val();
	var orzid= $("#orzid").val();
	
    loadPageForPost('<%=path%>/SystemUser/saveOrUpdateUsers.do',{username:username,sname:sname,email:email,phonenumber:phonenumber,active:active,password:password,imageURL:imageURL,uid:uid,orzid:orzid});

}

function  indexlocalhost(){
	gotoAddPage("<%=path %>/SystemUser/displayIndex.do");
}

</script>
</html>
