# 基础镜像
FROM  openjdk:1.8
# author
MAINTAINER ruoyi

# 挂载目录
VOLUME /home/ruoyi
# 创建目录
RUN mkdir -p /home/ruoyi
# 指定路径
WORKDIR /home/ruoyi
# 复制jar文件到路径
COPY ${JAR_FILE} app.jar

EXPOSE 8081
# 启动认证服务
ENTRYPOINT ["java","-jar","app.jar"]