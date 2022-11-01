const express = require("express");
const app = express();
const server = require("http").Server(app);
const fs = require("fs")
const dotenv = require("dotenv")
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser")
const mongoose = require("mongoose")
//Fix loi cors tren trinh duyet.
const cors = require("cors")
//cho phep truy cap vao tat ca cac router tu domain khac. Hoac sdug nhu middileware de cho phep cu the 1 router.
app.use(cors());
app.use(express.static("public"));
app.use(cookieParser());
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json())
app.use(express.json());
app.set("view engine", "ejs");
app.set("views", "./views");

const authRoute = require("./Routers/auth.js");
const userRoute = require("./Routers/user");
const adminRouter = require("./Routers/admin");
const teamateRouter = require("./Routers/teamate")

//ROUTERS:
app.use("/auth",authRoute);
app.use("/user", userRoute);
app.use(adminRouter);
app.use("/teamate", teamateRouter)

dotenv.config();
// connect Mongoose:
     mongoose.connect(process.env.MONGOOSEDB_URL, function(err) {
        if(err) {
            console.log("Failed to connect mongoose: ", err);
        } else {
            console.log("Success to connect!")
        }
    });

server.listen(process.env.PORT || 3000, () => {console.log("Server start port 3000 ...")});