const jwt = require('jsonwebtoken');
const promisify = require('util').promisify;
const sign = promisify(jwt.sign).bind(jwt);
const verify = promisify(jwt.verify).bind(jwt);

module.exports = {
  generateToken: async (payload) => {
    return await sign(
      { payload },
      process.env.ACCESS_TOKEN_SECRET,
      {
        algorithm: 'HS256',
        expiresIn: process.env.ACCESS_TOKEN_LIFE
      }
    );
  },

  verifyToken: async (token, config = null) => {
    try {
      return await verify(token, process.env.ACCESS_TOKEN_SECRET, config);
    } catch (error) {
      console.log(`Error in verify access token:  + ${error}`);
      return null;
    }
  }
}