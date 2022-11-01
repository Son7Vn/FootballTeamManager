const mongoose = require("mongoose");

const rfTokenSchema = new mongoose.Schema({
    rfToken: {
        type: String,
        requied: true,
        unique: true
    },
    userID: {
        type: String,
        requied: true
    },
    admin: {
        type: Boolean,
        requied: true
    }
},{timestamp: true }
);
module.exports = mongoose.model("RfToken", rfTokenSchema);