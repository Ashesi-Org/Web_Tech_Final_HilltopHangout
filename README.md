Description of System
Hilltop Hangout is a social media Web App for Ashesi University students developed using a REST API for the backend, Flutter for the front end, and Google's Firestore for the database. The main functionalities of the system are that:
 A user can: 
- Register with their details
- Login with their student id and email, which is checked in the firebase
- View their profile
- Edit their profile
- Search for other users
- View the profile of others
- Post a comment on the platform 
- View a feed of other comments people have made
The system can:
- Validate input to ensure that users don't leave fields empty when registering, logging in, or making a comment
- Make real-time updates to the feed when a new post is made
- Send automatic emails to registered users when a new post is made
Using the API, a GET request is used to view the profile of others, POST requests are used to create users and make comments, and a PUT request is used to edit a user's profile. Every other functionality is implemented using Serverless architecture.


How to test the system
- Put the Flutter web app link into any browser of your choice.
- The first page is the Home page, where you can choose to log in or sign up, but it is recommended that you sign up first when testing because the register page redirects to the login page after a successful registration.
- A successful login leads to the feed page 
- On the feed page, a user can make a comment, view a feed of comments, view their profile, view the profile of others and search for a user.
- A user makes a post by inserting their email and what they want to comment on. Then the post is added to the feed in real time, and an email notification is sent to all users about the new post.
- If a logged-in user views their profile, they can edit its details and view a feed of all the posts they have made.

Deployed flutter link: https://web-tech-final-383311.web.app
