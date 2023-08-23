const mongoose = require('mongoose');

const posts = mongoose.Schema({
    post_username:{
        type: mongoose.Types.ObjectId,
        ref: "USERS",
        required : true
    },
    post_desc:{
        type: String,
        required : true
    },

    post_img: String,
    
    post_likes: {
        type: Array,
        default: [],
      },
    post_comments: {
        type: Array,
        default: [],
      },
    post_visibility: {
      type : Number,
      default : 1
    }, //1= true ///0 = false
      
},{timestamps:true}
);

module.exports = mongoose.model("POSTS",posts);