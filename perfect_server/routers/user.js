// 用户路由文件
const express = require('express');
const router = express.Router();
const pool = require('../pool');

// 用户登录
router.get('/login',(req,res)=>{
  var uphone = req.query.uphone;
  var upwd = req.query.upwd;
  var sql = 'SELECT *FROM perfect_user WHERE ? AND ?';
  pool.query(sql,[uphone,upwd],(err,result)=>{
    if(err) throw err;
    console.log(1)
    if(result.length>0){
      res.send({code:1,data:result});
    }else{
      res.send({code:-1});
    }
  });
});

// 导出路由文件
module.exports = router;
