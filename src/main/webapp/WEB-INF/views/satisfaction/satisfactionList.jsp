<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html>
<head>
<script src="${ctx }/static/My97/WdatePicker.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2">
				<ul class="nav nav-tabs nav-stacked">
					<li class="nav-header"><h4>项目列表</h4></li>
					<c:forEach items="${projectList}" var="pl">
						<li><a
							href="${ctx }/satisfaction/list?id=${pl.projectId}">${pl.projectName }</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="span10">
			<h4>我的评价</h4>
				<table class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<td>序号</td>
							<td>姓名</td>
							<td>部门</td>
							<td>评分</td>
							<td>评语</td>
							<td>评价者</td>
							<td>操作</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${myEvaluateList}" varStatus="status">
							<tr>
								<td>${status.index+1 }</td>
								<td>${list.beEvaluatedName}</td>
								<td>${list.beEvaluatedDepartmentName}</td>
								<td><fmt:formatNumber value="${list.score}" type="number" maxFractionDigits="0"/></td>
								<td>${list.comment}</td>
								<td>${list.evaluatedName}</td>
								<td>
								<c:if test="${list.havaButton==true }">
									<a href="${ctx}/satisfaction/editPage/${list.id }">评分/修改</a>
								</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr style="height:1px;border:none;border-top:1px solid #555555;" />
				<h4>评价我的</h4>
				<table class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<td>序号</td>
							<td>姓名</td>
							<td>部门</td>
							<td>评分</td>
							<td>评语</td>
							<td>评价者</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list1" items="${myEvaluatedList}" varStatus="status">
							<tr>
								<td>${status.index+1 }</td>
								<td>${list1.beEvaluatedName}</td>
								<td>${list1.evaluatedDepartmentName}</td>
								<td><fmt:formatNumber value="${list1.score}" type="number" maxFractionDigits="0"/></td>
								<td>${list1.comment}</td>
								<td>${list1.evaluatedName}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function formatScore(score) {
		alert()
		return parseInt(score)
	}
	</script>
</body>

</html>