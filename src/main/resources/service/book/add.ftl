
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
     <link rel="stylesheet" src="css/bootstrap.min.css">
     <!--<link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">-->
     <!--<script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script> -->
     <!--<script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->

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
<h1>图书馆系统书籍添加</h1></br></br>
<form  class="center" action="/book/addbook" method="post">
    <label> 书籍名称: <input type="text" class="form-control"  name="bookname"  /> </label></br></br></br>
    <label> 书籍分类: <input type="text" class="form-control"  name="classification"  /> </label></br></br></br>
    <label> 借出次数: <input type="text" class="form-control" name="number"  /> </label></br></br>
    <button type="submit" class="btn btn-info btn-lg">增加书本</button>
</form>
</body>
</html>