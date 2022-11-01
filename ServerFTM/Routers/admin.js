
const routerAdmin = require("express").Router();

routerAdmin.get("/admin", function(req,res) {
    res.render("admin.ejs")
});

module.exports = routerAdmin;