const knex = require('../configs/knex')

module.exports = {
  getCategory: async () => {
    return await knex.select().from('category');
  }
}