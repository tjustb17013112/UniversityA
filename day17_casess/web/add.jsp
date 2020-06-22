<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- HTML5文档-->
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加用户</title>
    <script src="js/jquery-2.1.0.min.js"></script>
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


<div class="container">
    <center><h3>添加医护人员信息</h3></center>
    <form action="${pageContext.request.contextPath}/addUserServlet" method="post">
        <div class="form-group">
            <label for="name">医生姓名：</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
        </div>

        <div class="form-group">
            <label for="dept">所在医院：</label>
            <input type="text" class="form-control" id="dept"  name="dept" value="${user.dept}" />
        </div>


        <div class="form-group">
            <label for="doctoraddress">专攻科目：</label>
            <input type="text" class="form-control" id="doctoraddress"  name="doctoraddress" value="${user.doctoraddress}"/>
        </div>



        <div class="form-group" style="text-align: center">
            <input class="btn btn-default" type="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
            <input class="btn btn-default" type="button" onclick="javascript:history.back(-1);" value="返回" />
        </div>
    </form>
</div>

<!--引入尾部-->
<div id="footer"></div>
</body>
</html>
