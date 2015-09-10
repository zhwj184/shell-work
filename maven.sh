maven常用命令


##查看maven版本
mvn --version

##创建基于maven web archetype的 maven web工程
##创建maven的spring web工程  http://www.mkyong.com/maven/how-to-create-a-web-application-project-with-maven/
mvn archetype:generate -DgroupId={project-packaging} -DartifactId={project-name} -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

##创建maven的java普通工程
mvn -B archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DgroupId=com.mycompany.app -DartifactId=my-app

##编译工程
mvn compile

##执行单元测试
mvn test

##打包
mvn package

##安装到本地maven库
mvn install

##将包部署到远程仓库
mvn deploy


##将工程生成web站点，可以基于site的语法生成一个文档性的网站
mvn site


##删除编译好的target目录
mvn clean


##生成eclipse工程
mvn eclipse:eclipse

##生成 IntelliJ IDEA工程
mvn idea:idea


##如果maven工程中配置了jetty插件，则下面名称启动jetty内置服务器
mvn jetty:run


##查看工程里面激活生效的profile，
mvn help:active-profiles

##安装指定文件到本地仓库
mvn install:install-file -DgroupId=<groupId> -DartifactId=<artifactId> -Dversion=1.0.0 -Dpackaging=jar -Dfile=<myfile.jar>

##查看实际pom信息
mvn help:effective-pom

##分析项目的依赖信息 打印整个依赖树 
mvn dependency:analyze 或 mvn dependency:tree


##查看帮助信息
mvn help:help 或 mvn help:help -Ddetail=true

##查看插件的帮助信息
mvn <plug-in>:help，比如：mvn dependency:help 或 mvn ant:help

##打包时跳过测试
mvn package -Dmaven.test.skip=ture

##使用 help 插件的  describe 目标来输出 Maven Help 插件的信息。 
mvn help:describe -Dplugin=help 

##使用Help 插件输出完整的带有参数的目标列 
mvn help:describe -Dplugin=help -Dfull 

##Exec 插件让我们能够在不往 classpath 载入适当的依赖的情况下，运行这个程序 
mvn exec:java -Dexec.mainClass=org.sonatype.mavenbook.weather.Main 

##Exec 插件让我们能够在不往 classpath 载入适当的依赖的情况下，运行这个程序 
mvn dependency:resolve 

##想要查看完整的依赖踪迹，包含那些因为冲突或者其它原因而被拒绝引入的构件，打开 Maven 的调试标记运行 
mvn install -X 

##构建装配Maven Assembly 插件是一个用来创建你应用程序特有分发包的插件 
mvn install assembly:assembly 

##显示详细错误信息
mvn -e            

##验证工程是否正确
mvn validate        

##在集成测试可以运行的环境中处理和发布包
mvn integration-test     

##运行任何检查，验证包是否有效且达到质量标准
mvn verify          

##产生应用需要的任何额外的源代码，如xdoclet
mvn generate-sources    

##下载源码
mvn -DdownloadSources=true 

##下载javadoc
mvn -DdownloadJavadocs=true 

##先下载最新版本，再执行打包操作
mvn -U package