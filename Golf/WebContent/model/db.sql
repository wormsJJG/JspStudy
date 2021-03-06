create table tbl_teacher(
CLASS_CODE char(3) not null primary key,
CLASS_NAME varchar2(20),
TEACHER_NAME varchar2(30),
PRICE number(8)
);
update TBL_TEACHER set class_code=?, class_name=?, teacher_name=?, price=?
update TBL_TEACHER set class_name='중급', teacher_name='정재근', price=200000 where class_code='200'
create table tbl_member(
MEMBER_CODE CHAR(5) NOT NULL PRIMARY KEY,
MEMBER_NAME VARCHAR(20),
INDATE CHAR(8),
ADDRESS VARCHAR2(50),
GRADE VARCHAR(12)
);
CREATE TABLE TBL_CLASS(
CLASS_DATE CHAR(6),
MEMBER_CODE CHAR(5),
CLASS_AREA VARCHAR2(20),
CLASS_CODE CHAR(3),
PRICE NUMBER(8),
PRIMARY KEY(CLASS_DATE, MEMBER_CODE),
FOREIGN KEY(MEMBER_CODE) REFERENCES tbl_member(MEMBER_CODE),
FOREIGN KEY(CLASS_CODE) REFERENCES tbl_teacher(CLASS_CODE)
);
DROP TABLE TBL_CLASS;
DROP TABLE TBL_TEACHER;

INSERT INTO TBL_TEACHER VALUES('100','초급','강호동',100000);
INSERT INTO TBL_TEACHER VALUES('200','중급','유재석',200000);
INSERT INTO TBL_TEACHER VALUES('300','고급','조세호',300000);
INSERT INTO TBL_TEACHER VALUES('400','심화','양세찬',400000);

SELECT * FROM TBL_TEACHER WHERE CLASS_CODE=?

INSERT INTO tbl_member VALUES('10001','뷔','20181210','성남시분당구','일반');
INSERT INTO tbl_member VALUES('10004','정재근','20181210','성남시분당구','VIP');
INSERT INTO tbl_member VALUES('10002','진','20191110','성남시분당구','일반');
INSERT INTO tbl_member VALUES('10003','슈가','20200917','용인시수지구','일반');
INSERT INTO tbl_member VALUES('20001','RM','20150602','성남시분당구','VIP');
INSERT INTO tbl_member VALUES('20002','제이홉','20151004','용인시수지구','VIP');

SELECT * FROM TBL_MEMBER ;

INSERT INTO TBL_CLASS VALUES('202203','10001','서울본원','100',100000);
INSERT INTO TBL_CLASS VALUES('202203','10002','서울본원','200',200000);
INSERT INTO TBL_CLASS VALUES('202203','10003','성남분점','300',300000);
INSERT INTO TBL_CLASS VALUES('202203','20001','성남분점','400',200000);
INSERT INTO TBL_CLASS VALUES('202203','20002','성남분점','300',150000);

SELECT * FROM TBL_CLASS;


--강사 정보 조회
SELECT CLASS_CODE, TEACHER_NAME, CLASS_NAME, PRICE 
FROM TBL_TEACHER
--회원 정보 조회
SELECT CLASS_DATE, X.CLASS_NAME, TEACHER_NAME, Z.MEMBER_CODE, MEMBER_NAME, CLASS_AREA, TO_CHAR(z.PRICE,'FM999,999,999') PRICE
FROM TBL_TEACHER X, TBL_MEMBER Y, TBL_CLASS Z
WHERE X.CLASS_CODE=Z.CLASS_CODE AND Y.MEMBER_CODE=Z.MEMBER_CODE
ORDER BY CLASS_DATE, Z.MEMBER_CODE
--강사별 매출 조회
SELECT X.CLASS_CODE, CLASS_NAME, TEACHER_NAME, TO_CHAR(SUM(Y.PRICE),'FM999,999,999') SUMPRICE
FROM TBL_TEACHER X, TBL_CLASS Y
WHERE X.CLASS_CODE=Y.CLASS_CODE
GROUP BY X.CLASS_CODE, CLASS_NAME, TEACHER_NAME
ORDER BY CLASS_CODE
--수강등록
insert into TBL_CLASS values(?,?,?,?,?)

select member_code, member_name from TBL_MEMBER
select class_code, class_name from TBL_TEACHER

CREATE TABLE ADMIN(
	ID VARCHAR2(20) PRIMARY KEY,
	PASSWORD VARCHAR2(20)
);
CREATE TABLE LOGIN(
	ID VARCHAR2(20) PRIMARY KEY,
	PASSWORD VARCHAR2(20) NOT NULL,
	MEMBER_CODE CHAR(5),
	GRADE CHAR(1),
	FOREIGN KEY (MEMBER_CODE) REFERENCES TBL_MEMBER(MEMBER_CODE)
);
select member_code from LOGIN
INSERT INTO LOGIN VALUES('admin','1234','','A');
INSERT INTO LOGIN VALUES('abcde','1234','10001','U');
INSERT INTO LOGIN VALUES('bcdef','1234','10002','U');
INSERT INTO LOGIN VALUES('cdefg','1234','10003','U');
INSERT INTO LOGIN VALUES('defgh','1234','20001','U');
INSERT INTO LOGIN VALUES('efghi','1234','20002','U');
INSERT INTO LOGIN VALUES('worms','1234','10004','U');
select * from LOGIN where id='abcde' and password='1234'
select member_code from login where id=?
SELECT X.MEMBER_CODE, MEMBER_NAME FROM TBL_MEMBER X, LOGIN Y WHERE X.MEMBER_CODE = Y.MEMBER_CODE AND Y.MEMBER_CODE = '10002'

update LOGIN set id='worms0627' where member_code = '10004'

select id from LOGIN x, TBL_MEMBER y where member_name = '정재근' and x.member_code=y.member_code
select password from LOGIN x where id='worms0627' and member_code = '10004'

select * from LOGIN




