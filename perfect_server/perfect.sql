/*****/
set NAMES UTF8;
/*----判断数据库是否存在-----*/
DROP DATABASE IF EXISTS perfect;
CREATE DATABASE perfect CHARSET = UTF8;
USE perfect;

/*----------创建用户表----------*/
CREATE TABLE perfect_user (
  uid INT PRIMARY KEY AUTO_INCREMENT,              #用户id
  uname VARCHAR(16),                  #用户名称
  upwd VARCHAR(16),                   #用户密码
  uphone VARCHAR(32),                 #用户手机
  upic VARCHAR(128)                   #用户头像
);

/*----------创建商品表----------*/
CREATE TABLE perfect_product (
  pid INT PRIMARY KEY AUTO_INCREMENT,              #商品id
  pname VARCHAR(32),                  #商品名称
  label VARCHAR(64),                  #商品标签
  price VARCHAR(16),                  #商品价格
  style VARCHAR(16),                  #商品款式
  stock INT,                          #库存数量
  pcount INT,                         #已售数量
  pic VARCHAR(256),                   #图片路径
  introduce VARCHAR(512),             #商品介绍
  cid VARCHAR(16)                     #类别id
);

/*----------创建商品类别表----------*/
CREATE TABLE product_class (
  cid INT PRIMARY KEY AUTO_INCREMENT,              #商品类别id
  class VARCHAR(16)                   #商品类别 
);

/*----------创建首页banner表----------*/
CREATE TABLE banner (
  bid INT PRIMARY KEY AUTO_INCREMENT,              #banner图id
  bname VARCHAR(32),                  #图片路径
  pid INT                             #商品id
);

/*----------创建楼层banner表----------*/
CREATE TABLE floor_banner (
  fbid INT PRIMARY KEY AUTO_INCREMENT,              #楼层banner图id
  fbname VARCHAR(64),                  #图片路径
  pid INT,                            #商品id
  cid INT                             #商品类别id
);

/*----------创建首页楼层表----------*/
CREATE TABLE index_floor (
  fid INT PRIMARY KEY AUTO_INCREMENT,              #楼层id
  icon VARCHAR(128),                   #楼层图标路径
  fname VARCHAR(32),                  #楼层名称
  fpic VARCHAR(128),                   #楼层大图
  cid INT                             #类别id
);

/*----------创建评论表----------*/
CREATE TABLE comment (
  coid INT PRIMARY KEY AUTO_INCREMENT,              #评论id
  content VARCHAR(256),               #评论内容
  pid INT,                            #商品id
  uid INT                             #用户id
);

/*----------创建购物车表----------*/
CREATE TABLE shopping_cart (
  scid INT PRIMARY KEY AUTO_INCREMENT,             #购物车商品id
  uid INT,                            #用户id
  pid INT,                            #商品id
  pname VARCHAR(32),                  #商品名称
  style VARCHAR(16),                  #已选款式
  price VARCHAR(16),                  #商品价格
  pic VARCHAR(256),                   #图片路径
  num INT,                            #购买数量
  stock INT                           #库存数量
);


/*-----------插入用户数据---------------*/
INSERT INTO perfect_user VALUES
(null,'MonsterDOG','123',15256943949,'img/109951162847484065.jpg');

/*-----------插入商品数据---------------*/
INSERT INTO perfect_product VALUES
(null,'DOTA2 - 扭蛋手办 II','快来加入我们的篝火晚会吧！ (随机开出7款中的1款)','69.00','默认',57,43,'img/887a0f031dd74d3785095329850ded0a.jpg,img/f073a5f6282946b58b77d57fd83720bd.jpg,img/0b532b5005bc435c99721dbfbafcc52e.jpg,img/420e481286fe405cba12d25f91d53b09.jpg','img/634d7ca01b07453ea8491b1270cc17e7.jpg,img/92db54007c7e4b4395375bf860ce3af4.jpg,img/464b99faf4584ff091b3086f0685cdf4.jpg',1),
(null,'DOTA2 - T恤 主宰就位 (男女同款)','无论何时开战，住在始终准备就绪。','149.00','S,M,L,XL,XXL',82,18,'img/3a8244f3c2aa4bd69fd07cfa482a1faa.jpg','img/e804f755057c40aaacc5996e6326d79e.jpg,img/2b240d16bd04491aaf624c8a6322ce93.jpg,img/6ae5d8628c4049eebbacd74c81b92b9b.jpg',1),
(null,'CS:GO系列3实体胸章','CS:GO正版周边 原装进口 国内首发 胸章为盲盒 款式随机','188.00','默认',436,64,'img/3a51702192a7433f81f2fd1dbb01bfd1.jpg,img/591f0b3d124a4671ba0ba339cb43ae43.jpg','img/c2dce2402576463aaf83fcb0c14ab53b.jpg,img/d9af72f79388416ea776f8f485859c3d.jpg,img/31c55b1d069b40b3ae70ca0f7a1b45d0.jpg',2),
(null,'CS:GO 暴怒野兽帽衫','CS:GO正版周边 原装进口 国内首发 尺寸为美版建议比平时选小一号','549.00','S,M,L,XL',46,4,'img/ccdd369f31a747df971e8518a6bd032c.jpg,img/de01eb13d0264283b40597c7678f86b2.jpg,img/a193d269180f4964b06f6c9a94d376a3.jpg','img/3abd7408d6d24bf887d99f9e7b0e5531.jpg,img/3df1987e35304fd0976ac187ae124892.jpg,img/10920b05c8304e36b037170879e1a59a.jpg,img/e1f53cc825804fda8524d8efdf390686.jpg',2),
(null,'DOTA2 - 雨伞 麦尔朗恩的深渊漩涡','DOTA2主题雨伞，西瓜皮永远憨厚可靠，潮汐猎人为你挡住狂风暴雨！ (注意：由于体积原因，需要额外配送箱和运费，谢谢理解)','149.00','默认',39,11,'img/c1bd0043f71340489dac9711e7576aee.jpg,img/5e5ad83e10a54a54ab4272f38ff79fd1.jpg,img/67e20fb38a9c4718a5619ca0035628be.jpg','img/1f5e4a7fd3f94927bd842e70e2d02f95.jpg,img/8276d22bc5de4ace8db09129f140b31e.jpg,img/04b0d7d9be3c4f699e939d0233fed3ce.jpg',1),
(null,'CS:GO像素风鼠标垫','CS:GO正版周边 原装进口 国内首发','148.00','中号,大号',86,14,'img/7b42a797aedd4e65854afb4d8f027e6a.jpg','img/b5f2bb38348f46238e4fda0d6a55effb.jpg,img/1906fc9b42e44603ba77a1102f1829db.jpg,img/942af251e5804edd86721b1cc391ac2e.jpg,img/117d53302e8545a0b2af8422d8d68c83.jpg,img/0cf137002c4447d2906c79e5ac78ac72.jpg',2),
(null,'2018年国际邀请赛 卫衣','轻松的运动风格，才是电子竞技！','499.00','S,M,L,XL,XXL',56,34,'img/6e06fd9df4f545b199010d1e4030f6f9.jpg','img/efd649bf782347a39ab2d5994c9d23ce.jpg,img/565695eca9594c31ba57e2caaf37ec5b.jpg,img/0ecab9fb54d3474293482477b466cd78.jpg',1),
(null,'DOTA2 - 鼠标垫 血战之命','无休止的战斗，谁能站到最后？','239.00','默认',34,166,'img/e5458f9a69a34ae1b6cb7d40fe95084e.jpg','img/27e807dc83614452b2730234dd34202a.jpg,img/4aade0ff20664e1f884c6175d199c2d0.jpg,img/e4da9f85007c4d74a66eb905210fafe7.jpg',1),
(null,'DOTA2 - 发条技师 马克杯','重新上发条，带给你无限续杯的魔力！','248.00','默认',88,12,'img/77865f1feca749c8ad0033feba3d5e05.jpg','img/f71461cb6ab445128cb06f39655969c8.jpg,img/b29ef954894147cd95503356a702c593.jpg,img/644584a071164999a399d0e33e8ce22d.jpg',1),
(null,'赛睿 Apex M500 专业游戏背光机械键盘有线104cherry樱桃红轴青轴','CHERRY MX青红轴 蓝色背光呼吸灯','819.00','青轴,红轴',50,0,'img/50f84bb2a333483e9e9d2dfaf228dacb.jpg,img/aa2e62c7ae6249d9a245efe1f0465638.jpg,img/a9641b7078b7469d874f1538c6a9e876.jpg','img/1524477519267052000.jpg,img/1524477522006070273.jpg,img/1524477524665071439.jpg,img/1524477524665071439 (1).jpg,img/1524477528254021879.jpg,img/1524477531144081544.jpg,img/1524477534036095638.jpg,img/1524477536792086286.jpg,img/1524477539505032788.jpg,img/1524477541952046108.jpg,img/1524477544629025392.jpg,img/1524477547646070570.jpg,img/1524477550696056362.jpg,img/1524477553360016472.jpg,img/1525784844941053991.jpg',3),
(null,'steelseries/赛睿 Arctis 3寒冰3 RGB游戏耳机7.1','零延迟无线音频 DTS 7.1环绕声','629.00','黑色,白色',48,2,'img/fe969e581d2d45719977be34c881e9ad.jpg,img/724b02ae474643588116cc566166bafa.jpg,img/bb3cfb71b3e045c292acffff68419e8f.jpg','img/1524205842520043738.jpg,img/1524205845348021939.jpg,img/1524205848566058609.jpg,img/1524205851232007646.jpg,img/1524205851232007646 (1).jpg,img/1524205854115086711.jpg,img/1524205857001065326.jpg,img/1524205857001065326 (1).jpg,img/1524205862444015200.jpg,img/1524205865477038981.jpg,img/1525784551530004520.jpg',3),
(null,'steelseries/赛睿 Arctis 7寒冰7 头戴式无线游戏耳机麦','零延迟无线音频 DTS 7.1环绕声','1349.00','默认',50,0,'img/632b616ecac04380b28de3c4e502ff4b.jpg,img/1d0a2af53c5b495da0316e2609a6e8d3.jpg,img/4e667e005f01455fa34b14d7cd817cb7.jpg','img/1524214114454008128.jpg,img/1524214116816003537.jpg,img/1524214121892094186.jpg,img/1524214129948069458.jpg,img/1524214129948069458 (1).jpg,img/1524214132719096724.jpg,img/1524214135429085585.jpg,img/1525784683540087557.jpg',3),
(null,'赛睿 rival 600 有线游戏鼠标rgb宏编程双传感防滑侧裙配重','双传感 防抖动 1比1追踪','659.00','默认',47,3,'img/1e9b7cd13eca444eab7a8b3df3696482.jpg,img/4e0d5a9fdaa741dbb3d4df9ec9ef5cc8.jpg,img/20b8a3e716b54280835362ce10c0cd8d.jpg','img/1524727571439009400.jpg,img/1524727573535050465.jpg,img/1524727576202078457.jpg,img/1524727576202078457 (1).jpg,img/1524727580174053797.jpg,img/1524727582529050639.jpg,img/1524727585250018410.jpg,img/1524727589600037291.jpg,img/1524727598599058079.jpg',3),
(null,'SteelSeries赛睿 rival 100 光学有线电竞游戏鼠标 RGB呼吸灯','赛睿正版 RGB灯光 小尺寸设计 防滑侧裙','199.00','RIVAL 100 白色,RIVAL 100 红色,RIVAL 100 绿色,RIVAL 100 金色',38,12,'img/cc4163c90649472db649d64c8703ab52.jpg,img/722b08176f264dc3be36b50e844fb20c.jpg,img/dc2551ff91724b7688d26bbd4ca0da91.jpg,img/c43dd068211d4ff483bbcf7be4f56955.jpg','img/1524046110001048754.jpg,img/1524046528444019256.jpg,img/1524046117440081553.jpg,img/1524046122653044925.jpg',3),
(null,'五虎将-赵云手办','赤壁限量周边 神勇马超 三国珍藏','866.00','默认',22,8,'img/1469009275216605161.jpg,img/1469009162690181133.jpg,img/1469009139118557451.jpg','img/1517993224763035724.jpg,img/1517993225065085033.jpg',4),
(null,'梦间集-超大桌垫','梦间集正品周边，你的小可爱在桌子上等你呦~ 顺丰包邮','75.00','金铃,浮生,秋水',78,2,'img/30e250e27e0549c79d74910afbaf468c.jpg,img/207e924253e94abaaf8c6b5b086242ba.jpg,img/d5f78761243f4b7ba6a9eb4bc085bbcc.jpg','img/1535534299217032177.jpg,img/1535534301655029667.jpg',4),
(null,'诛仙手游-loz灵猴模型玩具','诛仙手游 绑定虚拟 拼插玩具 人气灵猴','69.00','默认',498,2,'img/729f65ee-1aa9-4d32-a56c-fa387b21dfeb.jpg,img/3bcf5d96-e035-44a2-b084-6bd27b0988ac.jpg,img/8d1d4819-e949-489d-8199-dfc72b637327.jpg','img/1517992712916078117.jpg,img/1517992713470063987.jpg,img/1517992714012019019.jpg',4),
(null,'梦间集-角色文件夹','让你的课桌丰富多彩，梦间集正版 顺丰包邮','15.00','绿竹,屠龙,倚天,灵蛇,飞燕,流光,齐眉',72,3,'img/ad6b0a7dda264e5784fb236a6e472e7a.jpg,img/519c8562f44945eeb750e2d20cc6cbf4.jpg,img/8cc6801a5b43403ab95bd7da2c7cce5e.jpg','img/1535536802805051203.jpg,img/1535536805752019836.jpg,img/1535536808277022151.jpg',4),
(null,'诛仙3-古风戏莲杯 诛仙10周年纪念版','【活动期间购买诛仙3周边满79元可免费领取陶瓷杯，满200元还可在抽奖一次】诛仙3 茶杯 仿古工艺 国韵特色','99.00','玉玑青,胭脂绯',93,30,'img/7d0ac587-5637-4638-972e-7802ae0d6e33.jpg,img/b2584f50-e681-4507-998b-542808cef224.jpg,img/db898e8d-adc2-4386-9d16-9cf6e5331a64.jpg,img/8ae75afe-ac67-47f7-9118-14c664b0d817.jpg','img/1517993886287072285.jpg,img/1517993886368074260.jpg,img/1517993886442061874.jpg,img/1517993886585016530.jpg,img/1517993887755038998.jpg,img/1517993888021051336.jpg',4),
(null,'CS:GO全球攻势鼠标垫','CS:GO正版周边 原装进口 国内首发','219.00','默认',35,15,'img/3e5204a44aa2447d89dbad54ba628244.jpg','img/eb5511e8894f42edb9ffab020451af44.jpg,img/f2a46a2268314e4e8a67ed0c5ba93de9.jpg',2),
(null,'CS:GO网格棒球帽','CS:GO正版周边 原装进口 国内首发','239.00','默认',12,88,'img/5bf82395288041e7934730d0553f89e6.jpg','img/cfc342ae7f5442e386c7d0f7e1745182.jpg,img/bc11f6edd3cf44f188767d89eaed0506.jpg,img/3faf9df91cfe4a8581d6c016cbf28031.jpg',2),
(null,'CS:GO Logo针织帽','CS:GO正版周边 原装进口 国内首发','149.00','默认',56,44,'img/39d0333f909d49bb9c32d5fde0e33c5f.jpg','img/273844aea679412aa78d03da2532419a.jpg,img/aaaf55be6f9149068dbff62e55d5fd7c.jpg,img/72f8f9f0f6d44e0385107817a95ea0e8.jpg',2),
(null,'CS:GO爪子刀T恤','CS:GO正版周边 原装进口 国内首发 尺寸为美版建议比平时选购小一号','199.00','S,M,L,XL,XXL',89,11,'img/74663684c80e4604ae8737418f91e2d6.jpg','img/d634a8521b7740fd877c20d6c3999e08.jpg,img/f836fdb8478940d59e08212f09dd355f.jpg,img/d00f31e9dfec4411bf0bc9c2edb79d61.jpg',2),
(null,'CS:GO 全球攻势马克杯','CS:GO正版周边 原装进口 国内首发','129.00','默认',34,16,'img/7e19774cb5634f118e552fa995b6f36e.jpg','img/83c7ce42463f44f488858471205771b2.jpg,img/da7f8367be21420f9589101a31fbdbe1.jpg,img/d1c97d186c4e451f937b5ad8e0f854d0.jpg',2),
(null,'CS:GO 电竞 Logo T恤','CS:GO正版周边 原装进口 国内首发 尺寸为美版建议比平时选购小一号','199.00','S,M,L,XL,XXL',56,34,'img/1656c960ed664c9c8a1e15f918f83aa3.jpg','img/32de621efb1947b09ff0ad416361710e.jpg,img/c09eca87e26d4708a2a28bc151340f83.jpg,img/f77010f0df73458facd22a1dc2bc0a1a.jpg',2),
(null,'姜小虎-多表情手捂','正版姜小虎 Q萌可爱 小手捂','68.00','款式A：瞪眼,款式B：坏笑,款式C：晕~,款式D：斜眼,款式E：舒服',0,18,'img/fa5958c2-6708-40c2-adf4-e84a2cd1adb1.jpg,img/94001652-dfb1-4466-a088-38c00e135878.jpg,img/9ad4a35f-0ef7-4364-ad89-837522f4eabd.jpg,img/bccfcadb-2126-4474-b653-e3b033fdc6d6.jpg','img/1484274569846047823.jpg,img/1484274569971079357.jpg,img/1484274570170059470.jpg,img/1484274570287044442.jpg',5),
(null,'姜小虎-货郎小虎手办','正版姜小虎 手办 完美10周年纪念款','288.00','默认',89,11,'img/fc42c28e-3da5-49a3-8a91-7208593a30e0.jpg,img/b4286eec-eb83-463c-98a4-f2c5a372ced3.jpg,img/90018e2e-dd4b-4cb7-97f2-70ecc0774c00.jpg,img/2d800f7b-9b22-4289-ba60-831bb39d84d5.jpg','img/1484274582866069117.jpg,img/1484274583012072859.jpg,img/1484274583247099958.jpg,img/1484274583338071984.jpg',5),
(null,'姜小虎-福袋','正版姜小虎 限量50套 内含4-6样周边','122.00','122元福袋,233元福袋',1,12,'img/bd2a2f1c-cd67-48e7-a1a9-bdcd30675791.jpg,img/811d4a14-a4af-46fe-b80d-15bfbdf6ddaf.jpg,img/8b628a52-0b72-40c9-ba48-eded10d55c8a.jpg,img/9a1b90ec-d177-4b5c-ae46-0e332e2dbca0.jpg','img/1484274499469076503.jpg,img/1484274499568019128.jpg,img/1484274499736061018.jpg',5),
(null,'姜小虎-背包','正版姜小虎 背包 贱萌小虎','99.00','默认',0,5,'img/d16243ce-1e6b-42b1-a217-01ca3e1738a5.jpg,img/5d0a81c1-128b-465d-8226-a12a9757d319.jpg,img/8cc43ebd-67e9-47bf-9de8-baa73761201a.jpg,img/be6bc828-9b86-493b-a22d-65bfb59039b7.jpg','img/1517995159611044630.jpg,img/1517995159856055275.jpg,img/1517995160410002079.jpg,img/1517995160798032693.jpg,img/1517995161151057521.jpg',5),
(null,'姜小虎-抱腿腰包','正版姜小虎 创意腰包 独特设计','99.00','默认',28,2,'img/fe2c0461-d66f-400e-ae92-1b76f10a8bd2.jpg,img/ffd773fd-71a3-49eb-9ab1-751fcd6a01ee.jpg,img/8b46cd3a-5f17-4805-8f68-2b2949fa0ef7.jpg,img/51ac17f7-ab68-4298-87c7-218867423281.jpg','img/1473405532600029309.jpg,img/1473405537503060498.jpg,img/1473405542479091642.jpg,img/1473405547583047787.jpg,img/1473405552091066069.jpg,img/1473405556193087564.jpg',5),
(null,'姜小虎-表情口罩','正版姜小虎 表情口罩 抗PM2.5','12.00','口罩：发呆,口罩：坏笑,口罩：惬意,口罩：白虎',14,6,'img/5feae8ff-0905-4657-83c4-9e205b886dc2.jpg,img/2765b89d-e8f7-4fad-ab1d-82f4c62e6395.jpg,img/17bf23d9-04c0-4981-a2c0-5c2362968164.jpg,img/23545404-0c78-4977-9d4c-2ad688acdce0.jpg','img/1517995195580028005.jpg,img/1517995195836056569.jpg,img/1517995196159026227.jpg,img/1517995196394032205.jpg,img/1517995196714048562.jpg',5);

/*-----------插入商品类别数据---------------*/
INSERT INTO product_class VALUES
(null,'DOTA2神秘商店'),
(null,'CSGO正版周边'),
(null,'游戏外设'),
(null,'完美世界周边'),
(null,'姜小虎周边');

/*-----------插入首页banner数据---------------*/
INSERT INTO banner VALUES
(null,'img/banner1.png',1),
(null,'img/banner2.png',2),
(null,'img/banner3.png',3),
(null,'img/banner4.png',4),
(null,'img/banner5.png',5),
(null,'img/banner6.png',6);

/*-----------插入首页楼层数据---------------*/
INSERT INTO index_floor VALUES
(null,'img/46a762db-d63e-4c6e-9d63-0bbb986905ba.jpg','Dota2神秘商店','img/93f67a9f-09aa-473a-9dda-da8add66db93.jpg',1),
(null,'img/48b55125-b9ab-41bf-a2cc-fa368dc368d6.jpg','CSGO正版周边','img/7a580e48-595c-4f11-847c-f81e95219bba.jpg',2),
(null,'img/ac2ede71012d48dc953ac3a52ac7ad8c.jpg','电竞外设专区','img/8b3cd23eae73440aaa030fd6bdf11e56.jpg',3),
(null,'img/34074317-e65b-486d-acb4-d99972501b63.jpg','完美世界游戏周边','img/c158174c-0e9d-4c92-80c4-e624e20034de.jpg',4),
(null,'img/8794293e-ccd8-46ac-b687-df744f636e0e.jpg','姜小虎周边专区','img/649d1b44-c48a-49da-b200-56840a74e5e9.jpg',5);

/*-----------插入楼层banner数据---------------*/
INSERT INTO floor_banner VALUES
(null,'img/7cef96d122b64cf7976e4233ef0bbc07.jpg',2,1),
(null,'img/88669b087b204107ad4e67c9a9bddf8f_02.png',5,1),
(null,'img/b535b356203f4503a2942d0fb61b3a79_02.png',7,1),
(null,'img/1a9e2f9e09e94dd4a3bb0ba22cd586e1_02.png',23,2),
(null,'img/f73b5206c7eb4a8888b9cec9146f68e0_02.png',20,2),
(null,'img/12a2977865354c1e97618a6aed27236b_02.png',4,2),
(null,'img/1524205857001065326_02.png',12,3),
(null,'img/1524205862444015200_03.png',11,3),
(null,'img/1524477534036095638_02.png',10,3),
(null,'img/b24a4280-eb2a-4cc6-ba6e-97a97dde6c9c.jpg',15,4),
(null,'img/1535534299217032177-(1)_02.png',16,4),
(null,'img/1535536802805051203_03.png',18,4),
(null,'img/b31b587d-eb0c-4c0f-9e99-bd2185325d08.jpg',26,5),
(null,'img/3dd3f796-e688-4ff4-810a-4c146e0a99d4.jpg',27,5);

