const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Express로 만든 백앤드 도커로 올려보자");
});

app.listen(8080, () => console.log("Server is running"));
