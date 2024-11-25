require("dotenv").config();
const mysql2 = require("mysql2");

const connection = mysql2.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT,
});

connection.connect((error) => {
  if (error) {
    console.error("Error trying connect with the database:", error.message);
    return;
  }
  console.log("Database connection successfully");
});

module.exports = connection;