from tkinter import *
from PIL import Image, ImageTk
import main
import navigation_pane as np
import AdminProfileEdit as ape
import UserSearchedKeywords as usk
import NewAdmin
import ThemePanel as tp
import Block_Window as bw

from tkinter import messagebox

class AdminNavigationPanel:

    def __init__(self, admin_id):

        self.ad_id=admin_id
        self.panel=Tk()
        self.w = int(self.panel.winfo_screenwidth()*0.7)
        self.h = int(self.panel.winfo_screenheight()*0.6)
        self.d=self.yp(100/6)
        self.cy=int(0.5*self.d)
        self.cx=int(0.5*self.w)

        self.panel.geometry('{}x{}'.format(self.w, self.h))
        self.panel.title("Admin Options Page")
        self.panel.resizable(height=False,width=False)

        self.canvas1=Canvas(self.panel, height=self.d, width=self.w, bg="#12131F")
        self.canvas1.place(x=0, y=0)
        self.canvas1.create_text(self.cx, self.cy, text="Edit Profile", fill="#C3C3C3", font=("Candara", self.yp(10)), anchor="center")
        self.canvas1.bind("<Button-1>", self.edit)

        self.canvas2=Canvas(self.panel, height=self.d, width=self.w, bg="#12131F")
        self.canvas2.place(x=0, y=self.yp(100/6))
        self.canvas2.create_text(self.cx, self.cy, text="Add an Admin", fill="#C3C3C3", font=("Candara", self.yp(10)), anchor="center")
        self.canvas2.bind("<Button-1>", self.new_admin)

        self.canvas3=Canvas(self.panel, height=self.d, width=self.w, bg="#12131F")
        self.canvas3.place(x=0, y=self.yp(200/6))
        self.canvas3.create_text(self.cx, self.cy, text="Add an Application", fill="#C3C3C3", font=("Candara", self.yp(10)), anchor="center")
        self.canvas3.bind("<Button-1>", self.new_app)

        self.canvas4=Canvas(self.panel, height=self.d, width=self.w, bg="#12131F")
        self.canvas4.place(x=0, y=self.yp(300/6))
        self.canvas4.create_text(self.cx, self.cy, text="See Unfound Searched Keywords", fill="#C3C3C3", font=("Candara", self.yp(10)), anchor="center")
        self.canvas4.bind("<Button-1>", self.search)

        self.canvas5=Canvas(self.panel, height=self.d, width=self.w, bg="#12131F")
        self.canvas5.place(x=0, y=self.yp(400/6))
        self.canvas5.create_text(self.cx, self.cy, text="Block/Unblock User", fill="#C3C3C3", font=("Candara", self.yp(10)), anchor="center")
        self.canvas5.bind("<Button-1>", self.block)

        self.canvas6=Canvas(self.panel, height=self.d, width=self.w, bg="#12131F")
        self.canvas6.place(x=0, y=self.yp(500/6))
        self.canvas6.create_text(self.cx, self.cy, text="Add a Weather Theme", fill="#C3C3C3", font=("Candara", self.yp(10)), anchor="center")
        self.canvas6.bind("<Button-1>", self.theme)
        
        self.panel.mainloop()

    def xp(self, a):
        return int(a/100*self.w)

    def yp(self, a):
        return int(a/100*self.h)
        
    def edit(self):
        self.panel.destroy()
        d=ape.AdminEdit(self.ad_id)

    def new_admin(self):
        self.panel.destroy()
        d = NewAdmin.AddAdmin(self.ad_id)

    def new_app(self):
        self.panel.destroy()
        #d = add_App(self.ad_id)

    def search(self):
        d=usk.SearchedKeywords()

    def block(self):
        self.panel.destroy()
        d=bw.BlockUser(self.ad_id)
        
    def theme(self):
        self.panel.destroy()
        d=tp.AddTheme(self.ad_id)
