const authController = require("../Controllers/authController");
const middilewareControllers = require("../Controllers/middlewareControllers")

const router = require("express").Router();

router.post("/verify", middilewareControllers.verifyToken, (req,res) => {
    res.status(200).json(req.decode)
})
router.post("/register",authController.register);
router.post("/login",authController.login);
router.post("/refreshTokens",authController.genNewTokens);
router.post("/logOut", middilewareControllers.verifyToken, authController.logOut);

module.exports = router;