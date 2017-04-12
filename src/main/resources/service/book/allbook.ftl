<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>根据adminid相关联数据</title>
    <link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <!--jquery网上引用资源必须稳定，如果不稳定会出现jquery失效，后期把它下载到本地，放在static下面，用本地地址-->
    <script src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
    <style>
        p{
            font-size:30px;
            display:block;
            font-weight:bold;
            color:#FFFFFF;
            background-color:#98bf21;
            width:200px;
            text-align:right;
            padding:4px;
            text-decoration:none;}

        h1{font-weight:bold;
            color:red;
            text-align:center;}

        #customers
        {
            font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
            width:100%;
            border-collapse:collapse;
            text-align:center;}

        #customers th
        {
            font-size:1.1em;
            text-align:left;
            padding-top:5px;
            padding-bottom:4px;
            background-color:#A7C942;
            color:#ffffff;
            text-align:center;}

        #customers td
        {
            font-size:1em;
            border:1px solid #98bf21;
            padding:3px 7px 2px 7px;}

        body
        {
            background-color:#C0C0C0;}

    </style>
</head>
<body>

<script>
    function deleteBook(bookid){
        $.ajax({
            url:'deletebook',
            data:{'bookid':bookid},
            dataType:'JSON',
            type:'post',
            success:function(data){
                var obj = JSON.parse(data);
                if(obj.msg == 'ok'){
                    $("tr[id="+bookid+"]").remove();
                }else{
                    alert('失败');
                }
            }
        });

    }

</script>
<p><b><a href="/book/addbook" target="_blank">点击增加书籍</a></b></p></br></br></br>
<h1>全部书籍信息展示</h1>

<table id="customers" class="table table-bordered">

    <thead>
    <tr>

        <th>bookid</th>
        <th>bookname</th>
        <th>classification</th>
        <th>number</th>
        <th>delete</th>
        <th>update</th>

    </tr>
    </thead>
    <tbody>
    <#list books as book>
            <tr id="<#if (book.bookid)??>${(book.bookid)}<#else>""</#if>">
    <td><#if (book.bookid)??>${(book.bookid)}<#else>""</#if></td>
    <td><#if (book.bookname)??>${(book.bookname)}<#else>""</#if></td>
    <td><#if (book.classification)??>${(book.classification)}<#else>""</#if></td>
    <td><#if (book.number)??>${(book.number)}<#else>""</#if></td>
    <!--<td><a href="deletebook/<#if (book.bookid)??>${(book.bookid)}<#else>0</#if>">删除书本信息</a></td>-->
    <td><a onclick="deleteBook(<#if (book.bookid)??>${(book.bookid)}<#else>0</#if>)">删除书本信息</a></td>
    <td><a href="updatebook/<#if (book.bookid)??>${(book.bookid)}<#else>0</#if>">更新书本信息</a></td>
    </#list>
    </tbody>
</table>
</body>
</html>