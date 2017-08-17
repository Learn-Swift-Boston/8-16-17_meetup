# 8-16-17 meet-up: All Level Breakout

Zev helped out by covering some of the basics and essentials. He taught some of us, before we got started, about networking code and how closures can be helpful. He then helped explain variables, data types, and some of the ways you can manipulate them.

Joe helped with some of the more specific questions and topics in some 1 on 1 help and guidance.

Matt showed the power of using server-side Swift, such as [Perfect](http://perfect.org/), to build and test your application (code included here). To try it for yourself, either clone this repo with Git or download the project and unpack the zip file.

You'll need to do the following in a terminal:
```
cd path/to/the/project/server
swift package generate-xcodeproj
```
Where `path/to/the/project` is the location of this code. Executing this should create the server project for you. Open the project file, and run it. If everything worked, you should be able to hit `localhost:8080/schedule` in a browser (such as Chrome or Safari) and see a JSON payload.

Next you'll need to setup the App by executing the following:

```
cd path/to/the/project/MeetupApp
pod install
```
Where `path/to/the/project` is the location of this code. If you've never used [Cocoapods](https://guides.cocoapods.org/using/getting-started.html) before, you'll need to run `sudo gem install cocoapods` before executing `pod install`. Open the `xcworkspace` file and run the app. You should be able to see the schedule for this meet-up.
