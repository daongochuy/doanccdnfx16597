/* tao database */
create database salelotterys
go
/* lam viec voi database salelotterrys */
use salelotterys 
go
/* tao cac bang */
-- tao bang Loai ve so
 create table lotterytype
 (
 ID varchar(20) not null,
 TypeName nvarchar(200) not null,
 ParentID nvarchar(10) ,
 MetaTitle varchar(200),
 MetaKeyword nvarchar(300),
 MetaDescription nvarchar(500),
 SeoTitle nvarchar(200),
 isEnable bit default(1),
 ShowOnHome bit default(1)
 )
 go
 --tao bang ve so 
 create table lottery
 (
 ID bigint identity(1,1) not null,
 typelottery varchar(20) not null,
 serialnumber int not null,
 Images nvarchar(100),
 Detail ntext,
 Price decimal(18,0),
 PromotionPrice decimal(18,0),
 includeVAT bit,
 createdate datetime not null default getdate(),
 enddate datetime not null,
 quantity int not null,
 MetaTitle varchar(200),
 MetaKeyword nvarchar(300),
 MetaDescription nvarchar(500),
 SeoTitle nvarchar(200),
 viewCount int default(0),
 isEnable bit,
 ShowOnHome bit default(0)
 )
 go
 --tao bang danh muc bai viet(tin tuc)
 create table Category
 (ID bigint identity(1,1) not null,
  [Name] nvarchar(300) not null,
  ParentID bigint,
  MetaTitle varchar(300) ,
  DisplayOrder int,
  CreateDate datetime,
  ModifiedDate datetime,
  MetaKeyword nvarchar(300),
  MetaDescription nvarchar(500),
  SeoTitle nvarchar(300),
  isEnable bit,
  ShowOnHome bit default(0)
 )
 go
 --tao bang bai viet
 create table Content
 (
  ID bigint identity(1,1) not null,
  Title nvarchar(300) not null,
  MetaTitle varchar(300),
  Category bigint not null,
  [Image] varchar(200),
  [Description] nvarchar(max),
  Detail ntext,
  DisplayOrder int,
  CreateDate datetime,
  ModifiedDate datetime,
  MetaKeyword nvarchar(300),
  MetaDescription nvarchar(500),
  SeoTitle nvarchar(300),
  Tags nvarchar(500),
  isEnable bit,
  ShowOnHome bit default(0),
  ViewCount int default(0)
 )
 go
 -- tao bang Tags ho tro cho seo
 create table Tag(
 ID varchar(50) not null,
 [Name] nvarchar(50) not null
 )
 go
 -- tao bang trung gian the hien moi quan he nhieu nhieu giua bai viet va tag
 create table ContentTag
 (
 ContentID bigint not null,
 TagID varchar(50) not null,
 )
 go
 -- tao bang gioi thieu 
 create table About
 (
  ID bigint identity(1,1) not null,
  Title nvarchar(300) not null,
  MetaTitle varchar(300),
   [Image] varchar(200),
  [Description] nvarchar(max),
  Detail ntext,
  CreateDate datetime,
  ModifiedDate datetime,
  MetaKeyword nvarchar(300),
  MetaDescription nvarchar(500),
  isEnable bit,
 )
 go
 --tao bang thong tin lien he cho khach hang
 create table Contact
 (
 ID int identity(1,1) not null,
 [Content] ntext not null,
 isEnable bit default(1)
 )
 go
 --tao bang luu thong tin lien he tu khach hang
 create table FeedBack
 (
  ID bigint identity(1,1) not null,
  FullName nvarchar(200) not null,
  [Address] nvarchar(500) ,
  Email varchar(100),
  Phone varchar(50),
  Content ntext,
  CreateDate datetime default getdate(),
  [Status] bit
 )
 go
 --tao bang slide 
 create table Slide
 (
  ID int identity(1,1) not null,
  Title nvarchar(100) ,
  Position varchar(20),
  Images nvarchar(300) not null,
  DisplayOrder int,
  Link nvarchar(300),
  [Description] nvarchar(500) ,
  CreateDate datetime ,
  ModifiedDate datetime ,
  isEnable bit,
 )
 go
 -- tao bang menu
 create table Menu
 (
  ID int identity(1,1) not null,
  [Text] nvarchar(100) not null,
  ParentID int,
  Position varchar(20),
  DisplayOrder int,
  Link nvarchar(300),
  [Target] nvarchar(100),
  isEnable bit,
 )
 go
 --Tao bang footer
 create table footer
 (
  ID varchar(50) not null,
  [content] ntext,
  isEnable bit
 )
 go
 --tao bang luu cau hinh chung cho website
 create table  SystemConfig
 (
 ID varchar(50) not null,
 [Name] nvarchar(50) not null,
 [Type] varchar(50) ,
 [Value] nvarchar(500),
 isEnable bit
 )
 -- tao bang khach hang 
 create table customer
 (
 ID int identity(1,1) not null,
 customerName nvarchar(30) not null,
 customerAddress nvarchar(500),
 customerEmail nvarchar(200),
 customerPhone nvarchar(50),
 username nvarchar(50) not null,
 password nvarchar(30) not null,
 isEnable bit
 )
 go
 --tao bang lich su truy cap
 create table accesshistory
 (
  ID int identity(1,1) not null,
  customer int not null,
  timeaccess datetime,
 )
 go
 --tao bang lich su do so 
 create table lookuphistory(
 Id int identity(1,1) not null,
 customer int not null,
 typeID varchar(20) not null,
 numbercheck int not null,
 timecheck datetime default getdate()
 )
 go
 -- tạo bảng lịch sử kết quả quay số
 create table LotteryResultHistory
 (
  ID bigint identity(1,1) not null,
  typelottery varchar(20) not null,
  [Name] nvarchar(50),
  ResultDate datetime,
  [Value] int,
  isEnable bit,
 )
 go
 -- tao bang tai khoan cho admin
 create table Account
 (
  username nvarchar(50) not null,
  password nvarchar(30) not null,
  permision nvarchar(10) not null,
  isEnable bit
 )
 go
 -- tạo bảng mã nhúng website từ bên ngoài
 create table embedcode
 (
  ID varchar(20) not null,
  [Name] nvarchar(300),
  SourceCode ntext not null,
  Position varchar(10) not null default 'center',
  isEnable bit
 )
 go
 -- tạo bảng liên kết tới website khác
 create table Link
 (
  ID int identity(1,1) not null,
  Title nvarchar(100),
  imageLink nvarchar(100),
  urlLink nvarchar(300),
  isEnable bit
 )
 go
 --Tạo bảng hóa đơn
 create table OrderLottery
 (
  ID int identity(1,1) not null,
  CustomerID int,
  OrderDate datetime not null default getdate(),
  OrderAddress nvarchar(500),
  TotalMoney decimal(18,0),
  OrderStatus bit
 )
 go
 -- Tạo bảng chi tiết hóa đơn
 create table OrderDetail
 (
  OrderID int not null,
  lotteryID int not null,
  Price decimal(18,0),
  PromotionPrice decimal(18,0),
  quantity int,
 )
 go
 
 /* Tạo Khóa chính cho các bảng*/
 --tạo khóa chính cho bảng loại vé số
 alter table lotterytype
 add constraint pk_lotterytype primary key(ID)
 go
 --tạo khóa chính cho bảng vé số
 alter table lottery
 add constraint pk_lottery primary key(ID)
 go
 --tạo khóa chính cho Loại bài viết 
 alter table Categoty 
 add constraint pk_Categoty  primary key(ID)
 go
 --tạo khóa chính cho bài viết 
 alter table Content
 add constraint pk_Content primary key(ID)
 go
 --tạo khóa chính cho Tag
 alter table Tag
 add constraint pk_Tag primary key(ID)
 go
 --tạo khóa chính cho content-Tag
 alter table ContentTag
 add constraint pk_ContentTag primary key(ContentID,TagID)
 go
 --tạo khóa chính cho bảng giới thiệu
 alter table About
 add constraint pk_About primary key(ID)
 go
 --tạo khóa chính cho bảng thông tin liên hệ (thông tin của đơn vị)
 alter table Contact
 add constraint pk_Contact primary key(ID)
 go
 --tạo khóa chính cho bảng thông tin liên hệ từ khách hàng
 alter table FeedBack
 add constraint pk_FeedBack primary key(ID)
 go
 --tạo khóa chính cho bảng Slide
 alter table Slide
 add constraint pk_Slide primary key(ID)
 go
  --tạo khóa chính cho bảng Menu
 alter table Menu
 add constraint pk_Menu primary key(ID)
 go
  --tạo khóa chính cho bảng footer
 alter table footer
 add constraint pk_footer primary key(ID)
 go
  --tạo khóa chính cho bảng cấu hình chung cho site
 alter table SystemConfig
 add constraint pk_SystemConfig primary key(ID)
 go
   --tạo khóa chính cho bảng Khách hàng
 alter table customer
 add constraint pk_customer primary key(ID)
 go
   --tạo khóa chính cho bảng lịch sử truy cập
 alter table accesshistory 
 add constraint pk_accesshistory primary key(ID)
 go
 --tạo khóa chính cho bảng lịch sử dò vé
 alter table lookuphistory 
 add constraint pk_lookuphistory primary key(ID)
 go
 --tạo khóa chính cho bảng lịch sử kết quả quay số 
 alter table LotteryResultHistory 
 add constraint pk_LotteryResultHistory primary key(ID)
 go
  --tạo khóa chính cho bảng tài khoản admin
 alter table Account 
 add constraint pk_Account primary key(username)
 go
  --tạo khóa chính cho bảng tài mã nhúng website ngoài
 alter table embedcode
 add constraint pk_embedcode primary key(ID)
 go
  --tạo khóa chính cho bảng liên kết 
 alter table Link
 add constraint pk_Link primary key(ID)
 go
 --tạo khóa chính cho bảng hóa đơn
 alter table OrderLottery
 add constraint pk_OrderLottery primary key(ID)
 go
 --tạo khóa chính cho bảng chi tiết hóa đơn
 alter table OrderDetail
 add constraint pk_OrderDetail primary key(OrderID,lotteryID)
 go
 /* Tạo Khóa Ngoại Cho Các Bảng*/
 -- Tạo Khóa ngoại cho bảng vé số
ALTER TABLE lottery
ADD  CONSTRAINT fk_lotteryType FOREIGN KEY(typelottery)
REFERENCES lotterytype (ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
--Tạo khóa ngoại cho bảng content(bài viết)
ALTER TABLE Content
CONSTRAINT fk_ContentCategory FOREIGN KEY(Category)
REFERENCES Category (ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
--Tạo khóa ngoại cho bảng content-tag
ALTER TABLE ContentTag
ADD CONSTRAINT fk_ContentTagContent FOREIGN KEY(ContentID)
REFERENCES Content(ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE ContentTag
ADD  CONSTRAINT fk_ContentTagTag FOREIGN KEY(TagID)
REFERENCES Tag(ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
--Tạo khóa ngoại cho bảng lịch sử truy cập accesshistory
ALTER TABLE accesshistory 
ADD  CONSTRAINT fk_accesshistoryCustomer FOREIGN KEY(customer)
REFERENCES customer(ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
--tạo khóa ngoại cho bảng lịch sử dò số
ALTER TABLE lookuphistory 
ADD  CONSTRAINT fk_lookuphistoryCustomer FOREIGN KEY(customer)
REFERENCES customer(ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
--Tạo khóa ngoại cho bảng lịch sử kết quả dò số 
ALTER TABLE LotteryResultHistory 
ADD  CONSTRAINT fk_LotteryResultHistoryType FOREIGN KEY(typelottery)
REFERENCES lotterytype(ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
--Tạo khóa ngoại cho bảng hóa đơn
ALTER TABLE OrderLottery
ADD  CONSTRAINT fk_OrderLotteryCustomer FOREIGN KEY(CustomerID)
REFERENCES customer(ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
--Tạo khóa ngoại cho bảng chi tiết hóa đơn 
ALTER TABLE OrderDetail
ADD  CONSTRAINT fk_OrderDetailOrder FOREIGN KEY(OrderID)
REFERENCES OrderLottery(ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE OrderDetail
ADD  CONSTRAINT fk_OrderDetailLottery FOREIGN KEY(lotteryID)
REFERENCES lottery(ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

