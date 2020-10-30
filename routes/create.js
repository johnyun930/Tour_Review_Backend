const express = require("express");
const app = express();
const mysqlConnection = require('../connection.js');
const cloudinary = require('../cloudinary');
const upload = require('../multer');
const fs = require("fs");

//create user
app.post('/user',(req,res) =>{
    const data = req.body;
    const queryString = 'INSERT INTO siteUser VALUES (?,?,?,?,?,?,?,?,?)';
    var params = [data.userId,data.username,data.password,data.photo,data.profile,
                data.firstName,data.lastName,data.email,data.phoneNum];  
    mysqlConnection.query(queryString,params,(err,result)=>{
        if(err){
          console.log(err);
          res.send(err);
        }else{
          console.log("create user success")
          res.send(result);
        //   res.redirect('/');
        }
    })
});
 
//create administer
app.post('/admin',(req,res) =>{
    const data = req.body;
    const queryString = 'INSERT INTO admin VALUES (?,?,?)';
    var params = [data.adminId,data.adminname,data.adminpassword];  
    mysqlConnection.query(queryString,params,(err,result)=>{
        if(err){
            console.log(err);
        }else{
            console.log("create admin success")
            // res.redirect('/');
        }
    })
});
  
app.use('/upload-images/:reviewId', upload.array('image'), async (req, res) => {
  const queryString = 'INSERT INTO reviewimage (urlPath, reviewId) VALUES ?';
  const uploader = async (path) => await cloudinary.uploads(path, 'Images');
  const reviewId = parseInt(req.params.reviewId, 10);
  if (req.method === 'POST') {
    const urls = []
    const files = req.files;
    for (const file of files) {
      const { path } = file;
      const newPath = await uploader(path)
      urls.push(newPath)
      fs.unlinkSync(path)
    }
    const params = urls.map(({ url }) => { 
        const stringUrl = "'" + url + "'";
        return stringUrl;
    })
    mysqlConnection.query(queryString,[urls.map(({url}) => [url, reviewId])], (err, result, fields) => {
      if(err){
      console.log(err);
      } else {
          console.log("succeed to post review", result);
          res.status(200).json({
            message: 'images uploaded successfully',
            data: urls
          })
      }
    })
  } else {
    res.status(405).json({
      err: `${req.method} method not allowed`
    })
  }
})

//createReview 
app.post('/review', (req, res) => {
    const queryString = 'insert into review values (?,?,?,?,?,?,?)';
    const data = req.body;
    var params = [data.reviewId,data.createdDate,data.reviewDescription,
                data.rating,data.userId,data.locationId,data.title];
    mysqlConnection.query(queryString,params, (err, result, fields) => {
        if(err){
        console.log(err);
        } else {
            console.log("succeed to post review", result);
            // updateReviewPhotos();
            res.status(200).send(result.insertId.toString());
        }
    })
});

//"userID":"john123","createdDate":"09/01/19","comment":"you so good","reviewId":"1"
//Create Comment 
app.post('/comment', (req, res) => {
    const queryString = 'insert into comment values (?,?,?,?,?)';
    const data = req.body;
    var params = [data.commentId,data.userId,data.createdDate,data.comment,data.reviewId];
    mysqlConnection.query(queryString,params, (err, result, fields) => {
        if(err){
        console.log(err);
        } else {
        console.log("succeed to post comment");
        res.send(result);
        // res.redirect('/');
        }
    })
});
  
//Create Location 
app.post('/location', (req, res) => {
    const queryString = 'insert into location values (?,?,?,?)';
    const data = req.body;
    var params = [data.locationId,data.name,data.country,data.description];
    mysqlConnection.query(queryString,params, (err, result, fields) => {
        if(err){
        console.log(err);
        } else {
        console.log("succeed to set location");
        res.send(result);
        // res.redirect('/');
        }
    })
});

module.exports = app;
  