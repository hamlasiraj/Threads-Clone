const mongoose = require('mongoose');


const users = mongoose.Schema({

    user_username:{
        type: String,
        required : true
    },
    user_name : {
        type: String,
        default : ""
    },
    user_email : {
        type: String,
        required: true,
        unique: true
    },
    user_password : {
        type: String,
        required:true,
        minlength: 8
    },
    user_posts : [{
        type: mongoose.Types.ObjectId,
        ref: 'POSTS',
        required:true,
    }],
    user_access : {
        type: Number, //1 = access //0 = blocked
        default: 1
    },
    user_avater: {
        type: String,
        default: "",
    },
    user_followers: {
        type: Array,
        default: [],
    },
    user_followings: {
        type: Array,
        default: [],
    },
    user_desc: {
        type: String,
        max: 50,
    },

},
{
    timestamps : true
}

);

module.exports = mongoose.model("USERS",users);