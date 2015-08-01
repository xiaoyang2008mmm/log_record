from views.views import *
import os.path

STATIC_PATH   = os.path.join(os.path.dirname(__file__), "../static")
TEMPLATE_PATH = os.path.join(os.path.dirname(__file__), "../templates")
HANDLERS =[(r"/log_display/" ,Log_DisplayHandler),
	   (r"/add_newlog/"  ,Add_NewlogHandler),
	   (r"/clear_log/"   ,Clear_LogHandler),
	   (r"/" ,Log_DisplayHandler),
	]
HANDLERS +=[(r"/chart/", ChartHandler)]
