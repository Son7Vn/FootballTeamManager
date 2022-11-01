const authController = require("../Controllers/authController");
const middilewareControllers = require("../Controllers/middlewareControllers");
const userControllers = require("../Controllers/userControllers");
const { route } = require("./auth");

const routerUser = require("express").Router()

routerUser.post("/read",middilewareControllers.verifyToken,userControllers.readAll);
routerUser.post("/delete",middilewareControllers.verifyTokenAndAdmin,userControllers.deleteUser);
routerUser.post("/upload",userControllers.uploadIMG);


module.exports = routerUser