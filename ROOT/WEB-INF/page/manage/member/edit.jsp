<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>
<head>
<style type="text/css">
.file_input_tip{
    margin-top: 10px;
    width: 80px;
    height: 20px;
    display: block;
    border: 1px #AAAAAA solid;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    -khtml-border-radius: 10px;
    -border-radius: 10px;
}
#image_file{
    width: 80px;
    height: 20px;
    opacity:0;
    margin-top: -20px;
    margin-bottom: 10px;
}

</style>

</head>

<body>
<div>

<div>
<img alt="" src="${base}/images/user.jpg" width=120 height=120 >
<form action="" id="image_form" name="form" method="post" enctype="multipart/form-data"  target="hidden_frame" >                  
<span class="file_input_tip">选择图片 </span>
<input  type="file" id="image_file" name="photo" style="" >
<iframe name="hidden_frame" id="hidden_frame" style="display:none"></iframe>
</form>
</div>

<form action="/member/0" method="post" id="">
<div >
<label>学号：</label>
<input type="text" name="member.studentId" >
</div>

<div>
<label>姓名：</label>
<input type="text" name="member.name" >
</div>

<div>
<label>性别：</label>
男<input type="radio" name="extend.sex" value="0" checked="checked" >&nbsp;
女<input type="radio" name="extend.sex" value="1"  >
</div>

<div>
<label>类型：</label>
<select name="member.type" >
<option value="1">教师</option>
<option value="2">研究生</option>
<option value="3">本科生</option>

</select>
</div>

<div>
<label>权限：</label>
<select name="member.role" >
<option value="0">普通成员</option>
<option value="1">管理员</option>
</select>
</div>

<div>
<label>状态：</label>
<select name="member.state" >
<option value="2" >见习生</option>
<option value="1">在职</option>
<option value="0">已毕业</option>
<option value="-1">退出</option>
</select>
</div>

<div>
<label>年级：</label>
<input type="text" name="extend.grade" >
</div>

<div>
<label>学院：</label>
<input type="text" name="extend.academy" >
</div>

<div>
<label>专业：</label>
<input type="text" name="extend.major" >
</div>


<div>
<label>手机：</label>
<input type="text" name="extend.mobile" >
</div>

<div>
<label>短号：</label>
<input type="text" name="extend.mobileshort" > 
</div>

<div>
<label>邮箱：</label>
<input type="text" name="extend.email" >
</div>

<div>
<label>生日：</label>
<input type="text" name="extend.birthday" >
</div>

<div>
<label>个人主页：</label>
<input type="text" name="extend.homepage" >
</div>

<div>
<input type="hidden" name="" value="${TOKEN}" >
<input type="button" value="提交" >
</div>

</form>

</div>

</body>
</html>