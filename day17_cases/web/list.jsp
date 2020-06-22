<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户信息管理系统</title>
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Site CSS -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/font-awesome.min.css" rel="stylesheet">
    <link href="./css/site.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="images/hezuo.jpg"/>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
    <script>
        function deleteUser(id) {
            if(confirm("您确定要删除吗？")){
                location.href="${pageContext.request.contextPath}/delUserServlet?id="+id;
            }
        }

        window.onload = function(){
            //给删除选中按钮添加单击事件
            document.getElementById("delSelected").onclick = function(){
                if(confirm("您确定要删除吗？")){
                    var flag = false;
                    //判断是否有选中条目,防止空指针异常
                    var cbs = document.getElementsByName("uid");
                    for(var i = 0;i< cbs.length; i++){
                        if(cbs[i].checked){
                            //当有一个条目被选中时，执行
                            flag = true;
                            break;
                        }else {
                            alert("您没选中，请重新选择要删除的条目！")
                            break;
                        }
                    }
                    if(flag){//有条目被选中
                        //完成表单提交
                        document.getElementById("form").submit();
                    }
                }
            }
            //1.获取第一个cb
            document.getElementById("firstCb").onclick = function () {
                //2.获取下边列表中所有的cb
                var cbs = document.getElementsByName("uid");
                //3.遍历
                for(var i = 0;i< cbs.length; i++){
                    //4.设置这些cbs[i]的checkd 状态 = firstCb.checkd
                    cbs[i].checked = this.checked;
                }
            }
        }
    </script>
    <!--导入布局js，共享header和footer-->
    <script type="text/javascript" src="js/include.js"></script>
</head>
<body>
<!--引入头部-->
<div id="header"></div>



<div class="container">
    <h3 style="text-align: center">医院医师信息管理</h3>
    <a href="login.jsp" style="text-decoration:none;font-size:33px">医生登录</a>
    <a href="index.jsp" style="text-decoration:none;font-size:33px">首页</a>
    <div style="float: right;margin: 5px">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">添加医生信息</a>
        <%--<a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>--%>
    </div>
    <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox" id="firstCb"></th>
                <th>医生编号</th>
                <th>姓名</th>
                <th>所在医院</th>
                <th>专攻科目</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${users}" var="user" varStatus="s">
                <tr>
                    <th><input type="checkbox" name="uid" value="${user.id}"></th>
                    <td>${s.count}</td>
                    <td>${user.name}</td>
                    <td>${user.doctoraddress}</td>
                    <td>${user.dept}</td>
                    <td><a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/findUserServlet?id=${user.id}">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm" href="javascript:deleteUser(${user.id})">删除</a></td>
                </tr>
            </c:forEach>
        </table>
    </form>
</div>

<!--引入尾部-->
<div id="footer"></div>
</body>
</html>
