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
        last_time=time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
        sql = "INSERT INTO log_info(name,host,path,action,key_args,logrotate,backup_info) VALUES ('%s','%s','%s','%s','%s','%s','%s')" %(name,host,path,action,key_args,logrotate,backup_info)
	print "At %sclient ip :%s add a new log to mysql db ,Please checkout it!"%(last_time,self.request.remote_ip)
        self.db.execute(sql)

class Clear_LogHandler(BaseHandler):                                                                                         
    def post(self):                                                                                                 
        log_id = self.get_argument("log_id") 
        sql = "DELETE FROM log_info where id='%s'"%(log_id)
        self.db.execute(sql)
        exec_time=time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
	print "At %sclient ip :%s delete a log in mysql db  ,Please notice itt!"%(exec_time,self.request.remote_ip)