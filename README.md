# ClimaApp

 Clima App provided by Angela from *iOS 13 & Swift 5 - The Complete iOS App Development Bootcamp* from Udemy.
 Angela is iOS swift teacher that teaches people app development with Swift programing language.
 
 link to the Udemy course : https://www.udemy.com/course/ios-13-app-development-bootcamp/
 
 About the app :
 
 Clima app is an application for getting the current weather from places around the world.
 
 in Clima app we are using an API provided by OpenWeatherMap.org.
 
 ScreenShots:
 
 <img src=screenShots/climaLightMode.png width=200px> <img src=screenShots/climaDarkMode.png width=200px>
 
Clima shows the current temperature of a searched place and the type of weather.

we can search for a place by typing the places name on the search text field located in the upper side of the screen, and by clicking on the search button next to it from right side, or tapping on the Done button on the keyboard we can start the search.

the request with the location name sent to the api, and the api gives back data.

we parse the data to a parsing object we created only for that, and than making a weatherModel from it, witch we sending back to the controller to update the user interface. all of that by using delegate.

we setting the temperature and formatted string with 1 number after floating point.
showing the weather condition using the api's conditionID, and sweaching it with the right system image name.
showing the right places name we got from the api as well.

the app is light/dark mode responding.

by tapping on the location button, from the left side of the search field, we get the weather of our current location by the same proccess as explained above.
