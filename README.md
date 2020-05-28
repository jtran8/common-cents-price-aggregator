# Common Cents Price Aggregator
Web application which  leverages web-scraping libraries to aid the user in aggregating prices of the product they wish to purchase online, avoiding the hassle of navigating through cluttered & bloated web pages. 

## User Instructions
To run this app:
* Download source code from release 0.0-beta or clone this repository
* npm install
* Use 'sql/DDQ_DUMP.sql' to populate a mysql database with the necessary tables. This will also add some products with prices and urls.
* Follow the instructions in dbcon.js and updater/dbcon.js to set up database connections.
* (optional) 'npm run start-product-update' will run the script that updates product information. The api used to get the information limits free users to 100 calls per day. Therefore, one product will be updated approximately every 15 minutes.
* 'npm run start' will start the express server on port 22222 or process.env.port

## System Overview
This app uses a NodeJS/Express backend to serve HTML pages styled with Bootstrap. Data is stored using a mysql/MariaDB database.

### Front End Details
*Talk about how the front end works*

### Back End Details
The server has three main responsibilities:
* Serving the webpage and handling user interactions
* Periodically refreshing the url's and prices for each product
* Adding new products

#### Database Schema
*Put a picture here*

#### User-facing functions
*Talk about what app.js does*

#### Refreshing products
This app pulls data from upcitemdb.com. Free users are limited to 100 calls per day, so the back end makes a call approximately every 15 minutes.

#### Adding new products
Talk about the script that updates products
