const authService = require('../services/auth.service');

module.exports = {
  register: async (req, res) => {
    try {
      const username = req.body.username.toLowerCase();
      const password = req.body.password;
      const user = await authService.getUser(username);
      if (user.length > 0) {
        return res.status(409).json({
          status: 'conflict',
          message: 'Tên tài khoản đã tồn tại'
        });
      } else {
        const createUser = await authService.createUser(username, password);
        if (createUser.length == 0) throw new Error();
        return res.status(200).json({
          status: 'success'
        });
      }
    } catch (e) {
      console.error(e);
      return res.status(500).json({
        status: 'error',
        message: 'Có lỗi trong quá trình tạo tài khoản, vui lòng thử lại.'
      });
    }
  },

  login: async (req, res) => {
    try {
      const username = req.body.username.toLowerCase();
      const password = req.body.password;
      const { user, accessToken }  = await authService.login(username, password);
      res.cookie('Author_Token', accessToken);
      return res.status(200).json({
        status: 'success',
        data: {
          username: user.username,
          role: user.role,
          accessToken
        }
      });
    } catch (e) {
      console.error(e);
      return res.status(500).json({
        status: 'error',
        message: 'Có lỗi trong quá trình đăng nhập, vui lòng thử lại.'
      });
    }
  },

  getMe: async (req, res) => {
    try {
      const token = await authService.getMe(req.cookies.Author_Token);
      return res.status(200).json({
        status: 'success',
        data: token.payload
      });
    } catch (e) {
      console.error(e);
      return res.status(401).json({
        status: 'error',
        message: 'Có lỗi trong quá trình đăng nhập, vui lòng thử lại.'
      });
    }
  },

  logout: async (req, res) => {
    res.clearCookie('Author_Token');
    res.end();
  }
};