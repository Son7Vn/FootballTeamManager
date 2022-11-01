const mongoose = require("mongoose");

const teamateSchema = new mongoose.Schema({

    ten: {
        type: String,
        required: true,
        minlength: 1
    },
    soao: {
        type: String,
        minlength: 1,
        unique: true,
        require: true
    },
    phone: {
        type: String,
        // minlength: 10,
        require: false,
        default: "defaut"
    },
    sizeao: {
        type: String,
        // minlength: 1,
        default: "defaut"
    },
    namsinh: {
        type: String,
        // minlength: 2,
        default: "defaut"
    },
    vitri: {
        type: String,
        // minlength: 2,
        default: "defaut"
    },
    bqt: {
        type: String,
        default: "0"
    }
},
{ timestamps: true }
);

module.exports = mongoose.model("Teamate", teamateSchema);