<%@page contentType="text/html; charset=UTF-8"
	import="java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Home</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8">
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="//cdnjs.loli.net/ajax/libs/mdui/0.4.2/css/mdui.min.css">
		<script src="//cdnjs.loli.net/ajax/libs/mdui/0.4.2/js/mdui.min.js"></script>
		<script src="js/jquery-2.1.4.min.js"></script>
		<script src="js/index_beta.js"></script>
	</head>
	<body onload="initPage();" class="mdui-drawer-body-left mdui-appbar-with-toolbar mdui-theme-primary-pink ">
		<div class="mdui-appbar mdui-appbar-fixed">
		<div class="mdui-toolbar mdui-color-theme">
			<a class="mdui-btn mdui-btn-icon" mdui-drawer="{target: '#left-drawer'}"><i class="mdui-icon material-icons">menu</i></a>
			<a href="javascript:;" class="mdui-typo-headline">期货交易系统</a>
			<a href="javascript:;" class="mdui-typo-title">首页</a>
			<div class="mdui-toolbar-spacer"></div>
			<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">search</i></a>
			<a href="javascript:;" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">refresh</i></a>
			<a onclick="logOut();" class="mdui-btn mdui-btn-icon"><i class="mdui-icon material-icons">exit_to_app</i></a>
		</div>
	</div>

	<div class="mdui-drawer mdui-shadow-5" id="left-drawer">
		<div class="mdui-spinner mdui-spinner-colorful" id="loader" style="display: block;margin-left:auto;margin-right:auto;margin-top: 50%"></div>
		<div class="mdui-list mdui-collapse" mdui-collapse="{accordion:true}" id="drawer"></div>

	</div>
	<div class="mdui-container">

		<button class="mdui-btn" onclick="mdui.mutation();mdui.Collapse('#drawer').closeAll();">mutation</button>
		<%

			//链接数据库，加载jdbc的驱动com.mysql.jdbc.Driver
			try {
				Class.forName("com.mysql.jdbc.Driver");
				out.println("加载了驱动<br>");
			} catch (ClassNotFoundException classnotfoundexception) {
				//如果有异常就抛出
				classnotfoundexception.printStackTrace();
			}
			try {
				out.println("开始链接数据库<br>");
				//链接数据库，IP地址是localhost，端口是3306，账号和密码是ylx，这些都可以更改
				Connection conn = DriverManager
						.getConnection("jdbc:mysql://localhost:3306/ylxdb?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8");
				out.println("链接完毕，开始创建准备数据库操作的statement<br>");
				Statement statement = conn.createStatement();
				out.println("Connect Database Ok！！！");
				//执行查询语句，返回结果集
				out.println("执行select * from video_file<br>");
				ResultSet rs = statement
						.executeQuery("select * from video_file");
				out.println("执行完毕，逐条显示<br>");
				//如果查询有结果，则循环显示查询出来的记录
				out.println("<br>====================开始输出====================");
				while (rs.next()) {
					out.println("<br>");
					out.println(rs.getString("device_id"));
					out.println(rs.getString("device_name"));
				}
				//加个断行
				out.println("<br>");
				out.println("====================显示完毕====================<br>");
				statement.close();
				conn.close();
				out.println("Database Closed！！！");
			} catch (SQLException sqlexception) {
				sqlexception.printStackTrace();
			}
		%>
		<input type="button" value="添加" onclick="add()"/>
		<input type="button" value="修改" onclick="modify()"/>
		<input type="button" value="查询" onclick="query()"/>
	</body>
</html>
<script>
function add(){
	window.location="register.jsp";
}
function modify(){
	window.location="change_list.jsp";
}
function query(){
	window.location="query_list.jsp";
}
</script>