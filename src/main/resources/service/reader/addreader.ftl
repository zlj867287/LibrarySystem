<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
<h1>图书馆系统读者信息添加</h1></br></br>
<form  action="/rest/addreader" method="post">


        <label> 账号 : <input type="text" name="username"  /> </label></br></br></br>
        <label> 密码: <input type="text" name="password"  /> </label></br></br></br>
       <button type="submit" class="btn btn-info btn-lg" >增加读者信息</button>
</form>
</body>
</html>