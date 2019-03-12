// 商品路由文件
const express = require('express')
const router = express.Router()
const pool = require('../pool')

// 获取所有商品
router.get('/allProduct', (req, res) => {
  var sql = 'SELECT *FROM perfect_product'
  pool.query(sql, (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      res.send({code: 1, data: result})
    } else {
      res.send({code: -1})
    }
  })
})

// 获取指定id商品
router.get('/product', (req, res) => {
  var pid = req.query.pid
  var sql = 'SELECT *FROM perfect_product WHERE pid = ?'
  pool.query(sql, [pid], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      res.send({code: 1, data: result})
    } else {
      res.send({code: -1})
    }
  })
})

// 获取指定商品所属类别
router.get('/productClass', (req, res) => {
  var cid = req.query.cid
  var sql = 'SELECT *FROM product_class WHERE cid = ?'
  pool.query(sql, [cid], (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      res.send({code: 1, data: result})
    } else {
      res.send({code: -1})
    }
  })
})

// 获取banner商品
router.get('/banner', (req, res) => {
  var sql = 'SELECT *FROM banner'
  pool.query(sql, (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      res.send({code: 1, data: result})
    } else {
      res.send({code: -1})
    }
  })
})

// 获取首页楼层商品
router.get('/indexFloor', (req, res) => {
  var indexFloor = ''
  var floorBanner = {
    f1Banner: [],
    f2Banner: [],
    f3Banner: [],
    f4Banner: [],
    f5Banner: []
  }
  var floorProduct = {
    f1Product: [],
    f2Product: [],
    f3Product: [],
    f4Product: [],
    f5Product: []
  }
  var sql = 'SELECT * FROM index_floor'
  pool.query(sql, (err, result) => {
    if (err) throw err
    if (result.length > 0) {
      indexFloor = result
      var sql = 'SELECT * FROM floor_banner'
      pool.query(sql, (err, result) => {
        if (err) throw err
        if (result.length > 0) {
          for (var i = 0; i < result.length; i++) {
            if (result[i].cid === 1) {
              floorBanner.f1Banner.push(result[i])
            } else if (result[i].cid === 2) {
              floorBanner.f2Banner.push(result[i])
            } else if (result[i].cid === 3) {
              floorBanner.f3Banner.push(result[i])
            } else if (result[i].cid === 4) {
              floorBanner.f4Banner.push(result[i])
            } else {
              floorBanner.f5Banner.push(result[i])
            }
          }
          indexFloor[0].fBanner = floorBanner.f1Banner
          indexFloor[1].fBanner = floorBanner.f2Banner
          indexFloor[2].fBanner = floorBanner.f3Banner
          indexFloor[3].fBanner = floorBanner.f4Banner
          indexFloor[4].fBanner = floorBanner.f5Banner
        }
        var sql = 'SELECT * FROM perfect_product'
        pool.query(sql, (err, result) => {
          if (err) throw err
          if (result.length > 0) {
            for (let i = 0; i < result.length; i++) {
              if (result[i].cid === '1' && floorProduct.f1Product.length < 6) {
                floorProduct.f1Product.push(result[i])
              } else if (result[i].cid === '2' && floorProduct.f2Product.length < 6) {
                floorProduct.f2Product.push(result[i])
              } else if (result[i].cid === '3' && floorProduct.f3Product.length < 6) {
                floorProduct.f3Product.push(result[i])
              } else if (result[i].cid === '4' && floorProduct.f4Product.length < 6) {
                floorProduct.f4Product.push(result[i])
              } else if (result[i].cid === '5' && floorProduct.f5Product.length < 6) {
                floorProduct.f5Product.push(result[i])
              }
            }
            indexFloor[0].fProduct = floorProduct.f1Product
            indexFloor[1].fProduct = floorProduct.f2Product
            indexFloor[2].fProduct = floorProduct.f3Product
            indexFloor[3].fProduct = floorProduct.f4Product
            indexFloor[4].fProduct = floorProduct.f5Product
          }
          res.send({code: 1, data: indexFloor})
        })
      })
    } else {
      res.send({code: -1})
    }
  })
})

// 导出路由文件
module.exports = router
