# PortalsAutoHide
This is a simple autohotkey script made to hide  
"Portals: Desktop Organization" sofware from https://portals-app.com/  
from the desktop when not used and show it with a dobble click

# Config
To cofigure this you will have to edit the code and compile yourself.  
I dont want to put lots more effort into this right now.  
I am still trying to finish my very adjustable windows file linking tool.  
(This one https://github.com/marvin1099/Sylink-Creator-Windows.)

 - Warning you have to probably click 3 times since you have to focus the  
   dekstop first to do this (you can also use Win+D that will focus the destop to)  

# Defaults
1. It will expect a portal to be setup in %YOURUSERFOLDER%\Portals\Default\  
2. It will show the portal when dobbleclicking on the destop.
3. It will keet the icons visible if your are:  
   - in the notificaton bar
   - in the nexus dock from https://www.winstep.net/nexus.asp
   - on droptop 4 from https://github.com/Droptop-Four/Basic-Version 
   - on the portal (clicking on it) 
4. It will disappear after 1 second when your on anything else

# How does it work
If you don't mind using my precompiled version,  
which may not work as expected on your machine,  
here are the things I have set up.
There are 2 loops in the script,  
one is used to detect dobble clicks,  
one is used the other things.  
it will copy icons and files from the destop to default 1.
Makes a destop active check,  
if so waits fror a dobble click.
Then i moves the portal back to wher it is visible.
That is how it shows and hides the window,  
it just moves it 15000 pixels to the left to hide it  
and 15000 to the right to show.  
So if you click on your browser or game it hide the icons.
to show them you just go on the desktop and dobbleclick another time.
