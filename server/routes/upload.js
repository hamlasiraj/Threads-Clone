const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path');
const {uploadfun} = require('../controller/upload')

const storage = multer.diskStorage({
    destination: (req,file,cb)=>{
        cb(null,path.join(__dirname,'../images')); //storage place
    },
    filename: (req,file,cb)=>{
        cb(null, new Date().toISOString().replace(/:/g , "-") + file.originalname); // file name from user
                //                        replace : bcz windows doesn't accept it with -
    }
});

const upload = multer({storage: storage})

router.post('/', upload.single('image') , uploadfun);


module.exports = router;