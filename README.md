# Caltrack

### Where Every Bite Counts, Every Move Matters!

## Running the App
 * Open Android Studio
 * Open Caltrack flutter project
 * Connect to Android Emulator(Pixel_3s_API_34_extension_level_7)
 * Click run main.dart
 * Details to run key tasks are mentioned below

### Tasks
##### Logging in: use dummy values
  * Username: sarah02
  * Password: securePassword1

##### Edit Profile Page
* Edit firstname, lastname, username, password, confirm password, age, gender, height, and weight data 
* Click "Save" button once you finish updating the data
* Click the logout door icon button on the top right of the screen to logout
   
##### Dashboard Page (use select activity type dropdown to select which activity you want to enter)
* Entering food data:
  * Enter the name of the food item
  * Enter calories in food items contained

* Entering exercise data:
  * Select exercise type from dropdown
  * Enter duration
  * Enter age
  * Enter gender
  * Enter height
  * Enter weight

* Click the checkbox to "save to log" if you wish to add data to the log page
* Click the "Submit" button once you finish entering data

##### Log Page
* Enter a date to view calories stored in the log database for a specific date:
  * Data will be displayed under the "Results" title
  * Selected date will appear before the "Results" title

* Click the "View today" button:
  * Displays the data entered today

* If no data is entered for a specific day, then "No entries for the selected date" will be displayed
  

## Personas


## Software Architecture Diagram

https://www.figma.com/file/9NuEtMWUnp2JaiTvXS6eNY/CS1635-Deliverable-2?type=whiteboard&node-id=0%3A1&t=vmW9MQd8y7ItvkXV-1 


## Flutter Application Descriptions
* The Flutter application is a comprehensive calorie-tracking application that utilizes user-provided information. This application creates a profile for each user including age, gender, and weight with an individual log-in to save information. Users can then log their daily calorie intake by inputting which foods they have consumed and their associated calories. Additionally, they also have the option of logging exercise activities based on the activities's duration. The application also allows the user to look back at their calorie intake and daily exercise based on the date on the log page. This application was written in Flutter using Andriod Studio following a Model View View Model architecture. 

### Login and Signup
* When the user first opens the app they will directed to the Login page. If they do not already have a user profile account then they will have the option of creating one by clicking on the Signup link. Clicking on the link will redirect the user to the signup page. Once on the signup page, the user will input personal data. The data they will be asked to provide is their first name, last name, username, password, password confirmation, age, gender, height, and weight. Then the user should click the "register" button.
![Alt text](<img width="312" alt="Screen Shot 2023-12-13 at 2 33 08 PM" src="https://github.com/shresta-kalla/caltrack/assets/150719217/87057655-7058-48d8-8dea-837271449021">)
![Alt text](<img width="312" alt="Screen Shot 2023-12-13 at 2 33 08 PM" src="https://github.com/shresta-kalla/caltrack/assets/150719217/a89818cb-cd96-4c2a-843e-fa56c9372ec7">)



### Edit Profile Page
* The edit profile page should be utilized by the user if any of their profile information has changed. For example, if their weight, height, age, or gender needs adjustment. Additionally, this is the page that should also be utilized if the user wants to change their password. 

### Dashboard Page
* The dashboard page is used when the user wants to input their food intake or their exercise. If the user wants to enter information about their food intake, they would first choose their activity type as food. Then they would input the food they consumed and the corresponding calorie amount. Then if the user would like to keep the input for their log on the log page for that date they would check the "save calculation to log button". If the user would like to enter an exercise input, the user would clock the activity type as exercise. Then the user would choose their exercise type from the drop-down menu and how long they exercised for. The user would also have to input their updated height and weight information on the page as well. Then if they were interested in saving the exercise calculation to their permanent log, they would check the box to "save calculation to log". 

### Log Page


## Contributors

* Shresta Kalla
* Shreya Kalla
* Ashlyn Geevarghese



