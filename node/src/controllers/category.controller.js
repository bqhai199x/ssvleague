const categoryService = require('../services/category.service')

module.exports = {
  getCategory: async (req, res) => {
    const result = await categoryService.getCategory();
    return res.status(200).json({
        code: 200, status: 'success', data: result
    })
  }
}