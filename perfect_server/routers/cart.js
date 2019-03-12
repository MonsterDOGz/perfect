// 购物车路由文件
const express = require('express')
const router = express.Router()
const pool = require('../pool')

// 购物车添加商品
router.get('/addProduct', (req, res) => {
  var uid = req.query.uid
  var pid = req.query.pid
  var pname = req.query.pname
  var style = req.query.style
  var price = req.query.price
  var pic = req.query.pic
  var num = req.query.num
  var stock = req.query.stock
  var sql = `INSERT INTO shopping_cart VALUES
  (?,?,?,?,?,?,?,?,?)`
  pool.query(sql, [null, uid, pid, pname, style, price, pic, num, stock], (err, result) => {
    if (err) throw err
    if (result.affectedRows > 0) {
      res.send({code: 1, data: result})
    } else {
      res.send({code: -1})
    }
  })
})

// 查询对应用户的购物车商品
router.get('/inquireCart', (req, res) => {
  var uid = req.query.uid
  var number = 0
  var price = 0
  var cartInfo = []
  var sql = `SELECT * FROM shopping_cart WHERE uid=?`
  pool.query(sql, [uid], (err, result) => {
    if (err) throw err
    for (var i = 0; i < result.length; i++) {
      number += result[i].num
      price += result[i].num * result[i].price
    }
    cartInfo[0] = result
    cartInfo[1] = number
    cartInfo[2] = price
    if (result.length > 0) {
      res.send({code: 1, data: cartInfo})
    } else {
      res.send({code: -1})
    }
  })
})

// 删除购物车商品
router.get('/delProduct', (req, res) => {
  var uid = req.query.uid
  var pid = req.query.pid
  var sql = `DELETE FROM shopping_cart WHERE uid=? AND pid=?`
  pool.query(sql, [uid, pid], (err, result) => {
    if (err) throw err
    if (result.affectedRows > 0) {
      res.send({code: 1, data: result})
    } else {
      res.send({code: -1})
    }
  })
})

// 导出路由文件
module.exports = router
