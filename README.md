# CS361 Project Idea
Web application which  leverages advantages of web-scraping libraries to aid the user in aggregating prices of the product they wish to purchase online, avoiding the hassle of navigating through cluttered & bloated web pages. 

To install this Webapp:
1. Download source code from release 0.0-beta or clone this repository
2. Use 'sql/DDQ_DUMP.sql' to populate a mysql database with the necessary tables. This will also add some products with prices and urls.
3. Follow the instructions in dbcon.js and updater/dbcon.js to set up database connections.
4. (optional) 'npm run start-product-update' will run the script that updates product information. The api used to get the information limits free users to 100 calls per day. Therefore, one product will be updated approximately every 15 minutes.
5. 'npm run start' will start the express server on port 22222 or process.env.port
