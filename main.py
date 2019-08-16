from foo import *
import mysql.connector
import re
user = []
mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        passwd = "",
        database = "search_engine"
    )
cursor = mydb.cursor()

def addtheme(data):
    cursor.execute("""insert into `weather_themes` (`weather`, `bacground`, `canvas1`, `canvas2`, `canvas3`, `canvas4`, `canvas5`, `canvas6`, `canvas7`, `font`)
    values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""", data)
    mydb.commit()

def usetheme(weather):
    cursor.execute("""SELECT `srno`, `weather` FROM `weather_themes`""")
    result=cursor.fetchall()

    weather=weather.lower()

    id_=None
    for i in result:
        res=re.search(i[1], weather)
        if res is not None:
            id_=i[0]
            break
    if id_==None:
        id_=1
    result=(id_,)
    cursor.execute("""SELECT `background`, `canvas1`, `canvas2`, `canvas3`, `canvas4`, `canvas5`, `canvas6`, `canvas7`, `font` FROM `weather_themes` where `srno`=%s""", result)
    return(cursor.fetchone())

def block_user(data):
    cursor.execute("""update `users` set `allowed_status`=0 where `email`=%s""", data)
    mydb.commit()

def unblock_user(data):
    cursor.execute("""update `users` set `allowed_status`=1 where `email`=%s""", data)
    mydb.commit()

def add_user(data):
    cursor.execute("""insert into `users` (`name`, `d_city`, `email`, `pswd`, `phone`) values (%s, %s, %s, %s, %s)""", data)
    mydb.commit()

def add_admin(data):
    cursor.execute("""insert into `admins` (`name`, `email`, `pswd`) values (%s, %s, %s)""", data)
    mydb.commit()

def verify(data):
    cursor.execute("""SELECT * FROM `users` where email=%s and pswd=%s""", data)
    data=cursor.fetchone()
    if(data and data[6]==0):
        return 'false'
    return( (data[0], data[1], data[2], data[3], data[4], data[5]) )#check_this

def verify_admin(data):
    cursor.execute("""SELECT `admin_id` FROM `admins` where email=%s and pswd=%s""", data)
    return(cursor.fetchone())

def get_admin(*admin_id):
    cursor.execute("""SELECT * FROM `admins` where `admin_id`=%s""", admin_id)
    return(cursor.fetchone())

def edit_admin(data):
    cursor.execute("""UPDATE `admins` set `name`={}, `email`={}, `pswd`={} where `admin_id`={}""".format ( str(data[0]), str(data[1]), str(data[2]), str(data[3]) ) )
    mydb.commit()

def add_weather_history(data):
    cursor.execute("""insert into `weather_history` (`u_id`, `city`) values (%s, %s)""", data)
    mydb.commit()

def add_youtube_history(data):
    cursor.execute("""insert into `youtube_history` (`u_id`, `video_id`, `title`, `img_url`, `published_at`) values (%s, %s, %s, %s, %s)""", data)
    mydb.commit()

def get_youtube_recents(*u_id):
    cursor.execute("""SELECT `video_id`, `title`, `img_url`, `published_at` from `youtube_history` where `u_id`=%s order by `searched_at` desc limit 6""", u_id)
    return(cursor.fetchall())

def add_unknowns(data):
    cursor.execute("""insert into `unknown_apps` (`searched_by`, `app_searched`) values (%s, %s)""", data)
    mydb.commit()

def get_unknown_apps():
    cursor.execute("""SELECT * FROM `unknown_apps`""")
    return(cursor.fetchall())

def get_apps():
    cursor.execute("""SELECT `app_id`, `app_name` FROM `applications`""")
    return(cursor.fetchall())

def get_appicon(*app_id):
    cursor.execute("""SELECT `pic_path` FROM `application_icons` where `app_id`=%s""", app_id)
    return(cursor.fetchone())

def get_app_parameters(*app_id):
    cursor.execute("""SELECT `module`, `function` FROM `application_parameters` where `app_id`=%s""", app_id)
    return(cursor.fetchone())

def get_app_dictionary():
    data=get_apps()
    app_dict={}
    for i in data:
        path=get_appicon(i[0])
        prmts=get_app_parameters(i[0])
        app_dict[i[1]]=(path[0], prmts[0], prmts[1])
    return app_dict

def find_application(inp, u_id):
    inp=inp.lower()
    apps=get_apps()
    id_=None
    for i in apps:
        res=re.search(i[1], inp)
        if res is not None:
            id_=i[0]
            break

    if id_ is not None:
        w=get_app_parameters(id_)
        getattr(globals()[w[1]](), w[2])()

    else:
        w=(u_id, inp)
        add_unknowns(w)
        
