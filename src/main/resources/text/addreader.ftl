<script>
    function lendBook(){
        var adminid = $("#adminid").val();
        var readerid = $("#readerid").val();
        var bookid = $("#bookid").val();
        alert(adminid);
        alert(readerid);
        debugger;
        $.ajax({
            url:'../service/lendBook',
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
                    $("#tab").append("<tr>"
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
        <#else><input id="info" value = "借阅图书已经达到上限了"></#if>

    <#list lendBooks as book>
        <tr id="<#if (book.bookid)??>${(book.bookid)}<#else>""</#if>">
        <td><#if (book.bookid)??>${(book.bookid)}<#else>""</#if></td>
        <td><#if (book.bookname)??>${(book.bookname)}<#else>""</#if></td>
        <td><#if (book.classification)??>${(book.classification)}<#else>""</#if></td>
        <td><#if (book.number)??>${(book.number)}<#else>""</#if></td>
        <td><a onclick="giveBook/<#if (book.bookid)??>${(book.bookid)}<#else>0</#if>">归还图书</a></td>
        </tr>
    </#list>
    </tbody>
</table>

</body>
