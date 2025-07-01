# Buster Code Challenge

## Tech Stack Used

### **Back end**
- Ruby on Rails (ruby 3.2.3 + rails 7.2.2.1)
- Postgres
- RSpec (testing)

### **Front end**
- React.js
- Bootstrap

---

## App Demo
- To be updated once I host it

---

## Instructions on Running Locally

### 1. Clone the Repo
- git clone https://github.com/eijimine/gcs-code-challenge
- cd gcs-code-challenge

### 2. Set Ruby Version
- rbenv install 3.2.3
- rbenv local 3.2.3

### 3. Install Dependencies
- bundle install
- npm install
- Update .env file with valid google maps api key:
 - GOOGLE_MAPS_API_KEY=<your_google_maps_api_key>

### 4. Set Up DB
- bin/rails db:create
- bin/rails db:migrate
- bin/rails db:seed

### 5. Run App
- .bin/dev

### 6. Visit
- http://localhost:3000/companies

### 7. Run Tests
- bundle exec rspec

---

**My Challenge Solution**

Tech stack reasoning:

Ruby on Rails:
- Quick and easy implementation of CRUD Api endpoints, validations, database management and testing. Rails has always been great for quickly creating demo apps and proof of conecpts.

React.js / Bootstrap:
- Easy state management which and allows for a very quick and snappy user experience along with Bootsrap which allowed me to style the front end components without having to create a css file. The trade-offs here are that styling is limited when using only Bootstrap without adding custom css and React files especially in the state management section can get large and messy if not separated into smaller components.

App Design:
- The design is pretty straight forward: On load you will see a large map os the US spanning across the screen width with pins (with comapny names) placed based on their respective coordinates

- You may enter your own coordinates and radius below the map to filter companies by the entered data and radius. The map will zoom automatically to the set area based on the radius. This will also filter the table below and will only show the company that are within the given radious.
- *Full disclosure: This part was challenging and I DID NOT come up with the formula for this, I had to look up how to do it. It's called the Haversine formula https://stackoverflow.com/questions/14560999/using-the-haversine-formula-in-javascript

Table section:
- While it's possible to put all CRUD actions on one page, I thought having everything on the main page would get very messy both in the UI and in the code, so I decided to make a modal open when you perform any of the three actions (add, edit, delete).


Improvements:

Pagination + performance:
- Current the table displays ALL companies. If we had 10000 companies then our table would be way too long. I would implement pagination to show 25 or 50 companies at a time and allow users to click to the next page.
I would also implement back end pagination / limit, since querying 100000 companies would be bad for performance on each load. If all company data is absolutly required, maybe consider quyering it once then storing it in cache then serve the cached data.

Better / more error handling:
- I made sure errors were handled (say if you tried saving a number that's outside of the lat or lng), however, given more time I would have made the errors appear in the modals themselves and not on the main page.

File management:
- Given more time, I would have split the file Companies.jsx into smaller components as there are some sections which would make sense to be grouped together in a separate file. An example of that would be the inputs for the lat / lng / radius below the map can be part of the Map.jsx file.