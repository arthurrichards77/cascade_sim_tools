# Flight Simulation with FlightGear

FlightGear is an open sourceflight simulator.  Full documentation can be found [here](http://wiki.flightgear.org/Main_Page).

## Installing

### Windows

*Warning!*  FlightGear is free software and supports itself in part by selling adverts on its web page.  The FlightGear Download page has ads all over it that look like Download buttons, and goodness only knows what they'll install.  Make sure you're hovering over a FlightGear or a SourceForge link before you click.

Visit the [Download page](https://www.flightgear.org/download/) and download the appropriate installer.  It's then a big download.

> On Windows 10, FlightGear seems extremely fussy about graphics.  It stubbornly didn't work for me despite much fiddling, until I updated the drivers for my graphics card.

### Ubuntu Linux

`sudo apt install flightgear` seems to work.  It won't get you the absolute latest version, but it seems to work just fine.

### Scenery

By default, FlightGear comes with just a patch of scenery in the US, so the UK appears as open sea.  Scenery for the world can be downloaded from [here](http://ns334561.ip-5-196-65.eu/~fgscenery/WS2.0/scenery-2.0.1.html) but to save time, I have copied the relevant tile W010N50 to [this location](https://uob-my.sharepoint.com/:u:/g/personal/aeagr_bristol_ac_uk/EbWEkNy1NH9CtYwP56243NYBqM8G4iwjUOvOcXntPvhnxA?e=pUgXVu).  This covers most of the UK including Llanbedr and all CASCADE universities.  Installing doesn't seem to work as the documents suggest, but I've found that it's OK just to unzip the folder (slow!) and then move (don't copy - that'll take forever) the contents (folders 'Buildings', 'Objects' etc) to your Fg scenery folder.

## Running

### Linux

FlightGear goes by the file name of `fgfs` and takes a substantial number of command line arguments to control everything from the aircraft and location to the weather.  Some example scripts are provided in this repository:

* Use `source run_bristol.sh` to start in a Grob G109 (provided) over Bristol.
> Note the need to configure lots of properties so you start moving, engine running, and autopilot set, else you just fall straight out of the sky!
* Use `source run_llanbedr.sh` to start in the default aircraft at Llanbedr, with multiplayer on if you set the server IP right.

### Windows

FlightGear launches with a start-up wizard in Windows, which enables most of the key settings to be customized and handles the trickier problem of locating the relevant files on Windows.  However, the command line is still supported, either by pasting into the customization box in the "settings" tab of the wizard, or by going straight to the fgfs executable yourself.  The two `.bat` file examples are the respective conversions of the two provided for Linux, although the newer version of FlightGear seems to want the multiplayer parameters differently and I've had to leave them out.

## Multi-agent Simulation

### Features

FlightGear provides a free multiplayer server to enable multiple instances of the simulator to join together in a shared environment.
* Pilots within a defined range can see each other's aircraft.  In the event that one pilot is flying an aircraft that the second pilot does not have installed, a cartoon rendition of an airframe is shown.
* In the map (Use Ctrl+M or `Equipment`>`Map`), check the `Traffic` box and other pilots' aircraft are shown.
* Pilots can send messages over a chat system - see `Multiplayer`>`Chat dialog`.
* By using the special Air Traffic Control pseudo-aircraft, (e.g. `--aircraft=atc` on the command line) you can simply observe other aircraft and participate as a controller rather than a pilot.

### How to use

Documentation can be found at (http://wiki.flightgear.org/Howto:Multiplayer).  See the `run_llanbedr.sh` script for an example.  Note that it is desirable to keep the update rates low.  10Hz works smoothly, but there are suggestions that even lower may work.  This needs testing.  Multiplayer options can be set at start-up through the command line or the start wizard, or they can be configured from inside the application via the `Multiplayer` menu.  Note that older versions of FlightGear restrict the in-app configuration to a standard list of servers, so the CASCADE server would need to be configured from the command line.  In newer versions, the wizard may need you to select `Custom Server` to enter the CASCADE server details.

The CASCADE server runs in the cloud using Amazon Web Services.  It uses standard settings but it does not run permanently and its IP address changes each time it is run - ask Arthur how and when to get on.

### Running a server

The `fgms` folder contains information on how to compile the server application and run it on AWS.