<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<HEAD>
	<TITLE> 组织部门</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<SCRIPT type="text/javascript">
<!--
var m1='${list}';
var myobj=eval(m1); 
var json='';
for(var i=0;i<myobj.length;i++){
	if(i==myobj.length-1){
		json=json+'{ id:'+myobj[i].id+', pId:'+myobj[i].parent_id+', name:"'+myobj[i].name+'",icon:"<%=path%>/images/ztree/1.png",pArea:"'+myobj[i].parentArea+'"}';
	}else{
		json=json+'{ id:'+myobj[i].id+', pId:'+myobj[i].parent_id+', name:"'+myobj[i].name+'",icon:"<%=path%>/images/ztree/1.png",pArea:"'+myobj[i].parentArea+'",open:true},';
	}
	//组织
	var jshOff =myobj[i].sysJshOffice;
	for(var j =0;j<jshOff.length;j++){
		if(i==myobj.length-1){
			json=json+',{ id:"off_'+jshOff[j].id+'", pId:'+myobj[i].id+', name:"'+jshOff[j].name+'"}';
		}else{
			if(jshOff[j].parent_id==0){
				json=json+'{ id:"off_'+jshOff[j].id+'", pId:'+myobj[i].id+', name:"'+jshOff[j].name+'"},';
			}else{
				json=json+'{ id:"off_'+jshOff[j].id+'", pId:"off_'+jshOff[j].parent_id+'", name:"'+jshOff[j].name+'"},';
			}
		}
	}
}

var setting = {
	view: {
		addHoverDom: addHoverDom,
		removeHoverDom: removeHoverDom,
		selectedMulti: false
	},
	edit: {
		enable: true,
		editNameSelectAll: true,
		showRemoveBtn: showRemoveBtn,
		removeTitle: "删除",
		showRenameBtn: showRenameBtn,
		renameTitle: "编辑"
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		beforeDrag: beforeDrag,
		beforeEditName: beforeEditName,
		beforeClick: zTreeBeforeClick,
		beforeRemove: beforeRemove,
		beforeRename: beforeRename,
		onRemove: onRemove,
		onRename: onRename,
		onClick: zTreeOnClick
	}
};

var log, className = "dark";
function beforeDrag(treeId, treeNodes) {
	return false;
}
function beforeEditName(treeId, treeNode) {
	
	//获取当前节点ID 是 组织 !=-1 ，还是区域 -1
	var nodeId = treeNode.id+"";
	var ind = nodeId.indexOf('ff');
	if(ind==-1){
		document.getElementById("pageIfame").src="<%=path %>/organize/getOrganizeOff.do?type=area&Id="+nodeId;
	}else{
		nodeId =nodeId.substring(nodeId.lastIndexOf('_')+1);
		document.getElementById("pageIfame").src="<%=path %>/organize/getOrganizeOff.do?type=off&Id="+nodeId;
	}
	return false;//confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？");
}

function zTreeBeforeClick(treeId, treeNode, clickFlag) {
	//获取当前节点ID 是 组织 !=-1 ，还是区域 -1
	var nodeId = treeNode.id+"";
	var ind = nodeId.indexOf('ff');
	if(ind==-1){
		return false;
	}else{
		return true;
	}
    
};
function zTreeOnClick(event, treeId, treeNode) {
	var nodeId = treeNode.id+"";
	nodeId =nodeId.substring(nodeId.lastIndexOf('_')+1);
	document.getElementById("pageIfame").src="<%=path %>/organize/getUserInfoByOfficeId.do?offId="+nodeId;
    
};


function beforeRemove(treeId, treeNode) {
	//获取当前节点ID 是 组织 !=-1 ，还是区域 -1
	var nodeId = treeNode.id+"";
	var ind = nodeId.indexOf('ff');
	
	if(confirm("确认删除 节点 -- " + treeNode.name + " 吗?")){
		var url="";
		if(ind==-1){
			url="<%=path %>/organize/deleteOrganzie.do?type=area&Id="+nodeId+"&rmid="+Math.random();
			//document.getElementById("pageIfame").src="<%=path %>/organize/deleteOrganzie.do?type=area&Id="+nodeId&;
		}else{
			nodeId =nodeId.substring(nodeId.lastIndexOf('_')+1);
			url="<%=path %>/organize/deleteOrganzie.do?type=off&Id="+nodeId+"&mid="+Math.random();
			//document.getElementById("pageIfame").src="<%=path %>/organize/deleteOrganzie.do?type=off&Id="+nodeId;
		}
		$.ajax({
			url:url,
			type:"get",
			dataType:"html",
			success:function(data,status){
				if(status=="success"){
					if(data=="true"){
						var zTree = $.fn.zTree.getZTreeObj("treeDemo");
						zTree.removeNode(treeNode);
					}
				}
			}
		});
	}
	return false;
}
function onRemove(e, treeId, treeNode) {
	showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
}
function beforeRename(treeId, treeNode, newName, isCancel) {
	className = (className === "dark" ? "":"dark");
	showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
	if (newName.length == 0) {
		alert("节点名称不能为空.");
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		setTimeout(function(){zTree.editName(treeNode)}, 10);
		return false;
	}
	return true;
}
function onRename(e, treeId, treeNode, isCancel) {
	showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
}
function showRemoveBtn(treeId, treeNode) {
	if(treeNode.pArea!='isP'){
		return true;
	}else{
		return false;
	}
}
function showRenameBtn(treeId, treeNode) {
	if(treeNode.pArea!='isP'){
		return true;
	}else{
		return false;
	}
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
function addHoverDom(treeId, treeNode) {
	//获取当前节点ID 是 组织 !=-1 ，还是区域 -1
	var nodeId = treeNode.id+"";
	var ind = nodeId.indexOf('ff');
	
	var sObj = $("#" + treeNode.tId + "_span");
	
	if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0 || $("#addBtnOff_"+treeNode.tId).length>0) return;
	
	var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
		+ "' title='添加区域' onfocus='this.blur();'></span>";
		
	var addStrOff = "<span class='button add' id='addBtnOff_" + treeNode.tId
		+ "' title='添加组织' onfocus='this.blur();'></span>";
		
	if(treeNode.pArea!='isP'){
		if(ind!=-1){
			sObj.after(addStrOff);
		}else{
			sObj.after(addStr).after(addStrOff);
		}
	}
	var btn = $("#addBtn_"+treeNode.tId);
	var btnOff=$("#addBtnOff_"+treeNode.tId);
	if (btn) btn.bind("click", function(){ //添加
		//zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
		
		if(ind==-1){ //当前选的节点是区节点
			//window.parent.document.getElementById("twoFrame").src="<%=path %>/page/organize/addOrganize.jsp?Id="+nodeId;
			//document.getElementById("pageIfame").src="<%=path %>/page/organize/addOrganize.jsp?Id="+nodeId;
			loadTreedata("<%=path %>/page/organize/addOrganize.jsp?Id="+nodeId,"pageIfame");
		}else{ //选中的是组织节点
			 //查询选中节点所属区ID
			var parentNode =treeNode.getParentNode();//选中的父节点对象
			var flag=true;
			while(flag){//
				var parid = parentNode.id+""; //父集合ID
				var parInd =parid.indexOf('ff');
				if(parInd!=-1){//是组织节点
					parentNode =parentNode.getParentNode();
				}else{//不是组织节点退出循环
					flag =false;
				}
			}
			var areaId = parentNode.id;//区id
			//window.parent.document.getElementById("twoFrame").src="<%=path %>/page/organize/addOrganize.jsp?Id="+areaId;
			//document.getElementById("pageIfame").src="<%=path %>/page/organize/addOrganize.jsp?Id="+areaId;
		}
		return false;
	});
	//绑定事件 ,添加组织，
	if (btnOff) btnOff.bind("click", function(){
	
		if(ind==-1){//当前选的节点是区域节点
			
			//document.getElementById("pageIfame").src="<%=path %>/page/organize/addOrganizeOffice.jsp?areaId="+nodeId+"&Id=0";
		loadTreedata("<%=path %>/page/organize/addOrganizeOffice.jsp?areaId="+nodeId+"&Id=0","treebody");
		}else{
			 //查询选中节点所属区ID
			var parentNode =treeNode.getParentNode();//选中的父节点对象
			var flag=true;
			while(flag){//
				var parid = parentNode.id+""; //父集合ID
				var parInd =parid.indexOf('ff');
				if(parInd!=-1){//是组织节点
					parentNode =parentNode.getParentNode();
				}else{//不是组织节点退出循环
					flag =false;
				}
			}
			var areaId = parentNode.id;//区id
			document.getElementById("pageIfame").src="<%=path %>/page/organize/addOrganizeOffice.jsp?areaId="+areaId+"&Id="+nodeId;
		}
		return false;
	});
	
};
function removeHoverDom(treeId, treeNode) {
	$("#addBtn_"+treeNode.tId).unbind().remove();
	$("#addBtnOff_"+treeNode.tId).unbind().remove();
};
function selectAll() {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
}


var zN1='['+json+']'; 
var zNodes =eval(zN1);
//加载数
$(document).ready(function(){
	$.fn.zTree.init($("#treeDemo"), setting, zNodes);
});


//-->
	
</SCRIPT>
<style type="text/css">
 .box{
     height:500px;
 	 width: 300px;
 }
 
 #treebody{
 	position: absolute;
 	margin-left: 400px;
    top:0px;
 }
 
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
	</style>
</HEAD>

<body  style="background-image: url('<%=path %>/images/officebg.png');  ">
		
<div class="box">

<table class=" table  table2   table-condensed  box" >
		<thead>
        	<tr>
            	<th colspan="9" ><img src="<%=path %>/images/tablehrard.png"/>&nbsp;<font color="White">组织结构</font></th>
            </tr>
        </thead>
        <tbody>
        <tr>
       	<td>
        	<div  style="padding-left: 20px" id="treeDemo" class="ztree" ></div>	
       	</td>
        </tr>
        </tbody>
		
</table>
						
						
</div>

					
</div>
		
<div id="treebody"  style="width: 70%">
<!-- 
		<iframe src="<%=path %>/page/organize/addOrganize.jsp" frameborder="0"  id="pageIfame" name="pageIfame" onload="Javascript:SetWinHeight(this)" width="92%" ></iframe>
 -->
</div>
		
		

		
	
		
</BODY>
<script type="text/javascript">
function SetWinHeight(obj)
{

    var win=obj;
    if (document.getElementById)
    {
        if (win && !window.opera)
        {
            if (win.contentDocument && win.contentDocument.body.offsetHeight) 

                win.height = win.contentDocument.body.offsetHeight; 
            else if(win.Document && win.Document.body.scrollHeight)
                win.height = win.Document.body.scrollHeight;
        }
    }
}
</script>
</HTML>
