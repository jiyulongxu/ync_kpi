<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="staticCtx" value="${pageContext.request.contextPath}/static"/>
<head>
	<title></title>
<!-- artDialog -->
<script type="text/javascript" src="${staticCtx}/artdialog/artDialog.js?skin=brief"></script>
<script type="text/javascript" src="${staticCtx}/artdialog/plugins/iframeTools.js"></script>

<script type="text/javascript" src="${staticCtx}/jquery/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
	//删除专业性
	function del(id){		
		if(confirm("您确认要删除此专业性吗？") == true) {
			$.ajax({
				type : "post",
				url : "${ctx}/admin/specialty/delete",	
				data : {
					specialtyId : id
				},
				success : function(data) {
					if (data == "no") {
						alert("该部门专业性已删除完毕");
						art.dialog.close();	
						var win = art.dialog.open.origin;  
		    		    win.location.reload();	 
					}else if(data == "one"){
						/* alert("该部门还差一个专业性，请及时添加"); */
						art.dialog.close();	
						var win = art.dialog.open.origin;  
		    		    win.location.reload();	 
					}else{
						alert("删除失败");
						art.dialog.close();	
						var win = art.dialog.open.origin;  
		    		    win.location.reload();	 
					}
				}
			});
		}
	}
	//取消
	function cancle(){
		art.dialog.close();	
		window.location.href="${ctx}/admin/specialty/list";
	}
	
</script>
</head>	
<body>
	删除专业性<br/><br/><br/>
	专业性：<span id="spanId1">${specialty.name }</span><br/><br/>
	&nbsp;&nbsp;部门：<span>${specialty.departmentName }</span><br/><br/>
		MT负责人：<span>${specialty.mt }</span><br/><br/>
		<input type="button" style="margin-left: 50px" onclick="del('${specialty.id }')" value="删除" />	
		<input type="button" style="margin-left: 100px" onclick="cancle()" value="取消" />
</body>

