const middilewareControllers = require("../Controllers/middlewareControllers");
const teamateControllers = require("../Controllers/teamateControllers");
const teamFundControllers = require("../Controllers/teamFundControllers");

const teamateRouter = require("express").Router()

teamateRouter.get("/", (req,res) => {
    res.send("Teamate here")
})

teamateRouter.post("/add", middilewareControllers.verifyAdmin, teamateControllers.addTeamate)
teamateRouter.post("/update", middilewareControllers.verifyAdmin, teamateControllers.updateTeamate)
teamateRouter.post("/delete", middilewareControllers.verifyAdmin, teamateControllers.deleteTeamate)
teamateRouter.post("/findAll", middilewareControllers.verifyToken, teamateControllers.findAllTeamate)
teamateRouter.post("/findAll2", teamateControllers.findAllTeamate)

//TeamFund
teamateRouter.post("/addTeamFund", teamFundControllers.addTeamFund)
teamateRouter.post("/findAllTeamFund", teamFundControllers.findAllTeamFund)
teamateRouter.post("/updateMoneyTeamFund", teamFundControllers.updateMoneyTeamFund)
teamateRouter.post("/findAllTeamFundMonth", teamFundControllers.findAllTeamFundMonth)
teamateRouter.post("/addManyTFM",teamFundControllers.addManyTeamFund)
teamateRouter.post("/deleteTFM",teamFundControllers.deleteTFM)

module.exports = teamateRouter;