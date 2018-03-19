<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>员工列表</title>
<!-- 获取页面路径 -->
<%
pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

				<!--  新增模态框-->
		<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
		      </div>
		      <div class="modal-body">
				<form class="form-horizontal">
				  <div class="form-group">
				    <label for="inputname3" class="col-sm-2 control-label">员工姓名</label>
				    <div class="col-sm-8">
				      <input type="text" name="emp_name" class="form-control" id="emp_add_name" placeholder="请输入姓名">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputemail3" class="col-sm-2 control-label">员工邮箱</label>
				    <div class="col-sm-8">
				      <input type="text" name="email" class="form-control" id="emp_add_email" placeholder="XXXXXX@XXX.com">
				    </div>
				  </div>
				   <div class="form-group">
				    <label for="inputgender3" class="col-sm-2 control-label">员工性别</label>
				    <div class="col-sm-8">
				     	 <label class="radio-inline">
					  		<input type="radio" name="gender" id="gender1" value="男" checked="checked">男
						</label>
						 <label class="radio-inline">
					  		<input type="radio" name="gender" id="gender2" value="女">女
						</label>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputdept" class="col-sm-2 control-label">部门</label>
				    <div class="col-sm-5">
				     	<select class="form-control" id="select_dept" name="d_id">
						</select>
				    </div>
				  </div>
				  </form>
		    </div>
		    <div class="modal-footer">
		    	<button type="button" class="btn btn-primary" id ="emp_save">保存</button>
        		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      		</div>
		  </div>
		</div>
		</div>
		

	<div class="container">
	<!-- 标题 -->
		<div class="row">
		<div class="col-xs-12">
			<h1>XXX管理系统</h1>
		</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
			<button id="add" type="button" class="btn btn-info">新增</button>
			<button type="button" class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-xs-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>#</th>
							<th>emp_name</th>
							<th>gender</th>
							<th>email</th>
							<th>dept_name</th>
							<th>操作</th>
						</tr>
					</thead>
						<tbody>
					
						</tbody>
				</table>
			</div>
		</div>
		
				<!-- 显示分页信息 -->
				<div class="row">
					<div class="col-md-6" id="show_page_area">
					
					</div>
					<!-- 分页信息 -->
					<div class="col-md-6" id="build_page_area">
						
						
					</div>
				</div>
	</div>
	
	<script type="text/javascript">
		$(function() {
			toPage(1);
		});
		
		function toPage(pn){
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					//1解析员工信息
					build_emp(result);
					//2分页信息
					show_page(result);
					//3显示分页信息
					build_page(result);
				}
			});	
		};
		//1解析员工信息
		function build_emp(result){
			//清空表格数据
			$("#emps_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			$.each(emps,function(index,item){
				var empIdTd = $("<td></td>").append(item.emp_id);
				var empName = $("<td></td>").append(item.emp_name);
				var empGender = $("<td></td>").append(item.gender);
				var empEmail = $("<td></td>").append(item.email);
				var empDepartment = $("<td></td>").append(item.department.dept_name);
				
				//编辑按钮
				var editButton = $("<button></button>").addClass("btn btn-primary btn-sm ")
				.append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
				//删除按钮
				var delButton = $("<button></button>").addClass("btn btn-danger btn-sm ")
				.append("<span></span>").addClass("glyphicon glyphicon-remove").append("删除");
				
				
				//apend方法执行完成后返回原来的元素
				$("<tr></tr>")
				.append(empIdTd)
				.append(empName)
				.append(empGender)
				.append(empEmail)
				.append(empDepartment)
				.append(editButton)
				.append(delButton)
				.appendTo("#emps_table tbody");
			});
			
		}
		//2分页信息
		function show_page(result){
			$("#show_page_area").empty();
			var page = result.extend.pageInfo;
			
			$("#show_page_area")
			.append("当前第"+page.pageNum+"页,共"+page.pages+"页,总共"+page.total+"条记录");
		
		}
		//3显示分页信息
		function build_page(result){
			$("#build_page_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.extend.pageInfo.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				
				//首页单击事件
				firstPageLi.click(function(){
					toPage(1);
				});
				
				//上一页单击事件
				prePageLi.click(function(){
					toPage(result.extend.pageInfo.pageNum-1);
				});
				
			}
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var LastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));	
			if(result.extend.pageInfo.hasNextPage == false){
				nextPageLi.addClass("disabled");
				LastPageLi.addClass("disabled");
			}else{
				//下一页单击事件
				nextPageLi.click(function(){
					toPage(result.extend.pageInfo.pageNum+1);
				});
				
				//末页单击事件
				LastPageLi.click(function(){
					toPage(result.extend.pageInfo.pages);
				});
			}
		
	
			ul.append(firstPageLi).append(prePageLi);
			
			$.each(result.extend.pageInfo.navigatepageNums, function(index,item){
				
				var numli = $("<li></li>").append($("<a></a>").append(item));
					if(result.extend.pageInfo.pageNum == item){
						numli.addClass("active");
					}
					ul.append(numli);
			//单击事件
					numli.click(function(){
						toPage(item);
					});
			});
			
			ul.append(nextPageLi).append(LastPageLi);
			var nav = $("<nav></nav>").append(ul);
			nav.appendTo("#build_page_area");
		}
		
		<!--新增按钮单击事件-->
		$("#add").click(function(){
			getDepts();
			$("#empAddModal").modal({
				backdrop:"static"
			});
		});
		//校验表单数据。
		function validate_add_form(){
			//使用正则表达式
		}
		
		//emp_save
		<!--新增保存单击事件 -->
		$("#emp_save").click(function(){
			//校验方法
			
		//	if(!validate_add_form()){
			//	return false;
		//	};
			
			$.ajax({
				url:"${APP_PATH}/emp",
				type:"POST",
				dataType:"json",
				data:$('#empAddModal form').serialize(),
				success:function(result){
					//jQuery serialize()得到表单的字符串
					//alert(result.msg);
					$("#empAddModal").modal('hide');
					to_page(9999);
				}
			});
		});
		
		function getDepts(){
			$.ajax({
				url:"${APP_PATH}/depts",
				type:"GET",
				success:function(result){
	//{"code":200,"msg":"处理成功","extend":{"dept":[{"dept_id":1,"dept_name":"研发部门"},{"dept_id":2,"dept_name":"销售部门"},{"dept_id":3,"dept_name":"宣传部门"},{"dept_id":4,"dept_name":"管理部门"}]}}
				//显示部门信息在下拉列表中
				showDepts(result);
				}
			});
		}
		
		//select_dept
		function showDepts(result){
			$("#select_dept").empty();
			$.each(result.extend.dept,function(index,item){
				var optionEle = $("<option ></option>")
				.append(item.dept_name).attr("value",item.dept_id);
				optionEle.appendTo("#select_dept");
			});
		}
	</script>
</body>
</html>