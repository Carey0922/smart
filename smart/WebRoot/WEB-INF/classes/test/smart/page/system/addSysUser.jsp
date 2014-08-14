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
<title></title>
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
	<form id="SystemUserForm" name="SystemUserForm"
		action="<%=path%>/SystemUser/saveOrUpdateUsers.do" method="post">
		<input type="hidden" name="imageURL" id="imageURL"> 
		<input type="hidden" name="uid" id="uid">
<div>
				<ul class="breadcrumb">
					<li>
						  系统管理<span class="divider">/</span>
					</li>
					<li>
						 用户管理<span class="divider">/</span>
					</li>
						<li>
						 <font style="color: #FFFFFF">用户添加</font> 
					</li>
				</ul>
			</div>

		<div>
			<table class="table  table2 table-striped table-condensed ">
				<thead>
					<tr>
						<th colspan="2"><img src="<%=path %>/images/tablehrard.png"/>&nbsp;&nbsp;<font color="White">用户添加</font></th>
					</tr>
				</thead>
				<tbody>
				<tr>
					<td  colspan="2">
					 <fieldset>
						<legend>创建一个新的用户</legend>
						</fieldset>
					</td>
				
				</tr>	
						<tr >
							
							<td  style="text-align: right;"><h5>请选择头像:</h5></td>
							<td  id="userAvatartd">
							<input id="headImage" type="file" 
								class="btn btn-close btn-round" name="userAvatar" style="display:none">
								<a href="#" onclick="fn_browse()">
								<img  name="btn" src="<%=path %>/SystemImage/userAvatar/default_pic.png" border="0" />
									提示图片文件长宽不能大于150像素
								</a>  
<br />						
								<input type="button"  class="btn btn-primary" value="上传头像" onclick="ajaxS()"> </td>
						</tr>
					<tr>
						<td width="30%" style="text-align:right;" ><h5>用户名称：</h5></td>
						<td><input type="text" id="username" name="username"
							size="25" onchange="checkUser()"></td>

					</tr>
					<tr>
						<td  style="text-align: right;"><h5>用户邮箱：</h5></td>
						<td><input type="text" size="25" id="email" name="email" ></td>

					</tr>

					<tr>
						<td  style="text-align: right;"><h5> 用户状态：</h5></td>
						<td><select name="active"id="active">
								<option value="1">活动的</option>
								<option value="0">禁用的</option>
						     </select>
					  </td>
					</tr>
					<tr>
						<td  style="text-align: right;"  ><h5>密码设置：</h5></td>
						<td><input type="password"  id="password" name="password"  size="25"></td>
					</tr>
							<tr>
								<td  style="text-align: right;"  ><h5>手机号码：</h5></td>
							<td><input type="text" size="25"id="phonenumber" name="phonenumber"></td>
						</tr>
						

						<tr>
				            
					
							<td  style="text-align: right;"   ><h5>真实姓名：</h5></td>
							<td><input type="text" size="25" id="sname" name="sname"></td>
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
			<tr >
			
	
					<tr>
					
					<td colspan="2" style=" text-align: center;">
					<div >
					<button class="btn   btn-primary" type="button" onclick=" submitFrom()">保存用户</button>
					&nbsp; &nbsp;
					
					<button class="btn   btn-primary" type="button" onclick="indexlocalhost()">返回用户列表</button>
					&nbsp; &nbsp;
					<button class="btn  btn-danger" type="reset">重 置</button>
					</div>
				</td>
				
				</tr>
						
		</tbody>
					</table>
				</div>
				
			<!--/span-->


		<!--/row-->
	</form>

</body>

<script type="text/javascript">
function fn_browse()
{
    document.all.headImage.click();
}
function fn_submit()
{
    document.forms[0].headImage.disabled = true;        
}
function isChinese(temp)  
{  
 var re = /[^\u4e00-\u9fa5]/;  
 if(re.test(temp)) return false;  
 return true;  
}  

 function  checkUser(){
	 var  userName=document.getElementById("username").value;
	if(isChinese(userName)){
		   showdialog("用户名只能使用英文！");
		   document.getElementById("username").value="";
		   return;
	}  
	
	 if(userName!=""){
	   $.ajax({type: "post",  
		             url: "<%=path%>/SystemUser/UsersValidation.do",  
		               dataType: "html",  
		               data: "username="+userName,  
		               success: function(result){  
		                           var res = String($.trim(result));  
		                           if(res=="User already exists"){  
		                           	   showdialog("用户名已经存在，请重新录入!");
		                           	document.getElementById("username").value="";
		                           }
		                           }  
		               });  
	 }
 }

function ajaxS() {
	var headImage=document.getElementById("headImage").value;
	if(null==headImage||""==headImage){
	 showdialog('请选择上传图片');
		return;
	}
		var  pojectNmae='<%=path %>';
    var options = {
        url: "<%=path %>/SystemUser/uploadImg.do?id="+Math.random(),
       
        dataType: "html",
        type: 'POST',
        success: function (data,status) {
        	
            if(status=="success"){
            	  var imageURL=data;
            	 if(imageURL=='Image is to large!'){
            	 showdialog('文件过大！请重新选择');
            	 }else{
            		 $('#userAvatartd').empty();
            		 showdialog(imageURL);
            	 document.getElementById("imageURL").value=imageURL;
            	 var imagepath="<img  src='"+pojectNmae+imageURL+"'>  <input type='button' class='btn btn-primary' value='删除' onclick='deluserAvatar()'>";
                   $('#userAvatartd').prepend(imagepath);
            	 }
            }else{
				 showdialog('导入失败！');
            }
        }
    };
    var form = $('#SystemUserForm');
        form.attr("enctype", "multipart/form-data");
    $('#SystemUserForm').ajaxSubmit(options);
} 

function  deluserAvatar(){
	 $('#userAvatartd').empty();
	 $('#userAvatartd').prepend("<input id='headImage' type='file' class='btn btn-close btn-round' name='userAvatar' style='display:none'><a href='#' onclick='fn_browse()'><img  name='btn' src='<%=path %>/SystemImage/userAvatar/default_pic.png' border='0' /></a>  <br /><input type='button'  class='btn btn-primary' value='上传头像' onclick='ajaxS()'> </td>");
}
function  submitFrom(){
	 if(document.getElementById("username").value==""){
		 showdialog("用户名不可为空！");
		 return;
	 }
	if(document.getElementById("sname").value==""){
		 showdialog("真实姓名不可为空！");
		 return;
	}
	if( document.getElementById("password").value==""){
		 showdialog("密码不可为空！");
		 return;
	}
		if( document.getElementById("orzid").value==""){
		 showdialog("请选择部门！");
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
