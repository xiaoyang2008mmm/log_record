# -*- coding: utf-8 -*- 

import tornado.web
import time
class BaseHandler(tornado.web.RequestHandler):
    @property
    def db(self):
     return self.application.db
    def get_current_user(self):
     return self.get_secure_cookie("user")


       

class ChartHandler(BaseHandler):
    def get(self):
        self.render('chart.html') 
       

class Log_DisplayHandler(BaseHandler):
    def get(self):
	Log_INFO = self.db.query("SELECT * FROM log_info")
        self.render('log_display.html',Log_INFO_html=Log_INFO) 


class Add_NewlogHandler(BaseHandler):
    def post(self):
        name  		= self.get_argument("Log_Name")
        host  		= self.get_argument("Log_Host")
        path  		= self.get_argument("Log_Path")
        action 		= self.get_argument("Log_Purpose")
        key_args	= self.get_argument("Log_Key")
        logrotate	= self.get_argument("Log_roate")
        backup_info  	= self.get_argument("Log_Backup")
        last_time = time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
        sql = "INSERT INTO log_info(name,host,path,action,key_args,logrotate,backup_info) VALUES ('%s','%s','%s','%s','%s','%s','%s')" %(name,host,path,action,key_args,logrotate,backup_info)
	sql_log_id = ("select id  FROM log_info where action = '%s'")%(action)
	try:
	    log_id = self.db.query(sql_log_id)
	except:
	    pass 
	if  log_id:
	    update_sql = ("update log_info set  name = '%s' ,host='%s',path='%s',action='%s',key_args='%s',logrotate='%s',backup_info='%s' where id = '%d'")%(name,host,path,action,key_args,logrotate,backup_info,(log_id[0])["id"])
	    self.db.update(update_sql)
	    self.write("update")
	else:
	    try:
            	self.db.execute(sql)
	    	print "At %sclient ip :%s add a new log to mysql db ,Please checkout it!"%(last_time,self.request.remote_ip)
            	self.write("新增成功")
	    except:
	    	print "插入重复的日志用途数据"
            	self.write("")		##返回ajax空数据以此做判断
class Clear_LogHandler(BaseHandler):                                                                                         
    def post(self):                                                                                                 
        log_id = self.get_argument("log_id") 
        sql = "DELETE FROM log_info where id='%s'"%(log_id)
        self.db.execute(sql)
        exec_time=time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
	print "At %sclient ip :%s delete a log in mysql db  ,Please notice it!"%(exec_time,self.request.remote_ip)



class Change_LogHandler(BaseHandler):
 
    def post(self):
        id = self.get_argument("id")
	sql = "SELECT *  FROM log_info where id='%s'"%(id)
	#data = unicode(self.db.query(sql), "utf-8")
	data = self.db.query(sql)
        self.write(data[0])
