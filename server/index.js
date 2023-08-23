const express = require('express'); // import in dart
const app = express(); // make an instance to use it 
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const path = require('path');

const usersRouter = require('./routes/users');
const postsRouter = require('./routes/posts');
const uploadRouter = require('./routes/upload');

const dbUrl = 'mongodb+srv://threads:threads@cluster0.v5yzihs.mongodb.net/Threads?retryWrites=true&w=majority'
const port = process.env.PORT || 3000;


mongoose.connect(dbUrl).then(()=>{
    console.log("Connection Successful!")
}).catch((e)=>{
    console.log(`Connection Failed! => ${e}`)
});

app.use([bodyParser.urlencoded({extended:true}),express.json()]);

app.use(express.static(path.join(__dirname,'images')))
app.use("/users",usersRouter);
app.use('/posts', postsRouter);
app.use('/upload', uploadRouter);




app.listen(port,"0.0.0.0",()=>{
    console.log(`Server started at ${port}`)
})

module.exports;