const express = require('express');
const router = express.Router();

const {getPofilePosts, postPosts, updatePost,getPostById, deletePost, liked} = require("../controller/posts"); //functions


router.get('/profilePosts/:id',getPofilePosts); // user ID
router.post('/addPost',postPosts); // user ID
router.put('/updatePost/:id',updatePost); // post ID
router.get('/getPost/:id',getPostById);  // post ID
router.delete('/deletePost/:id',deletePost); //post id
router.put('/liked/:id',liked); //post id



module.exports = router;