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
<h1>图书馆系统书籍更新</h1></br></br>
<form  action="/book/updatebook" method="post">
    <label> 书籍编号: <input type="text" name="bookid" value="<#if (book.bookid)??>${(book.bookid)}<#else>0</#if>" /> </label></br></br></br>
    <label> 书籍名称: <input type="text" name="bookname"  value="<#if (book.bookname)??>${(book.bookname)}<#else>0</#if>"/> </label></br></br></br>
    <label> 书籍分类 : <input type="text" name="classification"  value="<#if (book.classification)??>${(book.classification)}<#else>0</#if>"/> </label></br></br></br>
    <label> 借出次数: <input type="text" name="number"  value="<#if (book.number)??>${(book.number)}<#else>0</#if>"/> </label></br></br></br>
    <button type="submit" class="btn btn-info btn-lg" >更新书本信息</button>
</form>
</body>
</html>