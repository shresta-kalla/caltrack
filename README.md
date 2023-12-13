# Caltrack

### Where Every Bite Counts, Every Move Matters!

## Running the App
 * Open Android Studio
 * Open Caltrack flutter project
 * Click on 'Get Dependencies' to install packages
 * Connect to Android Emulator(Pixel_3s_API_34_extension_level_7)
 * Click run main.dart
 * Details to run key tasks are mentioned below

### Tasks
##### Logging in: Use Dummy Values
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
* Enter a date(format: YYYY-MM-DD) to view calories stored in the log database for a specific date:
  * Data will be displayed under the "Results" title
  * Selected date will appear before the "Results" title

* Click the "View today" button:
  * Displays the data entered today

* If no data is entered for a specific day, then "No entries for the selected date" will be displayed
  

## Personas

Persona 1: A male high school student named Kyle who is cutting weight for wrestling
* His motivation to use our app is to monitor his caloric deficit to drop into the weight class he would like. The application will also ensure Kyle’s coaches that he is losing weight in a healthy way based on the plan they determined together. Kyle will use this app by inputting the different foods he eats throughout the day as well as recording his exercise activity. At the weigh-in, the coaches will be able to check the log to see if Kyle's method of losing weight has worked and if it is safe. Need App can fulfill: This app fulfills Kyle’s need for an application that allows him to quickly and efficiently log his calorie intake between classes, while also tracking how many calories he is consuming throughout the day.

Persona 2: A 65-year-old man with high cholesterol named Gerard
* Gerard has  high cholesterol and has been told by his doctor to track his calories, food, and exercise. His doctor informed him that exercising can increase HDL cholesterol which is considered to be “good cholesterol” that helps you stay healthy. Gerard is a retiree who can navigate applications but struggles with technology overall. He wants an efficient way to track his exercise, food, and calorie intake. Gerard will utilize the Caltrack application by creating a profile and then recording every meal he has per day. This way when he returns to the doctor he can show a detailed list of what type of foods Gerard consumes. 

Persona 3: A 35-year-old man named Kevin on a weight loss journey
* Kevin works a 9-to-5 office job that demands long hours of sitting at a desk. He has struggled with his weight for most of his adult life and has recently decided to make a serious commitment to his health. Kevin is motivated to lose weight not only to improve his physical appearance but also to enhance his overall well-being and reduce the risk of health issues associated with obesity. He frequently checks his phone during short breaks throughout the day and due to his sedentary job, Kevin is conscious of the need to incorporate more physical activity into his day. Kevin will use this app to hold himself accountable for staying on his fitness journey by consuming healthy foods and working out on a healthy schedule. Kevin will enter all of his food intake and exercise into the log so he can analyze his weight loss with it. 

## Software Architecture Diagram

https://www.figma.com/file/9NuEtMWUnp2JaiTvXS6eNY/CS1635-Deliverable-2?type=whiteboard&node-id=0%3A1&t=vmW9MQd8y7ItvkXV-1 


## Flutter Application Descriptions
* The Flutter application is a comprehensive calorie-tracking application that utilizes user-provided information. This application creates a profile for each user including age, gender, and weight with an individual log-in to save information. Users can then log their daily calorie intake by inputting which foods they have consumed and their associated calories. Additionally, they also have the option of logging exercise activities based on the activities's duration. The application also allows the user to look back at their calorie intake and daily exercise based on the date on the log page. This application was written in Flutter using Andriod Studio following a Model View View Model architecture. 

### Login and Signup
* When the user first opens the app they will directed to the Login page. If they do not already have a user profile account then they will have the option of creating one by clicking on the Signup link. Clicking on the link will redirect the user to the signup page. Once on the signup page, the user will input personal data. The data they will be asked to provide is their first name, last name, username, password, password confirmation, age, gender, height, and weight. Then the user should click the "register" button.

<img width="313" alt="Screen Shot 2023-12-13 at 2 37 22 PM" src="https://github.com/shresta-kalla/caltrack/assets/150719217/e9871a0d-69a2-4a15-bdda-e0636e8b0afb">
<img width="312" alt="Screen Shot 2023-12-13 at 2 33 08 PM" src="https://github.com/shresta-kalla/caltrack/assets/150719217/a89818cb-cd96-4c2a-843e-fa56c9372ec7">

### Edit Profile Page
* The edit profile page should be utilized by the user if any of their profile information has changed. For example, if their weight, height, age, or gender needs adjustment. Additionally, this is the page that should also be utilized if the user wants to change their password.
  
<img width="322" alt="Screen Shot 2023-12-13 at 2 38 38 PM" src="https://github.com/shresta-kalla/caltrack/assets/150719217/1f51be11-3016-44ee-916d-556d39013acd">

### Dashboard Page
* The dashboard page is used when the user wants to input their food intake or their exercise. If the user wants to enter information about their food intake, they would first choose their activity type as food. Then they would input the food they consumed and the corresponding calorie amount. Then if the user would like to keep the input for their log on the log page for that date they would check the "save calculation to log button". If the user would like to enter an exercise input, the user would clock the activity type as exercise. Then the user would choose their exercise type from the drop-down menu and how long they exercised for. The user would also have to input their updated height and weight information on the page as well. Then if they were interested in saving the exercise calculation to their permanent log, they would check the box to "save calculation to log".
  
<img width="316" alt="Screen Shot 2023-12-13 at 2 38 59 PM" src="https://github.com/shresta-kalla/caltrack/assets/150719217/26470ec6-7482-4fed-978e-ebe198fb44b4">

### Log Page
* The log page allows the user to enter a specific date to retrieve & display their results at any given time. The user can enter a date and click "Enter" which displays the results for that specific date. The user can also click the "View Today" button to see the results for today. The results is a list of all exercise and food consumption recorded on said day. 

<img width="313" alt="Screen Shot 2023-12-13 at 2 39 18 PM" src="https://github.com/shresta-kalla/caltrack/assets/150719217/65a3408a-b2dd-4c82-a59e-d5432a45d7ce">

## Contributors

* Shresta Kalla
* Shreya Kalla
* Ashlyn Geevarghese



