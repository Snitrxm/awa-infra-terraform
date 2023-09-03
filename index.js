const express = require('express')

const app = express()

app.use(express.json())

app.get("/", (req, res) => {
  res.status(200).json({ message: "API RUNNING"})
})

app.listen(8080, () => {
  console.log("Server is running in port 8080")
})