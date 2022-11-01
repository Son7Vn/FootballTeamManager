const User = require("../Models/User");
const RfToken = require("../Models/Token");
const jwt = require("jsonwebtoken");

const middilewareControllers = {
    //AUTHOR:
    verifyToken: (req,res,next) => {
        jwt.verify(req.body.token, process.env.SECRET_KEY, (err, decode) => {
            if(err) {
                res.status(500).json({message: "Failed to verify token!" + err});
            } else {
                // console.log(decode)
                req.decode = decode;
                next();
            }
        });
    },
    //VERIFY TOKEN AND ADMIN:
    verifyTokenAndAdmin: (req,res,next) => {
        middilewareControllers.verifyToken(req,res, () => {
            const idUser = req.decode.idUser
            const admin = req.decode.admin
            if (idUser == req.body.id || admin === true) {
                next();
            } else {
                res.status(403).json({message: "You're not permision to denied!"});
            }
        });
    },
    verifyAdmin: (req,res,next) => {
        middilewareControllers.verifyToken(req, res, () => {
            const admin = req.decode.admin
            if (admin === true) {
                next();
            } else {
                res.status(403).json({message: "You're not permision!"});
            }
        })
    }
    
}

module.exports = middilewareControllers;