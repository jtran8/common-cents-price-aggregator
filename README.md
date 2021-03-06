# Common Cents Price Aggregator
Web application which  leverages web-scraping libraries to aid the user in aggregating prices of the product they wish to purchase online, avoiding the hassle of navigating through cluttered & bloated web pages. 

## User Instructions
To run this app:
* Download source code from release 0.0-beta or clone this repository
* npm install
* Use 'sql/DDQ_DUMP.sql' to populate a mysql database with the necessary tables. This will also add some products with prices and urls.
* Follow the instructions in dbcon.js and updater/dbcon.js to set up database connections.
* (optional) 'npm run start-product-update' will run the script that updates product information. It works by screen-scraping various online retailers, with a random delay between 0 and 10 seconds between requests.
* 'npm run start' will start the express server on port 22222 or process.env.port

## System Overview
This app uses a NodeJS/Express backend to serve HTML pages styled with Bootstrap. Data is stored using a mysql/MariaDB database.

### Front End Details
The front end's core responsibilities are to allow the user to select a product they are interested in and then request the data from the back end API
* Utilizing a chained dropdown system to narrow the selection of products for a user
* Asynchronously fetch the data {image, prices, msrp} from the backend
* Display the data in a js generated html table
* Use event handlers to implement convenient tools for the user such as sorting by price, retailer or savings 

### Back End Details
The server has three main responsibilities:
* Serving the webpage and handling user interactions
* Periodically refreshing the url's and prices for each product
* Adding new products

#### Database Schema
![db schema](db_schema.png)

#### User-facing functions
This section of the back end handles routing and requests from the front end for information from the database which include:
* Returning all Categories
* Returning all Brands in a Category
* Returning all Products of a Brand in a Category
* Returning user relevant information including prices at retailers for a Product 

#### Refreshing products
This app pulls data from upcitemdb.com. Free users are limited to 100 calls per day, so the back end makes a call approximately every 15 minutes.

<img src="link_price_update.png" alt="alt text" height="700">

#### Adding new products
Talk about the script that updates products
