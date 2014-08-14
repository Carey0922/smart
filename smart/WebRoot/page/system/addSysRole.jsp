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

<style type="text/css">
input,textarea {
	width: 500px;
}

h4 {
	padding-top: 8px;
}

input[type="file"] {
	width: 400px;
}
</style>
</head>
<body>
	<form id="SystemUserForm" name="SystemUserForm"
		action="<%=path%>/SysRole/RoleSave.do" method="post">
		<input type="hidden" id="roleid" name="id" size="25" value="">
<div>
				<ul class="breadcrumb">
					<li>
						  系统管理<span class="divider">/</span>
					</li>
					<li>
						角色添加
					</li>
				</ul>
			</div>


		<div>
			<table class="table  table2 table-striped  table-hover table-condensed  ">
				<thead>
					<tr>
						<th colspan="2"><img src="<%=path %>/images/tablehrard.png" />&nbsp;<font color="White">角色添加</font></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">
							<h3>提示：添加角色信息的面板</h3>
						</td>
					</tr>
					<tr>
						<td align="center" width="30%"> 角色名称： </td>
						<td><input type="text" name="Rolename" id="Rolename"
							size="25" onchange="checkRole()"></td>

					</tr>
					<tr>
						<td align="center" width="30%"> 角色编码： </td>
						<td><input type="text" size="20" readonly="readonly"
							name="Rolecode" id="Rolecode"  value="${ uuid}"></td>

					</tr>
					<tr>
						<td align="center" width="30%"> 角色类型： </td>
						<td><select name="roletype" id="roletype">
								<option value="ROLE_USER">业务角色</option>
								<option value="ROLE_ADMIN">超级管理员</option>
								<option value="ROLE_USER">普通角色</option>
						</select></td>

					</tr>
					<tr>
						<td align="center" width="30%">角色英文名：</td>
						<td><input type="text" size="20" name="ERolename"
							id="ERolename"></td>

					</tr>

					<tr>
						<td align="center" width="30%">备注信息：</td>
						<td colspan="3"><textarea id="Remarks" name="Remarks"
								rows="5" style="width: 60%"></textarea></td>

					</tr>

					<tr>
					<td></td>
						<td colspan="2" align="center">
							<button class="btn   btn-primary" type="button"
								onclick="submitFrom()">创建角色</button> &nbsp; &nbsp;
								&nbsp; &nbsp;
						<button class="btn   btn-primary" type="button" onclick="indexlocalhost()"> 返 回 </button>
								&nbsp; &nbsp;
							<button class="btn  btn-danger" type="reset">重 置</button>
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>

</body>

<script type="text/javascript">
function  checkRole(){
	 var  Rolename=document.getElementById("Rolename").value;
	 if(Rolename!=""){
	   $.ajax({type: "post",  
		             url: "<%=path%>/SysRole/isSysRoleName.do",  
		               dataType: "html",  
		               data: "Rolename="+Rolename,  
		               success: function(result){  
		                           var res = String($.trim(result));  
		                           if(res=="SysRoleName already exists"){  
		                           	   alert("角色已经存在，请重新录入!");
		                           	document.getElementById("Rolename").value="";
		                           }
		                           }  
		               });  
	 }
}

function ajaxS() {
   var  pojectNmae='<%=path%>';
    var options = {
        url: "<%=path%>/SystemUser/uploadImg.do?id="+Math.random(),
        dataType: "html",
        type: 'POST',
        success: function (data,status) {
            if(status=="success"){
            	 $('#userAvatartd').empty();
            	  var datas=data.split("#");
            	  var imageURL=datas[0];
            	 var imageName= datas[1];
            	 document.getElementById("imageName").value=imageName;
            	 document.getElementById("imageURL").value=imageURL;
            	 alert( document.getElementById("imageName").value);
            	 var imagepath="<img  src='"+pojectNmae+imageURL+"'>  <input type='button' class='btn btn-primary' value='删除' onclick='deluserAvatar()'>";
                   $('#userAvatartd').prepend(imagepath);
            }else{
				alert("导入失败！");
            }
        }
    };
    var form = $('#SystemUserForm');
        form.attr("enctype", "multipart/form-data");
    $('#SystemUserForm').ajaxSubmit(options);
    $('#SystemUserForm').remove("multipart/form-data");

} 

function  deluserAvatar(){
	 $('#userAvatartd').empty();
	 $('#userAvatartd').prepend("<input type='file' size='19' class='btn btn-close btn-round' name='userAvatar'> <input type='button'  class='btn btn-primary' value='上传头像' onclick='ajaxS()'>");
}
function  submitFrom(){
	if(document.getElementById("Rolename").value==""){
		showdialog("角色名称不能为空！");
		return;
	}
	if(document.getElementById("ERolename").value==""){
		showdialog("角色英文名不能为空！");
		return;
	}
	var parent=/^[A-Za-z]+$/;
  if(!parent.test(document.getElementById("ERolename").value))
  {
         showdialog("请输入角色英文名！");
		 return;
  }
	var  Rolename=$("#Rolename").val();
	var  Rolecode=$("#Rolecode").val();
	var  ERolename=$("#ERolename").val();
	var  roletype=$("#roletype").val();
	var  Remarks=$("#Remarks").val();
	var  id=$("#roleid").val();
	loadPageForPost('<%=path%>/SysRole/RoleSave.do',{Rolename:Rolename,Rolecode:Rolecode,ERolename:ERolename,roletype:roletype,Remarks:Remarks,id:id});
	}
	
function  indexlocalhost(){
	gotoAddPage("<%=path%>/SysRole/displayIndex.do");
}

 
</script>
</html>
