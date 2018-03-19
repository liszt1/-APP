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
			<button type="button" class="btn btn-info">新增</button>
			<button type="button" class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-xs-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>emp_name</th>
						<th>gender</th>
						<th>email</th>
						<th>dept_name</th>
						<th>操作</th>
					</tr>
					
					<c:forEach items="${pageInfo.list }" var="emp">
					
						<tr>
							<th>${emp.emp_id }</th>
							<th>${emp.emp_name }</th>
							<th>${emp.gender }</th>
							<th>${emp.email }</th>
							<th>${emp.department.dept_name }</th>
							<th>
							
									<button class="btn btn-info btn-sm">
									<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
									新增</button>
									
	 		 						<button class="btn btn-primary btn-sm">
	 		 						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
	 		 						编辑</button>
	 		 						
	 		 						<button class="btn btn-danger btn-sm">
	 		 						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
	 		 						删除</button>
							</th>
						</tr>
				</c:forEach>
				
				</table>
				
				
			</div>
		</div>
		
				<!-- 显示分页信息 -->
				<div class="row">
					<div class="col-md-6">
					当前第${pageInfo.pageNum }页,共${pageInfo.pages }页,总共${pageInfo.total }条记录
					</div>
					<!-- 分页信息 -->
					<div class="col-md-6">
						<nav aria-label="Page navigation">
						  <ul class="pagination">
						  <li><a href="${APP_PATH}/emps?pn=${1}">首页</a></li>
						  <c:if test="${pageInfo.hasPreviousPage }">
						    
						    <li>
						      <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum -1}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    </c:if>
						    <!-- 当前页 -->
						    <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
						    	
						    	<c:if test="${page_Num == pageInfo.pageNum}">
						    	<li class="active"><a href="#">${page_Num }</a></li>
						    	</c:if>
						    	<c:if test="${page_Num != pageInfo.pageNum}">
						    	<li><a href="${APP_PATH}/emps?pn=${page_Num }">${page_Num }</a></li>
						    	</c:if>
						    	
						    </c:forEach>
						    <c:if test="${pageInfo.hasNextPage }">
						    <li>
						      <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum +1}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						    </c:if>
						    <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages }">末页</a></li>
						  </ul>
						</nav>
					</div>
				</div>
		
	
	</div>
</body>
</html>