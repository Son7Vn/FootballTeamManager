const User = require("../Models/User");
const multer = require("multer");
const userControllers = {
    //FETCH ALL USERS:
    readAll: async (req,res) => {
        try {
            const allUser = await User.find()
            console.log("Hello")
            if (allUser) {
                res.status(200).json({message: allUser})
            }
        } catch (error) {
            res.status(500).json({message:"Failed to readAll: " + error})
        }
    },
    deleteUser: async(req,res) => {
        try {
            const findUser = await User.findById(req.body.id);
            res.status(200).json({message: "Delete is ok!"})
        } catch (error) {
            res.status(500).json(error);
        }
    },
    uploadIMG: async(req,res) => {
        const storage = multer.diskStorage({
            destination: function(req, file, cb){
                cb(null, "public/upload/avatar")
            },
            filename: function(req, file, cb) {
                const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
                cb(null, file.fieldname + '-' + uniqueSuffix + file.originalname);
            }
        });
        const myFileFilter = function(req, file, cb){
            console.log(file);
            const myMimeType = file.mimetype;
            const condistionMineType = myMimeType == "image/png" || myMimeType == "image/jpeg" || myMimeType == "image/jpg"
            if (condistionMineType) {
                cb(null, true)
            } else {
                return cb(new Error('Only image are allowed!'));
            }
        }
        const upload = multer({
            storage: storage,
            fileFilter: myFileFilter
        }).single("avatar");
        
        upload(req, res, function(err){
            if( err instanceof multer.MulterError) {
                console.log("A Multer error occurred when uploading: ", err);
            } else if(err) {
                console.log("Error upload: ", err)
            }
            console.log(req.file)
            res.status(200).json({message: req.file.filename})
        });
    }
};
module.exports = userControllers;