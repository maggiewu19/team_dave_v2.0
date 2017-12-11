# team_dave_v2.0

This remote control app is made for the 2017 [MIT PPAT](http://ppat.mit.edu/fall2017/index.html) Team Dave project. 
It is formatted for a 9.7-inch iPad, but should also work on other iPad versions.

## Setup

The .ipa file for installation can be found in the Installation folder.

Once installing the app, you **must** set the IP and Email in the app's settings (located on the Channel page). If you do not set the IP address, the app will attempt to send invalid requests.
The IP is the IP address of the wifi that the Arduino is running on. Email defines the email that will receive the new IP address
whenever the Arduino connects to a new wifi network.

You must also define your own preset channels on the preset page, as they are not initially set.

[Follow this link](https://github.com/jrp27/ppat-dave-arduino) for instructions on the TV/Arduino integration with this app.

## App Overview

This app consists of three pages: the preset page (`ViewController`), the channel page (`ChannelViewController`), and the change preset page (`ChangePresetViewController`). The channel page also contains settings, which opens a popup (`PopUpViewController`). The app opens up to the preset page, and the buttons at the top allow the user to navigate between pages. `APIManager` handles all the API calls in order for the app the communicate with the Arduino to control the TV.
