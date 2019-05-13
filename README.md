# StudentManager

## 1.开发环境

- jdk 1.8
- tomcat 9.0
- mariadb 10.0

## 2.使用方法

1. 下载项目
2. 在mariadb中创建一个数据库 **student_manager** ，使用source命令加载项目文件夹下的sql文件
3. 将项目文件中的 **student_manager** 文件夹移动到tomcat安装目录下的webapps文件夹中
4. 将以下jar包移动到jdk安装目录下的 jre/lib/ext/ 目录下:

  - tomcat安装目录下lib文件夹中的 servlet-api.jar
  - 下载jsmartcom_zh_CN.jar
  - 下载[mariadb-java-client.jar](https://downloads.mariadb.org/connector-java/)
  
5. cd进入WEB-INF目录下的classes文件夹中
6. `javac */*.java`
7. 启动tomcat，浏览器输入 localhost:8080/student_manager

## 3.效果展示

- 登录页
[![EnBzJe.png](https://s2.ax1x.com/2019/04/26/EnBzJe.png)](https://imgchr.com/i/EnBzJe)

- 学生管理
[![EnBxiD.md.png](https://s2.ax1x.com/2019/04/26/EnBxiD.md.png)](https://imgchr.com/i/EnBxiD)
