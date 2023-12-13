const knex = require('../configs/knex')
const bcrypt = require('bcrypt');
const authMethod = require('../methods/auth.method');

const auth = {
  createUser: async (username, password) => {
    const hashPassword = bcrypt.hashSync(password, 10);
		const newUser = {
			username: username,
			password: hashPassword,
			date: new Date(Date.now()),
		};
    return await knex('account').insert(newUser);
  },

  getUser: async (username) => {
    return await knex('account').where({ username }).select();
  },

  login: async (username, password) => {
    const [ user ] = await auth.getUser(username);
    if (!user) throw new Error('Tài khoản không tồn tại!');
    const isPasswordValid = bcrypt.compareSync(password, user.password);
    if (!isPasswordValid) throw new Error('Mật khẩu không chính xác');
    const dataToAccessToken = {
      username: user.username,
      role: user.role
    };
    const accessToken = await authMethod.generateToken(dataToAccessToken);
    return { user, accessToken };
  },

  getMe: async (token) => {
    const data = await authMethod.verifyToken(token);
    if (data) {
      const accessToken = await authMethod.generateToken(data.payload);
      data.accessToken = accessToken;
    }
    return data;
  }
}

module.exports = auth;