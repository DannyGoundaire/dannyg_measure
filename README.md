# dannyg_measure
![image](https://i.ibb.co/FLkfCZR5/measuringtape.png)


A script designed to measure distances between two points.

[Preview](https://www.youtube.com/watch?v=E5-v6d8zHRA)
# But, why tho?

I wanted to make realistic blueprints for my server. So, after countless hours of looking through the interwebs and nothing to show for it, I've decided
to take matters into my own hands and code something myself. Now I can make realistic blueprints for shops, houses and apartments for my users :)

# Attention! 

This is my first release and my first script for ESX, so it might not be for everyone!
The Code is written in German, but you'll find translating bookmarks a little further down ;)

# Features
* Item-Based measuring system (so no permissions needed!)
* Two-Point measuring system (you can measure the distance between left and right and up and down)
* Open Source Code

# How to use
* Use the item in your Inventory, you'll enter the "measure mode"
* Go to the point where you want to start the measurement and press "E"
* Go to the endpoint and press "E"
* Now you can see the measurement in meters
* Use the item again to exit the "measure mode"

The text is visible for 20 seconds or until you exit the "measure mode"

# Your rights as a user
Since this Code is written in German, you are allowed to edit it BUT NOT redistribute it!

# Dependencies
* es_extended 1.2 or higher
* ox_inventoy (i guess optional since ox_inventory is never really called)

# Installation
* Download the Script
* rename the folder "dannyg_measure" if necessary
* Drag and Drop it into your "resources" folder
* Add "ensure dannyg_measure" to your "server.cfg"
* Add an Item named "measuringtape" to your inventory 
* Restart your server!

ox_inventory item data 
````
["measuringtape"] = {
          label = "Measuringtape",
          weight = 250,
          stack = false,
          close = true
},
````

# Code Editing Bookmarks
* If you want to change the needed item go to server.lua:3 and change 'measuringtape' to 'your_item_name'

* If you want to change the measure location set key go to client.lua:28. It is now set to "E" (number code "38")

* If you want to change the time the measurement is displayed for, go to client.lua:38. It is now set to 20 seconds (20000 miliseconds)

# Translating Bookmarks
Honestly i could've uploaded an english version of the code but meh xD Anyways her ya go:

* client.lua:10 -> ❌ Maßband deaktiviert. -> ❌ Measuretape deactivated.
* client.lua:16 -> 📏 Maßband aktiviert. Drücke [E], um Punkt 1 und Punkt 2 zu setzen. -> 📏 Measuretape activated. Press [E], to set Point A and Point B.
* client.lua:32 -> 📍 Punkt 1 gesetzt. -> 📍 Point A set.
* client.lua:35 -> 📍 Punkt 2 gesetzt. -> 📍 Point B set.
* client.lua:54 -> 📐 %.2f Meter -> 📐 %.2f meters

# I think that's it!
Good luck and have fun!
