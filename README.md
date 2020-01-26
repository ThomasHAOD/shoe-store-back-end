The server of this app uses PostgresSQL, Node.js and Express.js.

Please ensure you have PostgresSQL installed before continuing by entering `which psql` into your terminal.

Next create a database on your system: `createdb shoe_store`.

Next run the shoe_store.sql seed file: `psql -d shoe_store -f sql/shoe_store.sql`.

Next run `npm install`.

Finally run `nodemon server.js`.
