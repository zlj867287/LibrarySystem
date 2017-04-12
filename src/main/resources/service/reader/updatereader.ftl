<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>根据adminid相关联数据</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>

        body{background-color:#b0e0e6;
            color:red;
            text-align:center;
            font-size:20px;
            font-weight:bold;
            font-family:"Times New Roman",Times,serif;}
    </style>
</head>
<body>
<h1>图书馆系统读者信息更新</h1></br></br>
<form  action="/rest/updateReader" method="post">
    <label> 读者编号 : <input type="text" name="readerid" value="<#if (reader.readerid)??>${(reader.readerid)}<#else>0</#if>" /> </label></br></br></br>
    <label> 读者账号: <input type="text" name="username"  value="<#if (reader.username)??>${(reader.username)}<#else>0</#if>"/> </label></br></br></br>
    <label> 读者密码 : <input type="text" name="password"  value="<#if (reader.password)??>${(reader.password)}<#else>0</#if>"/> </label></br></br></br>

    <button type="submit" class="btn btn-info btn-lg" >更新书本信息</button>
</form>
</body>
</html>