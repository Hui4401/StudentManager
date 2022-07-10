# StudentManager

JavaWeb期末项目，一个基于JSP和Servlet的学生管理系统实现，前端用了bootstrap和一些自定义的css样式，数据库使用mysql

- 登录页

![1.png](https://cdn.jsdelivr.net/gh/Hui4401/file/imgbed/project/StudentManager/1.png)

- 学生管理

![2.png](https://cdn.jsdelivr.net/gh/Hui4401/file/imgbed/project/StudentManager/2.png)

## 1.开发环境

- idea 2018
- jdk 1.8
- tomcat 9.0
- mysql 5.7

## 2.实现功能

- 登录(教师, 学生)
-	注册(教师, 验证码)
-	找回密码(教师, 学生)
-	记住登录状态
-	学生管理(增删改查)
-	成绩管理(修改, 导出excel)
-	上传文件（头像）
-	个人成绩(导出pdf)

## 3.使用方法

1. 下载项目
2. 在mysql中新建一个数据库 **student_manager** ，使用source命令加载 **根目录下的sql文件**
3. 用idea导入项目，修改 **/src/dao/** 下所有文件的MySQL连接代码中的用户密码信息，配置好tomcat后即可运行

## 4.简要说明

#### servlet文件

| 文件名 | 功能 |
|--|--|
| /servlet/check_login.java | 处理登录信息, 若成功则跳转对应身份的操作界面, 否则给出错误提示 |
| /servlet/check_register.java | 处理注册信息, 若成功则跳转登录界面, 否则给出错误提示 |
| /servlet/exit.java | 注销本次操作的所有session和cookie信息, 退出后跳转到登录界面 |
| /servlet/one_page_student.java | 查询出一个页面的学生信息添加到session里传递到jsp页面显示 |
| /servlet/one_page_score.java | 查询出一个页面的学生成绩信息添加到session里传递到jsp页面显示 |
| /servlet/add_student.java | 添加学生, 获得jsp页面传过来的学生信息并添加到学生表里 |
| /servlet/delete_student.java | 根据请求的学号从数据库里删除指定学生 |
| /servlet/update_student.java | 根据请求的数据更新指定学生信息 |
| /servlet/update_score.java | 根据请求数据更新指定学生的成绩信息 |
| /servlet/update_teacher.java |根据请求的数据更新老师的信息 |
| /servlet/update_teacher_password.java | 教师忘记密码时重置密码 |
| /servlet/upload_teacherImg.java | 获得老师上传的头像并保存 |
| /servlet/upload_studentImg.java | 获得学生上传的头像并保存 |
| /servlet/update_student_security.java | 学生更新自己的安全信息以及忘记密码时重置密码 |

#### jsp文件

| 文件名 | 功能 |
|--|--|
| /index.jsp | 项目索引页面, 遍历cookie, 存在登录信息则进入对应模块, 否则跳转到登录界面 |
| /login.jsp | 登录界面 |
| /register.jsp | 注册界面 |
| /forget.jsp | 忘记密码界面, 输入账号以找回密码 |
| /sendCode.jsp | 发送验证码以及验证码输入页面, 若用户没有设置安全邮箱则给出提示信息, 验证码输入正确跳到重置密码页面 |
| /code.jsp | 生成随机验证码 |
| /teacher/*.jsp | 教师页面 |
| /student/*.jsp | 学生页面 |
