const express = require('express');
const bodyParser = require('body-parser');
// const travelRouter = require('./routes/travels');

const loginRouter = require('./routes/login.js');
const createRouter = require('./routes/create.js');
const getRouter = require('./routes/get.js');
const updateRouter = require('./routes/update.js');
const deleteRouter = require('./routes/delete.js');
const cors = require('cors');

// const multer = require('multer');
// const file = require('file');

// // set storage engine 
// const storage = multer.diskStorage({
//   destination: './public/uploads/',
//   filename: function(req, file, cb) {
//     cb(null, file.filename + '-' + Date.now() + path.extname(file.originalname));
//   }
// }); 

// // Init Upload
// export const upload = multer({
//   storage: storage
// }).array('reviewImage', 12);

const app = express();

app.get('/', (req, res) => {
  console.log('this is main page');
  res.send('this is main page');
});

// get static files with virtual url
app.use('/public/reviews', express.static('public/reviews'));
app.use('/public/profiles', express.static('public/profiles'));
app.use('/public/shared', express.static('public/shared'));

// handling cors
var rawBodyHandler = function (req, res, buf, encoding) {
  if (buf && buf.length) {
      req.rawBody = buf.toString(encoding || 'utf8');
      console.log('Raw body: ' + req.rawBody);
  }
}

app.use(cors());
app.options('*', cors());  // enable pre-flight

app.use(bodyParser.json({ verify: rawBodyHandler }));

app.use('/login', loginRouter);
app.use('/create', createRouter);
app.use('/get', getRouter);
app.use('/update', updateRouter);
app.use('/delete', deleteRouter);

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log('listening 5000');
});
