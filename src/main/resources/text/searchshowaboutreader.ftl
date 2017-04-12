<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>根据adminid相关联数据</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
        p{background-color:#b0e0e6;
            color:red;
            text-align:center;
            font-size:20px;
            font-weight:bold;
            font-family:"Times New Roman",Times,serif;}
    </style>
</head>
<body>

<table class="table table-bordered">
    <p><b>关于读者的所有信息</b></p>
    <thead>
    <tr>

        <th>adminid</th>
        <th>bookid</th>
        <th>readerid</th>
        <th>lendtime</th>
        <th>returntime</th>
        <th>fine</th>
    </tr>
    </thead>
    <tbody>
    <#list relations as relation>
        <tr>
            <td><#if (relation.adminid)??>${(relation.adminid)}<#else>""</#if></td>
            <td><#if (relation.bookid)??>${(relation.bookid)}<#else>""</#if></td>
            <td><#if (relation.readerid)??>${(relation.readerid)}<#else>""</#if></td>
            <td><#if (relation.lendtime)??>${(relation.lendtime)}<#else>""</#if></td>
            <td><#if (relation.returntime)??>${(relation.returntime)}<#else>""</#if></td>
            <td><#if (relation.fine)??>${(relation.fine)}<#else>""</#if></td>
        </tr>
    </#list>
    </tbody>
</table>

    <form   method="post">

        <label> 用户账户: <input type="text" name="username"  value = "<#if (reader.username)??>${(reader.username)}<#else>""</#if>"/> </label>
        <label> 用户密码 : <input type="text" name="password" value="<#if (reader.password)??>${(reader.password)}<#else>""</#if>"  /> </label>
        <!--  <#list readers as reader>
       <label> 账号 : <input type="text" name="username" value=${reader.username} /> </label>
        <label> 密码: <input type="text" name="password" value=${reader.password} /> </label>
    </#list>-->

</form>
</body>
</html>