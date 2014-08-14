<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<HEAD>
	<TITLE> ZTREE DEMO - beforeEditName / beforeRemove / onRemove / beforeRename / onRename</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	
	 
	<SCRIPT type="text/javascript">
		var setting = {
			view: {
				addHoverDom: addHoverDom,
				removeHoverDom: removeHoverDom,
				selectedMulti: false
			},
			edit: {
				enable: true,
				editNameSelectAll: true
				//,
				//showRemoveBtn: showRemoveBtn,
				//showRenameBtn: showRenameBtn
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeDrag: beforeDrag,
				beforeEditName: beforeEditName,
				beforeRemove: beforeRemove,
				beforeRename: beforeRename,
				onRemove: onRemove,
				onRename: onRename
			}
		};

		var m1='${list11}';
		//alert(m1.length);
		//alert(m1);
		var myobj=eval(m1);  
		var strz='';
		for(var i=0;i<myobj.length;i++){   
		  // alert(myobj[i].name); 
		   if(myobj[i].parent_id==0){
			   if(i==myobj.length-1){
				   strz=strz+'{id:'+myobj[i].id+',pId:'+myobj[i].parent_id+',isParent:'+true+',name:"'+myobj[i].name+'",open:true}';
			   }else{
				   strz=strz+'{id:'+myobj[i].id+',pId:'+myobj[i].parent_id+',isParent:'+true+',name:"'+myobj[i].name+'",open:true},'; 
			   }
			   
		   }else{
			   if(i==myobj.length-1){
				   strz=strz+'{id:'+myobj[i].id+',pId:'+myobj[i].parent_id+',name:"'+myobj[i].name+'"}';
			   }else{
				   strz=strz+'{id:'+myobj[i].id+',pId:'+myobj[i].parent_id+',name:"'+myobj[i].name+'"},';
			   }
			  
		   }
		   
		}   
		var zN1='['+strz+']';
		var zNodes =eval('('+zN1+')');
		//	{ id:1, pId:0, name:"父节点 1", open:true},
			
		//	{ id:12, pId:1, name:"叶子节点 1-2"},
		//	{ id:13, pId:1, name:"叶子节点 1-3"},
		//	{ id:2, pId:0, name:"父节点 2", open:true},
		//	{ id:21, pId:2, name:"叶子节点 2-1"},
		//	{ id:22, pId:2, name:"叶子节点 2-2"},
		//	
		//	{ id:11, pId:1, name:"叶子节点 1-1"},
		//	{ id:23, pId:2, name:"叶子节点 2-3"},
		//	{ id:3, pId:0, name:"父节点 3", open:true},
		//	{ id:31, pId:3, name:"叶子节点 3-1"},
		//	{ id:32, pId:3, name:"叶子节点 3-2"},
		//	{ id:33, pId:3, name:"叶子节点 3-3"}
		
		var log, className = "dark";
		function beforeDrag(treeId, treeNodes) {
			return false;
		}
		function beforeEditName(treeId, treeNode) {
		
			className = (className === "dark" ? "":"dark");
			
			showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.selectNode(treeNode);
			changeContentnn(treeNode.id);
			return false; 
			//confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？");
		}
		function beforeRemove(treeId, treeNode) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.selectNode(treeNode);
			var Nid=treeNode.id;
			showdialogByconfirm("你确认要删除该菜单吗？","<%=path%>/SysMenu/deleteMenus.do",{Nid:Nid})
			return false; 
		}
		function onRemove(e, treeId, treeNode) {
			showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
		}
		function beforeRename(treeId, treeNode, newName) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			if (newName.length == 0) {
				alert("节点名称不能为空.");
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				setTimeout(function(){zTree.editName(treeNode)}, 10);
				return false;
			}
			return true;
		}
		function onRename(e, treeId, treeNode) {
			showLog("[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
		}
		function showRemoveBtn(treeId, treeNode) {
			//return !treeNode.isFirstNode;
			return true;
		}
		function showRenameBtn(treeId, treeNode) {
			return !treeNode.isLastNode;
		}
		function showLog(str) {
			if (!log) log = $("#log");
			log.append("<li class='"+className+"'>"+str+"</li>");
			if(log.children("li").length > 8) {
				log.get(0).removeChild(log.children("li")[0]);
			}
		}
		function getTime() {
			var now= new Date(),
			h=now.getHours(),
			m=now.getMinutes(),
			s=now.getSeconds(),
			ms=now.getMilliseconds();
			return (h+":"+m+":"+s+ " " +ms);
		}

		var newCount = 1;
		function add(e) {
			var isDisplay=document.getElementById("ta1").style.display;
			if(isDisplay=="none"){
				document.getElementById("ta1").style.display="block";
			}
			document.getElementById('parent_id').value=0;
			document.getElementById('Nid').value="";
			document.getElementById('name').value="";
			document.getElementById('href').value="";
			document.getElementById('remarks').value="";
			document.getElementById("name").focus();
		};
		function addHoverDom(treeId, treeNode) {
			
			var myobj=eval(zNodes); 
			var pids;
			for(var i=0;i<myobj.length;i++){ 
				if(treeNode.id==myobj[i].id){
					pids=myobj[i].pId;
				}
			
			}
			
			if(pids==1||pids==0){
				var sObj = $("#" + treeNode.tId + "_span");
				if (treeNode.editNameFlag || $("#addBtn_"+treeNode.id).length>0) return;
				var addStr = "<span class='button add' id='addBtn_" + treeNode.id
					+ "' title='add node' onfocus='this.blur();'></span>";
				sObj.after(addStr);
				var btn = $("#addBtn_"+treeNode.id);
				if (btn) btn.bind("click", function(){
					document.getElementById("ta1").style.display='block';
					document.getElementById("parent_id").value=treeNode.id;
					document.getElementById('Nid').value='';
					document.getElementById('name').value='';
					document.getElementById('href').value='';
					document.getElementById('remarks').value='';
				});
			}
			
			
		};
		function removeHoverDom(treeId, treeNode) {
			$("#addBtn_"+treeNode.id).unbind().remove();
		};
		function selectAll() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			$("#addParent").bind("click", {isParent:true}, add);
			$("#selectAll").bind("click", selectAll);
		});
		
		function  submitFrom(){
			if(!checkForm()){
				return false;
			}
			var x=document.getElementById('Nid').value;
			
			if(x==''){
				var parent_id=$('#parent_id').val();
				var Nid=$('#Nid').val();
				var name=$('#name').val();
				var href=$('#href').val();
				var icon=$('#icon').val();
				var remarks=$('#remarks').val();
				loadPageForPost('<%=path%>/SysMenu/saveMenus.do',{parent_id:parent_id,Nid:Nid,name:name,href:href,icon:icon,remarks:remarks});
			}else{
				var parent_id=$('#parent_id').val();
				var Nid=$('#Nid').val();
				var name=$('#name').val();
				var href=$('#href').val();
				var icon=$('#icon').val();
				var remarks=$('#remarks').val();
				loadPageForPost('<%=path%>/SysMenu/doUpdateMenus.do',{parent_id:parent_id,Nid:Nid,name:name,href:href,icon:icon,remarks:remarks});
			
			}
			
		}
		
		
		function changeContentnn(id) {
			var url = "<%=path%>/SysMenu/updateMenu.do";
			var data = '&Nid='+id+'&id=' + Math.random();
			 $.post(url,data,function(result){
				  var jsondata = result;
					var obj = eval( "(" + jsondata + ")" );
					var values=obj.value;
				if (values != null && values != "") {
					document.getElementById("ta1").style.display='block';
				var arrvalue = values.split("@@");
				document.getElementById('parent_id').value=arrvalue[0];
				document.getElementById('Nid').value=arrvalue[1];
				document.getElementById('name').value=arrvalue[2];
				document.getElementById('href').value=arrvalue[3];
				document.getElementById('icon').value=arrvalue[4];
				document.getElementById('remarks').value=arrvalue[5];
			}
				  });
	
		}
		function showNeedCodeResponsenn(originalRequest) {
			
			
		}
		
		function checkForm(){
			var name=document.getElementById("name").value;
			if(null==name||""==name){
				alert("请输入菜单名称");
				return false;
			}
			return true;
		}
		
		//-->
	</SCRIPT>
	<style type="text/css">
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
	</style>
</HEAD>

<BODY>	
			<div>
				<ul class="breadcrumb">
					<li>
						<a href="#">系统管理</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">菜单管理</a>
					</li>
				</ul>
			</div>
<form id="SystemUserForm"  name="SystemUserForm" action="<%=path%>/SysMenu/saveMenus.do"  method="POST" >
		<table class=" table  table2   table-condensed  box" >
		<thead>
        	<tr>
            	<th colspan="9" ><img src="<%=path %>/images/tablehrard.png"/>&nbsp;<font color="White">菜单管理</font></th>
            </tr>
        </thead>
        <tbody>
			<tr>
			<td width="30%">
			
			<div class="zTreeDemoBackground left" style="border:1px solid #ddd;">
					<ul id="treeDemo" class="ztree"></ul>
				</div>
			</td>
			<td width="70%">
				<table id="ta1" style="display:block" width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#B7BEC6">
			  
						<tr>
							<td>菜单名称：</td>
							<td><input type="text" id="name" name="name"  size="25">
							<input type="hidden" id="parent_id" name="parent_id" value="0"  />
							<input type="hidden" id="Nid" name="Nid"   /></td>
							
						</tr>
						

						<tr>
							<td>菜单链接</td>
							
							<td><input type="text" size="25" id="href"  name="href"></td>
						</tr>
						
						<tr>
							<td>图标</td>
							<td><input type="text" id="icon" name="icon"  size="25"></td>
							
						</tr>
						
						<tr>
							<td>备注信息</td>
							<td><input type="text" id="remarks" name="remarks"  size="25"></td>
							
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
							<input id="addParent" class="btn   btn-primary" type="button" onclick="return false;" value="添加父菜单"/>
							&nbsp; &nbsp;
							<input class="btn   btn-primary" type="button" onclick=" submitFrom()" value="保存菜单"/>
							&nbsp; &nbsp;
							<input class="btn  btn-danger" type="reset" value="重 置"/>
							</td>
						</tr>

					
					</table>
			</td>
			</tr>
			</table>
			
				
					</form>
		
</BODY>
</HTML>
