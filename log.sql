-- MySQL dump 10.13  Distrib 5.6.19-67.0, for Linux (x86_64)
--
-- Host: localhost    Database: log
-- ------------------------------------------------------
-- Server version	5.6.19-67.0-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `log_info`
--

DROP TABLE IF EXISTS `log_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) NOT NULL,
  `host` char(255) NOT NULL,
  `path` char(255) NOT NULL,
  `action` char(255) NOT NULL,
  `key_args` char(255) NOT NULL,
  `logrotate` char(255) NOT NULL,
  `backup_info` char(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `action` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_info`
--

LOCK TABLES `log_info` WRITE;
/*!40000 ALTER TABLE `log_info` DISABLE KEYS */;
INSERT INTO `log_info` VALUES (7,'nginx 访问日志','192.168.7.3[1-4、178、210]','/data/logs/nginx/ebk6_access.log','android、ios书城','android、ios书城','日志按照小时为单位切割','放入/data/zybook/entry目录中'),(8,'nginx访问日志','192.168.7.3[1-4、178、210]','/data/logs/nginx/ireader_access.log','pc书城访问日志','pc书城访问日志','ebk6_开头的是Android、ios书城、PC书城、win8的访问日志；','/data/zybook/entry'),(9,'nginx日志','192.168.7.3[1-4、178、210]','/data/logs/nginx/m2.access.log','wap简版书城','m2_开头的是wap书城简版日志；','按小时','/data/zybook/entry目录中'),(10,'nginx日志','192.168.7.3[1-4、178、210]','/data/logs/nginx/m.access.log','wap书城触屏版','wap书城触屏版','按小时 m_开头的是wap书城触屏版的日志','/data/zybook/entry'),(11,'nginx日志','192.168.7.3[1-4、178、210]','/data/logs/nginx/m.baidu.access.log','百度下载页面的日志','无','无','/data/zybook/entry'),(12,'nginx日志','192.168.7.3[1-4、178、210]','/data/logs/nginx/sh2.access.log','塞班访问日志','无','无','/data/zybook/entry'),(13,'nginx日志','192.168.7.3[1-4、178、210]','/data/logs/nginx/win8.access.log','Win8书城','Win8书城','按小时','/data/zybook/entry'),(15,'nginx日志','192.168.7.3[1-4、178、210]','/data/logs/updateCdn.log','记录PHP服务访问CDN接口的结果日志','记录PHP服务访问CDN接口的结果日志','按天','本地保留20天'),(16,'nginx日志','192.168.7.3[1-4、178、210]','/data/logs/error/guojing.log','记录用户异常访问日期，方便对异常请求做拦截；','记录用户异常访问日期，方便对异常请求做拦截；','按天','本地保留20天'),(17,'php日志','192.168.7.3[1-4、178、210]','/data/logs/error/php-fpm.log','记录php-fpm相关错误信息','记录php-fpm相关错误信息','按天切割','本地保留20天'),(18,'php日志','192.168.7.3[1-4、178、210]','/data/logs/error/www.log.slow','记录php文件访问慢的日志','记录php文件访问慢的日志','按天切割','本地保留20天'),(19,'tornado日志','192.168.7.103','/data/logs/yy/newcps/newcps.log.端口号','章节与价格接口统计，超时统计，日志大于10ms的才会打印','章节与价格接口统计，超时统计，日志大于10ms的才会打印','按天自动切割','保留最新20天日志'),(20,'tornado日志','192.168.7.104','/data/logs/yy/newcps/newcps.error.log.端口号','章节与价格相关接口错误统计，warning级别以上才会打印','章节与价格相关接口错误统计，warning级别以上才会打印','按天自动切割','保留最新20天日志'),(21,'tornado日志','192.168.7.68','/data/logs/cps.tornado.log.[端口号].[切割标记]','cps书城所有内容相关业务日志，只输出响应时间>30ms的请求','cps书城所有内容相关业务日志，只输出响应时间>30ms的请求','按大小自动切割(96MB)','保留近2个月日志'),(23,'tornado日志','192.168.7.118','/data/logs/cps.simhash.tornado.log.[端口号].[切割标记]','书籍章节特征库接口业务日志，只输出响应时间>30ms的请求','书籍章节特征库接口业务日志，只输出响应时间>30ms的请求','按大小自动切割(96MB)','保留近2个月日志'),(24,'tornado日志','192.168.0.108/109','/data/server/tomcat/searchlogs/search.log.yyyy-mm-dd.zip','听书搜索日志','听书搜索日志','每天一个文件，会自动压缩为zip','15天'),(25,'tornado日志','192.168.0.108','/data/server/tomcat/searchlogs/index.log.yyyy-mm-dd.zip','听书索引日志','听书索引日志','每天一个文件，会自动压缩为zip','15天'),(26,'tornado日志','192.168.7.74','/data/logs/yy/operation_log/operation.log.端口名称','运营系统所有级别日志','运营系统所有级别日志','按天切割','保留最近10天数据'),(27,'tornado日志','192.168.7.74','/data/logs/yy/operation_log/operation.error.log.端口名称','运营系统错误及以上级别日志','运营系统错误及以上级别日志','按天切割','保留最近20天数据'),(28,'tornado日志','192.168.7.68|69|104','/data/logs/search_new_logs/mulitiSearch.log/index.log','新书城搜索日志/索引日志','新书城搜索日志/索引日志','按天切割，压缩','保留最近14天数据'),(29,'tornado日志','192.168.7.68|69|104','/data/tomcat/suggestlogs/search.log/index.log/suggest.log/ suggestForBookList.log','老书城搜索日志/索引日志/搜索提示日志/书单搜索提示日志','老书城搜索日志/索引日志/搜索提示日志/书单搜索提示日志','按天切割，压缩','保留最近14天数据'),(30,'tornado日志','192.168.7.68|69|104','/data/logs/tomcat/circleSearchLogs/search.log/index.log/suggest.log','书友圈搜索日志/索引日志/搜索提示日志','书友圈搜索日志/索引日志/搜索提示日志','按天切割，压缩','保留最近14天数据'),(31,'tomcat日志','192.168.7.68|69|104','/data/server/tomcat/tomcat_2[1-4]00[0,1]/logs/catalina.out.日期 localhost_access_log.日期','搜索相关tomcat日志','搜索相关tomcat日志','按天切割，压缩','暂无'),(32,'tornado日志','192.168.7.71','/data/logs/cps.simhash.tornado.log.[端口号].[切割标记]','书籍章节特征库接口业务日志，输出响应时间>30ms的请求','书籍章节特征库接口业务日志，只输出响应时间>30ms的请求','按大小自动切割(96MB)','保留2个月');
/*!40000 ALTER TABLE `log_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-05 12:04:08
