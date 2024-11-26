require('dotenv').config();
const express = require('express');
const app = express();
const cors = require("cors");
const port = process.env.PORT
app.use(express.json());
app.use(cors());

const login = require("./routes/login");
const questions = require("./routes/api/questions");

app.use("/login", login);
app.use("/questions", questions)

app.listen(port, () => {
  console.log(`Neurofy API is running on port ${port}`);
});