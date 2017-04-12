<html xmlns="http://www.w3.org/1999/html" xmlns:text-align="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>图书馆系统</title>
    <link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body{
            margin-left:auto;
            margin-right:auto;
            margin-TOP:50PX;

            background-color:#e0ffff;
            font-size:15px;

        }
        p {font-size:25px;}
        p1 {font-size:13px;}
        p2{font-size:13px;
            text-align:center; }
        h1{font-size:15px;
           text-align:right;
        }
        h4{font-size:15px;
            text-align:center;
        }

        a {font-size:15px;
           }

       th{  font-size:15px;
           margin-left:auto;
           margin-right:auto;}
        div.address
        {
            border:2px solid #a1a1a1;
            padding:10px 40px;
            background:#dddddd;
            width:300px;
            border-radius:25px;

        }
        a.one{ font-size:15px;
          }
        a.two{ font-size:15px;
        }

        p.lead {font-size:20px;
               text-align:center;
               font-weight: bold;}

    </style>
</head>
<body>
<p class="text-center" ><b>欢迎来到徐州工程学院图书馆系统</b></p><br>
<nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
    <a class="navbar-brand" href="#">快速入口</a>
</div>
    <div>
        <ul class="nav navbar-nav">
            <li ><a href="service/readservice"">借书系统</a></li>
            <li><a href="http://baidu.com">还书系统</a></li>
            <li><a href="/book/allbook"> 图书信息管理 </a>   </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    管理员信息管理
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">查询管理员信息</a></li>
                    <li><a href="#">修改管理员信息</a></li>
                    <li><a href="#">增加管理员信息</a></li>
                    <li><a href="#">删除管理员信息</a></li>
                </ul>
            </li>
            <li><a href="/rest/getreaderall" >读者信息管理</a></li>
            <li><a href="http://baidu.com">关于我们</a></li>
        </ul>
    </div>
    <div>

        <form class="navbar-form navbar-right" role="search" action="/service/readservice" method="post">
            <div class="form-group">
            <!--少了个name=“readerid”，必须要与后台的参数getReaderInfo(int readerid)一致，传递的方式必须一致，之前的login登录必须是get方法-->
                <input type="text" class="form-control" placeholder="Search" name="readerid">
                <input type="hidden" value = "<#if (adminid)??>${(adminid)}<#else>""</#if>" name="adminid">
            </div>
            <button type="submit" class="btn btn-default">办理借还书业务</button>
        </form>
    </div>
</nav>
<br class="container">

    <div class="row">
            <p class="lead">3月值班表</p>
    </div>

    <div class="row">
            <table class="table table-bordered table-condensed">
                <thead>
                <tr>
                    <th>编号 ID</th>
                    <th>姓名 DESC</th>
                    <th>联系方式 STATUS</th>
                    <th>值班时间 ACTION</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>RPi.PCF8574.IO0</td>
                    <td>ON</td>
                    <td>ACTION</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>RPi.PCF8574.IO1</td>
                    <td>OFF</td>
                    <td>ACTION</td>
                </tr>
                </tbody>
            </table>
        </div>


    <div class="row">
            <h1 class="text-right">如果有问题请电话联系</h1>
    </div>


    <div class="row">
            <div data-spy="scroll" data-target="#navbar-example" data-offset="0"
                 style="height:150px; position: relative; font-size:15px;">
                <h4 id="徐州工程学院" >徐州工程学院简介</h4>
                <p1>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple
                    TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。
                </p1>

        </div>
    </div></br></br>
    <div class="row" >
        <div class="span12">
            <div class="col-md-4">
                <a class="one" href="http://wwww.baidu.com" target="_blank">徐州工程学院学生部：点击进入</a><br>
            </div>
            <div class="col-md-4">
                <a class="two" href="http://wwww.baidu.com">徐州工程学院文化部：点击进入</a>
            </div>

            <div class="col-md-4">
                <div class=address >
                    <strong>地址：</strong><br>
                    徐州新区************<br>
                    <abbr title="Phone">咨询电话:</abbr> (123) 456-7890
                    </address>
                </div>
            </div>
        </div>
    </div>
</div>
<footer>
    <p2>Posted by: zlj , Contact information: <a href="mailto:someone@example.com">someone@example.com</a>.</p2>
</footer>
</body>
</html>