const authMethod = require('../methods/auth.method');
const { ROLES } = require('../helper/constant')

module.exports = {
  isAuth: (roles = []) => {
    if (typeof roles === 'number') {
        roles = [roles];
    }

    return async (req, res, next) => {
      const token = req.cookies.Author_Token;
      if (req.cookies.Author_Token) {
        const verified = await authMethod.verifyToken(token);
        if (verified.payload && (verified.payload.role == ROLES.ADMIN ||  roles.includes(verified.payload.role))) return next();
      }
      return res.status(401).json({
        status: 'Unauthorized',
        message: 'Xác thực không thành công!'
      });
    }
  }
};