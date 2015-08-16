# -*- coding: utf-8 -*- 
import tornado.httpserver, os
import tornado.ioloop
import tornado.web,torndb
from handlers.handlers import HANDLERS , STATIC_PATH , TEMPLATE_PATH

from tornado.options import define, options, parse_command_line

define("port", default=808, help="run on the given port", type=int)
define("mysql_host", default="localhost:3306", help="log database host")
define("mysql_database", default="log", help="log database name")
define("mysql_user", default="root", help="log database user")
#define("mysql_password", default="bxjU68#Y6%Of&vs99", help="log database password")
define("mysql_password", default="", help="log database password")


class Application(tornado.web.Application):
    def __init__(self):
	handlers=HANDLERS
	settings = {                                                        
       	    "static_path": STATIC_PATH ,
     	    "template_path": TEMPLATE_PATH,
     	    "login_url": "/login/",                                                 
            "debug": True,                                                      
     	    "cookie_secret": "61oETzKXQAGaYdkL5gEmGeJJFuYh7EQnp2XdTP1o/Vo=",                          
	    #"xsrf_cookies":True,                                                  
	}                                                                   
                                                                    

     	tornado.web.Application.__init__(self, handlers, **settings)
	try:
             self.db = torndb.Connection(                                               
       	     host=options.mysql_host, database=options.mysql_database,                             
             user=options.mysql_user, password=options.mysql_password,charset='utf8')
	     if not self.db:
	         print "mysql database connect already ok,Please use !"
	except:
	     print  "数据库连接不上"





def main():
    parse_command_line()
    http_server = tornado.httpserver.HTTPServer(Application())
    http_server.listen(options.port)
    tornado.ioloop.IOLoop.instance().start()


if __name__ == "__main__":
    main()
