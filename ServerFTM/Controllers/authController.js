const User = require("../Models/User");
const RfToken = require("../Models/Token")
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const Token = require("../Models/Token");

const authController = {
    //REGISTER:
    register: async (req,res) => {
        try {
            const salt = await bcrypt.genSalt(10);
            const hash = await bcrypt.hash(req.body.password, salt);

            const newUser = await User({
                username: req.body.username,
                email: req.body.email,
                password: hash
            });
        
            const user = await newUser.save()
            const {password, ...others} = user._doc
            res.status(200).json({message: {...others}})

        } catch (error) {
            res.status(500).json({message: "Failed to Register : " + error});
        }
    },
    //LOGIN:
    login: async (req,res) => {
        try {
            const user = await User.findOne({username: req.body.username});
            if(!user) {
                res.status(404).json({message: "Wrong username! ",user: "", token: ""});
            }
            // const hash = user.password
            else {
                console.log("Hello")
                const comPass = await bcrypt.compare(req.body.password, user.password);
                if(!comPass) {
                    res.status(404).json({message: "Wrong password!",user: "", token: ""});
                }
                if(user && comPass) {
                    const userData = {
                        idUser: user._id,
                        username: user.username,
                        email: user.email,
                        admin: user.admin
                    }
                    const token = authController.creNewToken(userData);
                    const rfToken = authController.creNewRefreshToken(userData);

                    const dataRfToken = await RfToken({
                        rfToken: rfToken,
                        userID: user._id,
                        admin: user.admin
                    });
                    const saveRfToken = await dataRfToken.save()
                    const {password, ...others} = user._doc;

                    res.cookie("refreshToken", rfToken, {
                        httpOnly: true,
                        secure: false,
                        path: "/",
                        sameSite: "strict"
                    })

                    res.status(200).json({message: "Login Succesfully!",user: {...others},token: token});
                }
            }
        } catch (error) {
            console.log("Error here: ",error)
            res.status(500).json({message:"Failed to Login: " + error})
        }
        
    },
    //CREATE TOKEN:
    creNewToken: (userData) => {
        const key = process.env.SECRET_KEY
        const token = jwt.sign(userData, key, { expiresIn: 12000 });
        return token
    },
    //CREATE REFRESH TOKEN:
    creNewRefreshToken: (userData) => {
        const key = process.env.SECRET_RFKEY
        const rftoken = jwt.sign(userData, key, { expiresIn: 30000 });
        return rftoken
    },
    //GENERATE TOKEN AND RFTOKEN:
    genNewTokens: async (req,res) => {
        const rfToken = req.cookies.refreshToken
        try {
            const comToken = await Token.findOne({rfToken: rfToken})
            if(!comToken) {
                res.status(403).json({message: "Failed to find rfToken on Database!"});
            } else {
                jwt.verify(rfToken, process.env.SECRET_RFKEY, (err, veryfyData) => {
                    if(err) {
                        res.status(403).json({message: err});
                    } else {
                        const payloadData = {
                            idUser: veryfyData.idUser,
                            username: veryfyData.username,
                            email: veryfyData.email,
                            admin: veryfyData.admin
                        }
                        const newToken = authController.creNewToken(payloadData)
                        const newRfToken = authController.creNewRefreshToken(payloadData)
                        res.cookie("refreshToken", newRfToken, {
                            httpOnly: true,
                            secure: false,
                            path: "/",
                            sameSite: "strict",
                        });
                        Token.findOneAndUpdate({rfToken: rfToken}, {rfToken: newRfToken}, {new: true}, (err, datanewToken) => {
                            if(err) {
                                res.status(403).json({message: err});
                            } else {
                                res.status(200).json({message: newToken});
                            }
                        });

                    }
                });
            }
        } catch (error) {
            res.status(500).json({message: "Failed to gen newToken!" + error});
        }
    },
    //LOGOUT:
    logOut: async(req,res) => {
        res.clearCookie("refreshToken");
        Token.findOneAndDelete({rfToken: req.cookies.refreshToken}, (err) => {
            if(err) {
                res.status(403).json({message: err});
            } else {
                res.status(200).json({message: "LogOut is ok!"});
            }
        });
        
    }
}

module.exports = authController

