<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
    <head>
        <!-- 指定字符集 -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>修改用户</title>
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

    <div class="container" style="width: 400px;">
        <h3 style="text-align: center;">修改医师信息</h3>
        <%--<form action="${pageContext.request.contextPath}/updateUserServlet" method="post">--%>
            <form action="${pageContext.request.contextPath}/updateUserServlet?id=${user.id}" method="post">
            <!-- 隐藏域，提交id -->
            <%--<input type="hidden" name="id" value="${user.id}">--%>
          <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" id="name" name="name" value="${user.name}" readonly="readonly" placeholder="请输入姓名" />
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
                <input class="btn btn-primary" type="submit" value="提交" />
                <input class="btn btn-default" type="reset" value="重置" />
                <input class="btn btn-default" type="button" value="返回"/>
             </div>
        </form>
        </div>

    <!--引入尾部-->
    <div id="footer"></div>
</body>
</html>