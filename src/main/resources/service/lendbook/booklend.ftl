<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <head>
        <meta charset="utf-8">
        <title>根据adminid相关联数据</title>
        <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
    </head>
<body>
<script>
    function lendBook(){
        var adminid = $("#adminid").val();
        var readerid = $("#readerid").val();
        var bookid = $("#bookid").val();
        alert(adminid);
        alert(readerid);
        debugger;
        $.ajax({
            url:'/service/lendBook',
            <!--url:'../service/lendBook',假如出错，传递的地址错乱，可以在前面加两个点试试-->
            data:{'bookid':bookid,'adminid':adminid,'readerid':readerid},
            dataType:'JSON',
            type:'post',
            success:function(data){
                var obj = JSON.parse(data);
                if(obj.msg == 'ok'){
                    if(obj.up == 'ok'){
                    $("#button").hide();
                    $("#info").show();
                    }else{
                    $("#button").show();
                    $("#info").hide();
                    }
                    $("#tab").append("<tr id=\'" + obj.bookid + "\'>"
                                                +"<td>"+obj.bookid+"</td>"
                                                +"<td>"+obj.bookname+"</td>"
                                                +"<td>"+obj.classification+"</td>"
                                                +"<td>"+obj.number+"</td>"
                                                +"<td> <a onclick=\'giveBook("+obj.bookid+")\'>归还图书</a></td>"
                                                +"</tr>");
                }else{
                    alert('失败');
                }
            }
        });

    }
</script>


<form >
   <input type="hidden", id="adminid", name="adminid"  value = "<#if (adminid)??>${(adminid)}<#else>""</#if>"/>
   <input  id="readerid" type="hidden" value="<#if (reader.readerid)??>${(reader.readerid)}<#else>""</#if>"/>
    <label> 用户账户: <input type="text" name="username"  value = "<#if (reader.username)??>${(reader.username)}<#else>""</#if>"/> </label>
    <label> 用户密码 : <input type="text" name="password" value="<#if (reader.password)??>${(reader.password)}<#else>""</#if>"  /> </label>
   </form>


<table class="table table-bordered" id="tab">
    <thead>
    <tr>
        <th>bookid</th>
        <th>bookname</th>
        <th>classification</th>
        <th>number</th>
        <th>give</th>
    </tr>
    </thead>
    <tbody>
    <#if result != "false">
        <form>
        <input  id="readerid" type="hidden" value="<#if (reader.readerid)??>${(reader.readerid)}<#else>""</#if>"/>
        <label> 图书编号: <input type="text" name="bookid" id="bookid" /> </label>
        </form>
        <button onclick="lendBook()" id="button">借阅图书</button>
         <!--<#else><input id="info" value = "借阅图书已经达到上限了"></#if>跟下面的两种方式可以做对比-->
        <input id="info" value = "借阅图书已经达到上限了">

    <#list lendBooks as book>
        <tr id="<#if (book.bookid)??>${(book.bookid)}<#else>""</#if>">
        <td><#if (book.bookid)??>${(book.bookid)}<#else>""</#if></td>
        <td><#if (book.bookname)??>${(book.bookname)}<#else>""</#if></td>
        <td><#if (book.classification)??>${(book.classification)}<#else>""</#if></td>
        <td><#if (book.number)??>${(book.number)}<#else>""</#if></td>
        <td><a onclick="giveBook/<#if (book.bookid)??>${(book.bookid)}<#else>""</#if>">归还图书</a></td>
        </tr>
    </#list>
    </tbody>
</table>


<table class="table table-bordered" id="tabb">
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

    <!--<tr id="<#if (relation.bookid)??>${(relation.bookid)}<#else>""</#if>">-->
      <!--<tr id="<#if (relation.bookid)??>${(relation.bookid)}<#else>""</#if>">-->
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
<script>
    function giveBook(){
     var bookid = $("#bookid").val();
        $.ajax({
            url:'../return/returnBook',
            data:{'bookid':bookid},
            dataType:'JSON',
            type:'GET',
            success:function(data){
                debugger;
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
</body>
</html>