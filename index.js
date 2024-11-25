require('dotenv').config();
const express = require('express');
const app = express();
const cors = require("cors");
const port = process.env.PORT
app.use(express.json());
app.use(cors());

const login = require("./routes/login");
app.use("/login", login);

app.listen(port, () => {
  console.log(`Neurofy API is running on port ${port}`);
});