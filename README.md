# StudentManager

## 1.开发环境

- jdk 1.8
- tomcat 9.0
- mariadb 10.0

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
2. 在mariadb中创建一个数据库 **student_manager** ，使用source命令加载项目文件夹下的sql文件
3. 将项目文件中的 **student_manager** 文件夹移动到tomcat安装目录下的webapps文件夹中
4. 将以下jar包移动到jdk安装目录下的 jre/lib/ext/ 目录下:

  - tomcat安装目录下lib文件夹中的 servlet-api.jar
  - 下载jsmartcom_zh_CN.jar
  - 下载[mariadb-java-client.jar](https://downloads.mariadb.org/connector-java/)
  
5. cd进入WEB-INF目录下的classes文件夹中，`javac */*.java`
6. 启动tomcat，浏览器输入 localhost:8080/student_manager

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

## 5.效果展示

- 登录页

[![EnBzJe.png](https://s2.ax1x.com/2019/04/26/EnBzJe.png)](https://imgchr.com/i/EnBzJe)

- 学生管理

[![EnBxiD.md.png](https://s2.ax1x.com/2019/04/26/EnBxiD.md.png)](https://imgchr.com/i/EnBxiD)
