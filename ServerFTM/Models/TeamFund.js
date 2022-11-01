const mongoose = require("mongoose");
const uniqueValidator = require("mongoose-unique-validator")

const teamfundSchema = new mongoose.Schema({
    idTeamate: {
        type: String
    },
    ten: {
        type: String,
        minlength: 2,
        require: true
        
    },
    tien: {
        type: Number,
        default: 3
    },
    thang: {
        type: Number,
        require: true,
        minlength:1,
        min: 1,
        max: 12
    },
    nam: {
        type: Number,
        require: true,
        minlength: 4,
        maxlength:4,
        min: 2022
    },
    note: {
        type: String
    }

}, { timestamps: true });

teamfundSchema.plugin(uniqueValidator)

module.exports = mongoose.model("TeamFund", teamfundSchema);