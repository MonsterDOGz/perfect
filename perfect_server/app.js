// 引入第三方模块
const express = require('express');
const app = express();
const bodyParser = require('body-parser');
// const userRouter = require('./routers/user');
const productRouter = require('./routers/product');

// 监听5656窗口
app.listen(5656,(err)=>{
  if(err) throw err;
  console.log('5656号已启动...');
});

// 使用bodyparser解析post请求
app.use(bodyParser.urlencoded({
  // 不使用第三方扩展
  extended: false
}));

// 挂载文件
app.use(express.static('public'));

// 挂载路由
// app.use('/user',userRouter);
app.use('/product',productRouter);