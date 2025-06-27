const express = require("express");
const cors = require("cors");
const app = express();
app.use(express.json());
app.use(cors());
app.get("/api/health", (req, res) => res.json({status: "ok"}));
app.listen(3001, () => console.log("Backend API running on port 3001"));
