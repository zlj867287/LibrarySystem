<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>根据adminid相关联数据</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        p{
            font-size:20px;
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
<p><b><a href="/rest/addreader" target="_blank">点击增加读者信息</a></b></p></br></br></br>

<table id="customers" class="table table-bordered">
    <h1>读者信息全部展示</h1>
    <thead>
    <tr>

        <th>readerid</th>
        <th>username</th>
        <th>password</th>
        <th>delete</th>
        <th>update</th>

    </tr>
    </thead>
    <tbody>

    <#list readers as reader>
    <tr>
        <td><#if (reader.readerid)??>${(reader.readerid)}<#else>0</#if></td>
        <td><#if (reader.username)??>${(reader.username)}<#else>""</#if></td>
        <td><#if (reader.password)??>${(reader.password)}<#else>""</#if></td>
        <td><a href="deleteReader/<#if (reader.readerid)??>${(reader.readerid)}<#else>0</#if>">删除用户信息</a></td>
        <td><a href="updateReader/<#if (reader.readerid)??>${(reader.readerid)}<#else>0</#if>">更新用户信息</a></td>
    </tr>
    </#list>
    </tbody>
</table>

</body>
</html>