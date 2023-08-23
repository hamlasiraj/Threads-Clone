const USERS = require("../module/users");
const bcrypt = require('bcryptjs');

module.exports = {

  //register------------------------------------------------------------------
    signup : async(req,res,next)=>{
    const {name,email,password} = req.body;

    let existingUser;
    try {
        existingUser = await USERS.findOne({"user_email" : email});
       
    } catch (error) {
        return console.log(`yooo negger you can't => ${error}`);
    }
    if (existingUser) {
        return res.status(400).json({message: "negger you already have an account"})
    }

    const hashedPass = bcrypt.hashSync(password); //hash the password

    const user = new USERS({
        user_username : name,
        user_email : email,
        user_password : hashedPass,
        user_posts : [],
    });

    try {
       await user.save();
    } catch (error) {
       return console.log(`bruh smthing went wrong => ${error}`)
    }
    return res.status(200).json({user})
},



  //login------------------------------------------------------------------------
    login : async(req,res,next) => {
        const {email, password} = req.body;

        let existingUser;
        try {
            existingUser = await USERS.findOne({"user_email" : email});
        } catch (error) {
            return console.log(`yooo negger you can't => ${error}`);
        }
        if (!existingUser) {
            return res.status(404).json({message: "negger you need to create an account"})
        }
  
        const isPasswordCorrect = bcrypt.compareSync(password,existingUser.user_password);

        if (!isPasswordCorrect) {
            return res.status(400).json({message : "dambass your password is wrong"})
        }
        return res.status(200).json({message: "you're goddamn right"})
    },



  updateUser :  async (req, res) => {
      
    let userId = req.params.id;
    let {username, name, password, desc, photo} = req.body;
    let user;

    if (password) {
        try {
        password = bcrypt.hashSync(password);
        } catch (err) {
          return res.status(500).json(err);
        }
    }
    try {
        user = await USERS.findByIdAndUpdate(userId, {
            user_password : password,
            user_username : username,
            user_name : name,
            user_desc : desc,
            user_avatar : photo
        });
        res.status(200).json("Account has been updated");
    } catch (error) {
        console.log("smthn went wrong => "`${error}`);
    }    
},

//follow a user

    follow : async (req, res) => {
      let {receiverId} = req.body;
      let userId = userId;
      let user, userReciever;
    if (receiverId !== userId) {
      try {
         user = await USERS.findById(userId);
         userReciever = await USERS.findById(receiverId);

        if (!user.user_followers.includes(receiverId)) {

          await user.updateOne({ $push: { user_followers: receiverId } });
          await userReciever.updateOne({ $push: { user_followings: userId } });
          
          res.status(200).json("user has been followed");
        } else {
          res.status(403).json("you allready follow this user");
        }
      } catch (err) {
        res.status(500).json(err);
      }
    } else {
      res.status(403).json("you cant follow yourself");
    }
  },


  
  //unfollow a user
  
    unfollow : async (req, res) => {
      let {receiverId} = req.body;
      let userId = userId;
      let user, userReciever;
    if (receiverId !== userId) {
      try {
        user = await USERS.findById(userId);
        userReciever = await USERS.findById(receiverId);
        if (user.followers.includes(receiverId)) {
          await user.updateOne({ $pull: { followers: receiverId } });
          await userReciever.updateOne({ $pull: { followings: userId } });
          res.status(200).json("user has been unfollowed");
        } else {
          res.status(403).json("you dont follow this user");
        }
      } catch (err) {
        res.status(500).json(err);
      }
    } else {
      res.status(403).json("you cant unfollow yourself");
    }
  }


}