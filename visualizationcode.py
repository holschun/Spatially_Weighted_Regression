

#############################################
#                                           #
#       Regression Visualization Code       #
#                                           #
#############################################



import image




from Tkinter import *
import tkMessageBox
import time

master = Tk()




# Most of this header code was taken from the internet. I'm not 100% sure what it
# all does, but it is required. I think it just orients the screen initially.

if __name__ == "__main__":

     root = Tk()
 
     root.title("Image Animation Entry")
     root["padx"] = 40
     root["pady"] = 20   

     # Create a text frame to hold the text Label and the Entry widget
     textFrame = Frame(root)
 
     #Create a Label in textFrame
     entryLabel1 = Label(textFrame)
     entryLabel1["text"] = "Starting (m) Value:"
     entryLabel1.pack(side=LEFT)

     # Create an Entry Widget in textFrame
     entryWidget1 = Entry(textFrame)
     entryWidget1["width"] = 10
     entryWidget1.pack(side=LEFT)

     # Create an Entry Widget in textFrame
     #entryWidget2 = Entry(textFrame)
     #entryWidget2["width"] = 10
     #entryWidget2.pack(side=RIGHT)
     
     #Create a Label in textFrame
     #entryLabel2 = Label(textFrame)
     #entryLabel2["text"] = "Starting (e) Value:"
     #entryLabel2.pack(side=RIGHT)



# The following definitions are for the image display buttons and the step forward and step back buttons
# The implementation of the different buttons and windows is at the very bottom
# and is relatively self explanatory (as far as which button is which), so consult
# that section if you want to know what each of these defined commands does. The
# error exceptions were my work around for the different intervals between selected
# m and e values (as in, they weren't 25 apart always, so if the program goes 25
# forward, tries to display an image, and gets an error, the error exception tells
# it to skip to the next 25 ahead until it finds one).

def displayText():
           global entryWidget

        
           if entryWidget1.get().strip() == "":
               tkMessageBox.showerror("Tkinter Entry Widget", "Enter a text value")
              
           else:
                 Startm=str(entryWidget1.get().strip())
                 Starte=str(0)
                
              
                 Startm=Startm

                 for i in range(1, 7):
                     if i==1:   
                        try:
                              Starte=int(Starte,10)
                              Starte=str(Starte)
                              mValue = (Startm).zfill(4)
                              eValue = (Starte).zfill(3)
                              filename = 'm' + mValue + '_e' + eValue + '.png'
                              im = image.FileImage(filename)
                              im.show('GCV Distributions',800,250)
                              time.sleep(.5)
                                   
                        except IOError:
                              try:
                                      Starte=int(Starte,10)+25
                                      Starte=str(Starte)
                                      mValue = (Startm).zfill(4)
                                      eValue = (Starte).zfill(3)
                                      filename = 'm' + mValue + '_e' + eValue + '.png'
                                      im = image.FileImage(filename)
                                      im.show('GCV Distributions',800,250)
                                      time.sleep(.5)
                              except IOError:
                                      try:
                                             Starte=int(Starte,10)+25
                                             Starte=str(Starte)
                                             mValue = (Startm).zfill(4)
                                             eValue = (Starte).zfill(3)
                                             filename = 'm' + mValue + '_e' + eValue + '.png'
                                             im = image.FileImage(filename)
                                             im.show('GCV Distributions',800,250)
                                             time.sleep(.5)
                                      except IOError:
                                             try:
                                                    Starte=int(Starte,10)+25
                                                    Starte=str(Starte)
                                                    mValue = (Startm).zfill(4)
                                                    eValue = (Starte).zfill(3)
                                                    filename = 'm' + mValue + '_e' + eValue + '.png'
                                                    im = image.FileImage(filename)
                                                    im.show('GCV Distributions',800,250)
                                                    time.sleep(.5)
                                             except IOError:
                                                    tkMessageBox.showerror("Tkinter Entry Widget", "Enter a known (m) value.")
                                                    break
                     else:   
                        try:
                              Starte=int(Starte,10)+25
                              Starte=str(Starte)
                              mValue = (Startm).zfill(4)
                              eValue = (Starte).zfill(3)
                              filename = 'm' + mValue + '_e' + eValue + '.png'
                              im = image.FileImage(filename)
                              im.show('GCV Distributions',800,250)
                              time.sleep(.5)
                                   
                        except IOError:
                              try:
                                      Starte=int(Starte,10)+25
                                      Starte=str(Starte)
                                      mValue = (Startm).zfill(4)
                                      eValue = (Starte).zfill(3)
                                      filename = 'm' + mValue + '_e' + eValue + '.png'
                                      im = image.FileImage(filename)
                                      im.show('GCV Distributions',800,250)
                                      time.sleep(.5)
                              except IOError:
                                      try:
                                             Starte=int(Starte,10)+25
                                             Starte=str(Starte)
                                             mValue = (Startm).zfill(4)
                                             eValue = (Starte).zfill(3)
                                             filename = 'm' + mValue + '_e' + eValue + '.png'
                                             im = image.FileImage(filename)
                                             im.show('GCV Distributions',800,250)
                                             time.sleep(.5)
                                      except IOError:
                                             try:
                                                    Starte=int(Starte,10)+25
                                                    Starte=str(Starte)
                                                    mValue = (Startm).zfill(4)
                                                    eValue = (Starte).zfill(3)
                                                    filename = 'm' + mValue + '_e' + eValue + '.png'
                                                    im = image.FileImage(filename)
                                                    im.show('GCV Distributions',800,250)
                                                    time.sleep(.5)
                                             except IOError:
                                                    tkMessageBox.showerror("Tkinter Entry Widget", "Enter known (m) and (e) values")
                                                    break
                                     
                 else:
                        y.set((int(Startm)))
                        x.set((300))
                        print 'Animation Complete'

                        
                



     
def callbackm1():
        
	try:
                y.set((y.get())+25)
                mValue = str((y.get())).zfill(4)
                eValue = str(x.get()).zfill(3)
                filename = 'm' + mValue + '_e' + eValue + '.png'
                im = image.FileImage(filename)
                im.show('GCV Distributions',800,250)
        except IOError:
                try:
                        y.set((y.get())+25)
                        mValue = str((y.get())).zfill(4)
                        eValue = str(x.get()).zfill(3)
                        filename = 'm' + mValue + '_e' + eValue + '.png'
                        im = image.FileImage(filename)
                        im.show('GCV Distributions',800,250)
                except IOError:
                        try:
                                y.set((y.get())+25)
                                mValue = str((y.get())).zfill(4)
                                eValue = str(x.get()).zfill(3)
                                filename = 'm' + mValue + '_e' + eValue + '.png'
                                im = image.FileImage(filename)
                                im.show('GCV Distributions',800,250)
                        except IOError:
                                try:
                                        y.set((y.get())+25)
                                        mValue = str((y.get())).zfill(4)
                                        eValue = str(x.get()).zfill(3)
                                        filename = 'm' + mValue + '_e' + eValue + '.png'
                                        im = image.FileImage(filename)
                                        im.show('GCV Distributions',800,250)
                                except IOError:
                                        try:
                                                y.set((y.get())+25)
                                                mValue = str((y.get())).zfill(4)
                                                eValue = str(x.get()).zfill(3)
                                                filename = 'm' + mValue + '_e' + eValue + '.png'
                                                im = image.FileImage(filename)
                                                im.show('GCV Distributions',800,250)
                                        except IOError:
                                                try:
                                                        y.set((y.get())+25)
                                                        mValue = str((y.get())).zfill(4)
                                                        eValue = str(x.get()).zfill(3)
                                                        filename = 'm' + mValue + '_e' + eValue + '.png'
                                                        im = image.FileImage(filename)
                                                        im.show('GCV Distributions',800,250)
                                                except IOError:
                                                        try:
                                                                y.set((y.get())+25)
                                                                mValue = str((y.get())).zfill(4)
                                                                eValue = str(x.get()).zfill(3)
                                                                filename = 'm' + mValue + '_e' + eValue + '.png'
                                                                im = image.FileImage(filename)
                                                                im.show('GCV Distributions',800,250)
                                                        except IOError:
                                                                try:
                                                                        y.set((y.get())+25)
                                                                        mValue = str((y.get())).zfill(4)
                                                                        eValue = str(x.get()).zfill(3)
                                                                        filename = 'm' + mValue + '_e' + eValue + '.png'
                                                                        im = image.FileImage(filename)
                                                                        im.show('GCV Distributions',800,250)
                                                                except IOError:
                                                                        try:
                                                                                y.set((y.get())+25)
                                                                                mValue = str((y.get())).zfill(4)
                                                                                eValue = str(x.get()).zfill(3)
                                                                                filename = 'm' + mValue + '_e' + eValue + '.png'
                                                                                im = image.FileImage(filename)
                                                                                im.show('GCV Distributions',800,250)
                                                                        except IOError:
                                                                                y.set((y.get())+25)
                                                                                mValue = str((y.get())).zfill(4)
                                                                                eValue = str(x.get()).zfill(3)
                                                                                filename = 'm' + mValue + '_e' + eValue + '.png'
                                                                                im = image.FileImage(filename)
                                                                                im.show('GCV Distributions',800,250)
                
                


def callbackm2():
        
	try:
                y.set((y.get())-25)
                mValue = str((y.get())).zfill(4)
                eValue = str(x.get()).zfill(3)
                filename = 'm' + mValue + '_e' + eValue + '.png'
                im = image.FileImage(filename)
                im.show('GCV Distributions',800,250)
        except IOError:
                try:
                        y.set((y.get())-25)
                        mValue = str((y.get())).zfill(4)
                        eValue = str(x.get()).zfill(3)
                        filename = 'm' + mValue + '_e' + eValue + '.png'
                        im = image.FileImage(filename)
                        im.show('GCV Distributions',800,250)
                except IOError:
                        try:
                                y.set((y.get())-25)
                                mValue = str((y.get())).zfill(4)
                                eValue = str(x.get()).zfill(3)
                                filename = 'm' + mValue + '_e' + eValue + '.png'
                                im = image.FileImage(filename)
                                im.show('GCV Distributions',800,250)
                        except IOError:
                                try:
                                        y.set((y.get())-25)
                                        mValue = str((y.get())).zfill(4)
                                        eValue = str(x.get()).zfill(3)
                                        filename = 'm' + mValue + '_e' + eValue + '.png'
                                        im = image.FileImage(filename)
                                        im.show('GCV Distributions',800,250)
                                except IOError:
                                        try:
                                                y.set((y.get())-25)
                                                mValue = str((y.get())).zfill(4)
                                                eValue = str(x.get()).zfill(3)
                                                filename = 'm' + mValue + '_e' + eValue + '.png'
                                                im = image.FileImage(filename)
                                                im.show('GCV Distributions',800,250)
                                        except IOError:
                                                try:
                                                        y.set((y.get())-25)
                                                        mValue = str((y.get())).zfill(4)
                                                        eValue = str(x.get()).zfill(3)
                                                        filename = 'm' + mValue + '_e' + eValue + '.png'
                                                        im = image.FileImage(filename)
                                                        im.show('GCV Distributions',800,250)
                                                except IOError:
                                                        try:
                                                                y.set((y.get())-25)
                                                                mValue = str((y.get())).zfill(4)
                                                                eValue = str(x.get()).zfill(3)
                                                                filename = 'm' + mValue + '_e' + eValue + '.png'
                                                                im = image.FileImage(filename)
                                                                im.show('GCV Distributions',800,250)
                                                        except IOError:
                                                                try:
                                                                        y.set((y.get())-25)
                                                                        mValue = str((y.get())).zfill(4)
                                                                        eValue = str(x.get()).zfill(3)
                                                                        filename = 'm' + mValue + '_e' + eValue + '.png'
                                                                        im = image.FileImage(filename)
                                                                        im.show('GCV Distributions',800,250)
                                                                except IOError:
                                                                        try:
                                                                                y.set((y.get())-25)
                                                                                mValue = str((y.get())).zfill(4)
                                                                                eValue = str(x.get()).zfill(3)
                                                                                filename = 'm' + mValue + '_e' + eValue + '.png'
                                                                                im = image.FileImage(filename)
                                                                                im.show('GCV Distributions',800,250)
                                                                        except IOError:
                                                                                y.set((y.get())-25)
                                                                                mValue = str((y.get())).zfill(4)
                                                                                eValue = str(x.get()).zfill(3)
                                                                                filename = 'm' + mValue + '_e' + eValue + '.png'
                                                                                im = image.FileImage(filename)
                                                                                im.show('GCV Distributions',800,250)
                



def callbacke1():
        
        try:
                x.set((x.get())+25)
                mValue = str((y.get())).zfill(4)
                eValue = str(x.get()).zfill(3)
                filename = 'm' + mValue + '_e' + eValue + '.png'
                im = image.FileImage(filename)
                im.show('GCV Distributions',800,250)
        except IOError:
                try:
                      x.set((x.get())+25)
                      mValue = str((y.get())).zfill(4)
                      eValue = str(x.get()).zfill(3)
                      filename = 'm' + mValue + '_e' + eValue + '.png'
                      im = image.FileImage(filename)
                      im.show('GCV Distributions',800,250)
                except IOError:
                      try:
                              x.set((x.get())+25)
                              mValue = str((y.get())).zfill(4)
                              eValue = str(x.get()).zfill(3)
                              filename = 'm' + mValue + '_e' + eValue + '.png'
                              im = image.FileImage(filename)
                              im.show('GCV Distributions',800,250)
                      except IOError:
                              x.set((x.get())+25)
                              mValue = str((y.get())).zfill(4)
                              eValue = str(x.get()).zfill(3)
                              filename = 'm' + mValue + '_e' + eValue + '.png'
                              im = image.FileImage(filename)
                              im.show('GCV Distributions',800,250)


def callbacke2():
        
        try:
                x.set((x.get())-25)
                mValue = str((y.get())).zfill(4)
                eValue = str(x.get()).zfill(3)
                filename = 'm' + mValue + '_e' + eValue + '.png'
                im = image.FileImage(filename)
                im.show('GCV Distributions',800,250)
        except IOError:
                try:
                      x.set((x.get())-25)
                      mValue = str((y.get())).zfill(4)
                      eValue = str(x.get()).zfill(3)
                      filename = 'm' + mValue + '_e' + eValue + '.png'
                      im = image.FileImage(filename)
                      im.show('GCV Distributions',800,250)
                except IOError:
                      try:
                              x.set((x.get())-25)
                              mValue = str((y.get())).zfill(4)
                              eValue = str(x.get()).zfill(3)
                              filename = 'm' + mValue + '_e' + eValue + '.png'
                              im = image.FileImage(filename)
                              im.show('GCV Distributions',800,250)
                      except IOError:
                              x.set((x.get())-25)
                              mValue = str((y.get())).zfill(4)
                              eValue = str(x.get()).zfill(3)
                              filename = 'm' + mValue + '_e' + eValue + '.png'
                              im = image.FileImage(filename)
                              im.show('GCV Distributions',800,250)

def callbackpull():
	mValue = str(y.get()).zfill(4)
	eValue = str(x.get()).zfill(3)
	filename = 'm' + mValue + '_e' + eValue + '.png'
	try:
                im = image.FileImage(filename)
                im.show('GCV Distributions',800,250)
        except IOError:
                print "Invalid Slider Selections. Try Different Values"




# Here is where the buttons are generated, using the above defined functions.
# Remember for this code to work, it needs to be in the same folder as the image
# files, and must also contain the image.py source file. And the naming convention
# for the image files must be consistent with Ernest's original method.

y = Scale(master, from_=0, to=750, label='Spatial Variation (m)', orient=HORIZONTAL, resolution=25, length=500)
y.pack()


buttonm1 = Button(master, text="Next (m)", command=callbackm1)
buttonm2 = Button(master, text="Previous (m)", command=callbackm2)

buttonm1.pack()
buttonm2.pack()


x = Scale(master, from_=50, to=300, label='Standard Deviation of the Error (e)', resolution=25, orient=HORIZONTAL, length=200)
x.pack()

buttone1 = Button(master, text="Next (e)", command=callbacke1)
buttone1.pack()

buttone2 = Button(master, text="Previous (e)", command=callbacke2)
buttone2.pack()




buttonpull = Button(master, text="Pull Slider Values", command=callbackpull)
buttonpull.pack()

textFrame.pack(anchor=N)

button = Button(root, text="Submit", command=displayText)
button.pack()
 



im = image.FileImage('m0000_e050.png')
im.show('GCV Distributions',800,250)

mainloop()










