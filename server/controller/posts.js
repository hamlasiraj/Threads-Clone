const { default: mongoose } = require('mongoose');
const POSTS = require('../module/posts');
const USERS = require('../module/users'); //call the schema

module.exports = {

    getPofilePosts : async(req,res,next)=> {
      const userId = req.params.id;
      let userPosts;
      try {
         userPosts = await USERS.findById(userId).populate("user_posts");
      } catch (error) {
         console.log(`smthin went wrong faggy => ${error}`);
      }
      if (!userPosts) {
         return res.status(404).json({message: "this user have no posts faggy"})
      }
      return res.status(200).json({userPosts})


    },

    postPosts : async (req,res,next)=>{
      let {username,desc,img} = req.body;
      let existingUser;

      try {
         existingUser = await USERS.findById(username);
      } catch (error) {
         console.log(`bruuuuuuuh => ${error}`)
      }
      if (!existingUser) {
         return res.status(404).json({message : "faggy not found"});
      }
         const post = new POSTS({
            post_username : username,
            post_desc : desc,
            post_img : img,
         });
         try {
            const session =await mongoose.startSession(); // start new session 
            session.startTransaction(); // start transaction of the post to the user
            await post.save({session}); // saving the post data 
          
            existingUser.user_posts.push(post);  //push the post to the user
            await existingUser.save({session}); //save the new data that have been send to the user
            await session.commitTransaction(); //if everythin was good then commit it
         } catch (error) {
            console.log(`bruh smthing went wrong => ${error}`);
            return res.status(500).json({message : `${error}`});
         }
         return res.status(200).json({message : post});

    },



    updatePost : async(req,res,next)=> {
      let postId = req.params.id;
      let {desc,img} = req.body; //obligatory to use curl br {}
      let post;
      try {
       
         post = await POSTS.findByIdAndUpdate(postId,{
            post_desc : desc,
            post_img : img
         });// problem here
         console.log(post)
      } catch (error) {
         console.log(`smthin went wrong faggy => ${error}`);
      }
      if (!post) {
         return res.status(404).json({message: "there's no such post faggy"})
      }
      return res.status(200).json({post: post})


    },



    getPostById : async(req,res,next)=> {
      let postId = req.params.id; //obligatory to use curl br {}
      let posts;
      try {
         posts = await POSTS.findById(postId);// problem here
      } catch (error) {
         console.log(`smthin went wrong faggy => ${error}`);
      }
      if (!posts) {
         return res.status(404).json({message: "there's no posts faggy"})
      }
      return res.status(200).json({post: posts})

    },



    deletePost : async(req,res,next)=> {
      let postId = req.params.id; //obligatory to use curl br {}
      let post;
      try {
         post = await POSTS.findByIdAndRemove(postId).populate('post_username');
         console.log(post);
         await post.post_username.user_posts.pull(post); // from the post to obj(post_username) to 
         //user_posts 
         await post.post_username.save();
      } catch (error) {
         console.log(`smthin went wrong faggy => ${error}`);
      }
      if (!post) {
         return res.status(404).json({message: "there's no posts faggy"})
      }
      return res.status(200).json({message: "deleted successfully"})


    },


      liked : async (req, res) => {
      let postId = req.params.id;
      let {userId} = req.body;
      let post;
      try {
      post = await POSTS.findById(postId);
      if (!post.likes.includes(userId)) {
         await post.updateOne({ $push: { post_likes: userId } });
         res.status(200).json("The post has been liked");
        } else {
          await post.updateOne({ $pull: { post_likes: userId } });
          res.status(200).json("The post has been disliked");
        }
      } catch (err) {
        res.status(500).json(err);
      }
    }
    
}

    



