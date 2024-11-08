# 使用hl7fhir/ig-publisher-base作为构建FHIR资源的基础镜像
# FROM artifactrepo.server.ha.org.hk:55743/docker-dev-ehrss/data kidsfirstdrc/fhir-ig-publisher:latest AS fhir-builder

FROM hl7fhir/ig-publisher-base:latest AS fhir-builder

# USER publisher
# 设置工作目录
WORKDIR /home/publisher/ig/
 
# 将项目的所有文件复制到工作目录
COPY . .

RUN npm install -g fsh-sushi
# RUN chmod +x /home/publisher/ & chmod +x /home/publisher/
# RUN which sushi || echo "sushi not found"
# RUN echo which jekyll
# RUN echo which sushi
# RUN echo /home/publisher/.node/bin/sushi --version
RUN sushi build .
# RUN which sushi 

# 运行FHIR IG Publisher构建FHIR资源到output目录
# RUN java -jar /publisher.jar -ig ig.ini  
#  & chmod +x _genonce.sh
RUN echo $PATH & gem environment & chmod +x _genonce.sh
RUN bash ./_genonce.sh -no-sushi 
RUN cp ./input-cache/publisher.jar ~/

# CMD ["sh"]

# 使用httpd容器作为服务器，将FHIR资源提供为HTTP服务
FROM httpd:2.4

# 将构建完成的FHIR资源文件复制到HTTPD服务器目录
COPY --from=fhir-builder /work/output /usr/local/apache2/htdocs/

# 暴露HTTPD的默认端口
EXPOSE 80

# 启动HTTPD服务
CMD ["httpd-foreground"]
