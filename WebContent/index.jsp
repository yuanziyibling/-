<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" href="jquery-easyui-1.4.3/themes/default/easyui.css">
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		$("#bookcategory").combobox({
			url:'selectBookCategory',
			method:'post',
			valueField:'cid',    
		    textField:'cname'
		})
		searchBook();
	});
	
	function searchBook(){
		
		var category=$("#bookcategory").combobox('getValue');
		if(category=='--请选择--'){
			category='';
		}
		
		
		$("#dg").datagrid({
			url:'selectBook',
			method:"post",
			pagination:true,
			queryParams:{
				page:1,
				pageSize:10,
				bname:$("#bname").val(),
				cid:category,
				startPrice:$("#startprice").textbox('getValue'),
				endPrice:$("#endprice").textbox('getValue')
			},
			toolbar:'#dgtool'
		})
		
	}
	
	function formattercname(value,row,index){
		return row.bookCategory.cname;
	}
	
	function formattercaozuo(value,row,index){
		return "<a href='javascript:void(0)' class='easyui-linkbutton' onclick='update("+index+")'>编辑</a>  <a href='javascript:void(0)' class='easyui-linkbutton' onclick='del("+index+")'>删除</a>"
	}
	
	function insert(){
		$("#bookcategory1").combobox({
			url:'selectBookCategory',
			method:'post',
			valueField:'cid',    
		    textField:'cname'
		})
		
		$("#insertBook").dialog("open");
	}
	
	function insertsave(){
		var bname=$("#bname1").textbox('getValue');
		var price=$("#price1").textbox('getValue');
		var zuozhe=$("#zuozhe1").textbox('getValue');
		var jianjie=$("#jianjie1").textbox('getValue');
		var liyou=$("#liyou1").textbox('getValue');
		var bookcategory=$("#bookcategory1").combobox('getValue');
		$.post("insertBook",{
			bname:bname,
			price:price,
			zuozhe:zuozhe,
			jianjie:jianjie,
			liyou:liyou,
			cid:bookcategory
		},function(res){
			if(res>0){
				$("#insertBook").dialog("close");
				$("#dg").datagrid("reload");
				$.messager.alert("提示","添加成功");
			}else{
				$.messager.alert("提示","添加失败");
			}
		},"json")
	}
	
	function update(index) {
		var data=$("#dg").datagrid('getData');
		var row=data.rows[index];
		$("#bookcategory2").combobox({
			url:'selectBookCategory',
			method:'post',
			valueField:'cid',    
		    textField:'cname'
		})
		$("#bookcategory2").combobox('setValue',row.bookCategory.cid);
		$("#updateBookForm").form("load",row);
		$("#updateBook").dialog("open");
	}
	
	function updatesave() {
		var bid=$("#bid2").textbox('getValue');
		var bname=$("#bname2").textbox('getValue');
		var price=$("#price2").textbox('getValue');
		var zuozhe=$("#zuozhe2").textbox('getValue');
		var jianjie=$("#jianjie2").textbox('getValue');
		var liyou=$("#liyou2").textbox('getValue');
		var bookcategory=$("#bookcategory2").combobox('getValue');
		$.post("updateBook",{
			bid:bid,
			bname:bname,
			price:price,
			zuozhe:zuozhe,
			jianjie:jianjie,
			liyou:liyou,
			cid:bookcategory
		},function(res){
			if(res>0){
				$("#updateBook").dialog("close");
				$("#dg").datagrid("reload");
				$.messager.alert("提示","修改成功");
			}else{
				$.messager.alert("提示","修改失败");
			}
		},"json")
	}
	
	function del(index){
		var data=$("#dg").datagrid("getData");
		var row=data.rows[index];
		$.messager.confirm("确认删除","确认删除么？",function(r){
			if(r){
				$.post("deleteBook",{
					bid:row.bid
				},function(res){
					if(res>0){
						$("#dg").datagrid("reload");
						$.messager.alert("提示","删除成功");
					}else{
						$.messager.alert("提示","删除失败");
					}
				},"json")
			}
		})
	}
	
	
	
</script>
</head>
<body>
	<table id="dg" class="easyui-datagrid" style="width:800px;height:500px"  data-options="fitColumns:true,singleSelect:true">   
	    <thead>   
	        <tr>   
	            <th data-options="field:'bid',width:100">书籍编号</th>   
	            <th data-options="field:'bname',width:100">书籍名称</th>   
	            <th data-options="field:'price',width:100">价格</th> 
	            <th data-options="field:'zuozhe',width:100">作者</th>
	            <th data-options="field:'jianjie',width:100">简介</th>
	            <th data-options="field:'liyou',width:100">推荐理由</th>
	            <th data-options="field:'cname',width:100,formatter:formattercname">书籍分类</th>
	            <th data-options="field:'caozuo',width:100,formatter:formattercaozuo">设置</th>  
	        </tr>   
	    </thead>   
	</table>
	<div id="dgtool">
		请输入书名称：<input class="easyui-textbox" id="bname" name="bname" style="width:100px;">
		价格：<input class="easyui-textbox" id="startprice" name="startprice" style="width:100px;">~
		<input class="easyui-textbox" id="endprice" name="endprice" style="width:100px;">
		请选择书籍分类：<select id="bookcategory" class="easyui-combobox" style="width:100px;">   
					  <option>--请选择--</option> 
				</select> 
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="searchBook()">搜索</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="insert()">添加</a>
		<a href="javascript:void(0)" id="btnExport" class="easyui-linkbutton" onclick="export()">导出</a>
	</div>
	
	<!-- 修改窗体 -->
	<div id="updateBook" class="easyui-dialog" title="编辑书籍" style="width:400px;height:300px;" 
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
		buttons:[{
				text:'保存',
				handler:function(){updatesave()}
			},{
				text:'关闭',
				handler:function(){updateclose()}
			}]">

	    <form id="updateBookForm" class="easyui-form">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>书籍编号：</td>
	    			<td><input class="easyui-textbox" id="bid2" name="bid" disabled="disabled"></td>
	    		</tr>
	    		<tr>
	    			<td>书籍名称：</td>
	    			<td><input class="easyui-textbox" id="bname2" name="bname" ></td>
	    		</tr>
	    		<tr>
	    			<td>价格：</td>
	    			<td><input class="easyui-textbox" id="price2" name="price" ></td>
	    		</tr>
	    		<tr>
	    			<td>作者：</td>
	    			<td><input class="easyui-textbox" id="zuozhe2" name="zuozhe"></td>
	    		</tr>
	    		<tr>
	    			<td>简介：</td>
	    			<td><input class="easyui-textbox" id="jianjie2" name="jianjie"></td>
	    		</tr>
	    		<tr>
	    			<td>推荐理由：</td>
	    			<td><input class="easyui-textbox" id="liyou2" name="liyou"></td>
	    		</tr>
	    		<tr>
	    			<td>书籍分类</td>
	    			<td>
	    				<select id="bookcategory2" class="easyui-combobox" style="width:100px;">   
						</select> 
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>
	
	
	<!-- 添加窗体 -->
	<div id="insertBook" class="easyui-dialog" title="添加书籍" style="width:400px;height:300px;" 
		data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true,
		buttons:[{
				text:'保存',
				handler:function(){insertsave()}
			},{
				text:'关闭',
				handler:function(){insertclose()}
			}]">

	    <form id="insertBookForm" class="easyui-form">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>书籍名称：</td>
	    			<td><input class="easyui-textbox" id="bname1" name="bname" ></td>
	    		</tr>
	    		<tr>
	    			<td>价格：</td>
	    			<td><input class="easyui-textbox" id="price1" name="price" ></td>
	    		</tr>
	    		<tr>
	    			<td>作者：</td>
	    			<td><input class="easyui-textbox" id="zuozhe1" name="zuozhe"></td>
	    		</tr>
	    		<tr>
	    			<td>简介：</td>
	    			<td><input class="easyui-textbox" id="jianjie1" name="jianjie"></td>
	    		</tr>
	    		<tr>
	    			<td>推荐理由：</td>
	    			<td><input class="easyui-textbox" id="liyou1" name="liyou"></td>
	    		</tr>
	    		<tr>
	    			<td>书籍分类</td>
	    			<td>
	    				<select id="bookcategory1" class="easyui-combobox" style="width:100px;">   
							  <option>--请选择--</option> 
						</select> 
	    			</td>
	    		</tr>
	    	</table>
	    </form>
	</div>
	
</body>
</html>