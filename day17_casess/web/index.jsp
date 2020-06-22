<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>首页</title>


  <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
  <script src="js/jquery-2.1.0.min.js"></script>
  <!-- 3. 导入bootstrap的js文件 -->
  <script src="js/bootstrap.min.js"></script>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="js/include.js"></script>

    <!-- Site CSS -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/font-awesome.min.css" rel="stylesheet">
    <link href="./css/site.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="images/hezuo.jpg"/>
</head>
<body>
<!--引入头部-->
<div id="header"></div>


<div align="center">
  <br><br><br><br><br><br><br><br>
    <a href="${pageContext.request.contextPath}/userListServlet" style="text-decoration:none;font-size:33px">信息列表</a>
      <br>
    <a href="${pageContext.request.contextPath}/registpatient.jsp" style="text-decoration:none;font-size:33px">患者信息注册</a>
</div>

<!--引入尾部-->
<div id="footer"></div>
</body>
</html>