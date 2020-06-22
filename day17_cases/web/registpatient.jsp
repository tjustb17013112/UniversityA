<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>管理员登录</title>
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        //切换验证码
        function refreshCode() {
            //1.获取验证码图像
            var vcode = document.getElementById("vcode");
            //2.设置其src，加时间戳
            vcode.src= "${pageContext.request.contextPath}/checkCodeServlet?time="+ new Date().getTime();
        }
    </script>
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
    <br/><br/>
    <h3 style="text-align: center;">各校学生信息注册</h3>
    <form action="${pageContext.request.contextPath}/registServlet" method="post">
        <div class="form-group">
            <label for="user">姓名：</label><%--这里的label标签的作用于input标签域中的id对应，点击用户名可以看到效果，仅此而已--%>
            <input type="text" name="name" class="form-control" id="user" placeholder="请输入用户名"/>
        </div>

        <div class="form-group">
            <label for="password">密码：</label>
            <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码"/>
        </div>

        <div class="form-group">
            <label>性别：</label>
            <input type="radio" name="sex" value="男" checked="checked"/>男
            <input type="radio" name="sex" value="女"/>女
        </div>

        <div class="form-group">
            <label for="birthday">出生日期</label>
            <input type="date" id="birthday" name="birthday" placeholder="年/月/日">
        </div>

        <div class="form-group">
            <label for="address">籍贯：</label>
            <select name="address" id="address" class="form-control" >
                <option value="陕西">陕西</option>
                <option value="北京">北京</option>
                <option value="上海">上海</option>
            </select>
        </div>


        <hr/>
        <div class="form-group" style="text-align: center;">
            <input class="btn btn-default" type="button" onclick="javascript:history.back(-1);" value="返回" />
            <input class="btn btn-default" type="reset" value="重置" />
            <input class="btn btn-default" type="submit" value="注册">
        </div>
    </form>

    <!-- 出错显示的信息框 -->
    <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" >
            <span>&times;</span></button>
        <strong>${login_msg}</strong>
    </div>
</div>

<!--引入尾部-->
<div id="footer"></div>
</body>
</html>
