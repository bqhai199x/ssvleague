const Unauthorized = require("../models/custom-exception.model");


const exceptionHandler = (req, res, next) => {
  try {
    return next();
  } catch (error) {
    if (error instanceof Unauthorized) {
      return res.status(error.statusCode).json({
        status: error.name,
        message: error.message
      });
    } else {
      console.error(error);
      return res.status(500).json({
        code: 500,
        status: 'Internal Server Error',
        message: 'Lỗi hệ thống'
      });
    }
  }
}

module.exports = exceptionHandler