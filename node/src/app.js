const express = require('express');
const app = express();
const routes = require('./routes');
const cors = require('cors');
const cookieParser = require('cookie-parser')
const http = require('http').createServer(app);
const exceptionHandler = require('./middlewares/exception-handler.middleware');
const initSocket = require('./services/socket.service');
require('dotenv').config();

app.use(cors({
  credentials: true,
  origin: true,
}));

app.use(express.json());
app.use(cookieParser());

app.use(exceptionHandler);

for (const [key, value] of Object.entries(routes)) {
  app.use(`/api/${key}`, value);
}

initSocket(http);

http.listen(process.env.PORT, function () {
  console.log(`Example app listening on port ${process.env.PORT}!`);
});