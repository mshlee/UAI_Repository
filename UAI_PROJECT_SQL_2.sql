--작성일: 19.08.12.월
--**(LHE) 개별 작업 환경에서 DB를 만들어 테스트할 때 쓰는 공통 테이블/시퀀스 생성 쿼리 입니다.
--        개별 테스트는 로컬호스트/SCOTT 계정에 테이블을 만들어서 테스트 해주세요.
--  확정된 테이블 목록: 데이터베이스 모델 PDF 참조
-- (이전에 테이블을 생성했던 분들은 상단의 ALTER/DROP구문 먼저 실행) CREATE 구문부터 순서대로 한 명령어씩 실행해주세요.
-- 제약사항을 거실분은 테이블 drop, delete를 용이하게 하기 위해 CASCADE 제약을 걸어주시고 수정은 가급적 ALTER TABLE로 해주세요.


-- 이전 테이블의 제약사항 지우기
ALTER TABLE Board_Content DROP CONSTRAINT fk_members;
ALTER TABLE Board_Content DROP CONSTRAINT fk_product;
ALTER TABLE Board_Content DROP CONSTRAINT FK_admin;

ALTER TABLE Orders DROP CONSTRAINT fk_product2;
ALTER TABLE Orders DROP CONSTRAINT fk_members2;

-- 이전 테이블 지우기
DROP TABLE Product;
DROP SEQUENCE Product_Seq;
DROP TABLE Members;
DROP SEQUENCE Members_Seq;
DROP TABLE Admins;
DROP SEQUENCE Admin_Seq;
DROP TABLE Files;
DROP SEQUENCE Files_Seq;
DROP TABLE Board_Content;
DROP SEQUENCE Board_Content_Seq;
DROP TABLE Orders;
DROP SEQUENCE Orders_Seq;

--CREATE TABLE/SEQUENCE 구문

CREATE TABLE Members(
M_IDX NUMBER(8) PRIMARY KEY,
M_ID VARCHAR2(40),
M_PW VARCHAR2(40),
M_NAME VARCHAR2(40),
M_NICK VARCHAR2(40),
M_PHONE VARCHAR2(40),
M_ADDRESS VARCHAR2(100),
M_GENDER VARCHAR2(20),      --Gender: M-남성, F-여성
M_BIRTH DATE,
M_JOINDATE DATE,
M_INTEREST1 VARCHAR2(100),
M_INTEREST2 VARCHAR2(100),
M_INTEREST3 VARCHAR2(100),
M_EDUCATION VARCHAR2(100),
M_MAJOR VARCHAR2(100),
M_JOB VARCHAR2(40),
M_MARITALSTATUS VARCHAR2(40)
);

CREATE SEQUENCE Members_Seq;

CREATE TABLE Admins (
AD_IDX NUMBER(8) PRIMARY KEY,
AD_ID VARCHAR2(40),
AD_PW VARCHAR2(40),
AD_NICK VARCHAR2(40)
);

CREATE SEQUENCE Admins_Seq;

CREATE TABLE Product (
P_IDX NUMBER(8) PRIMARY KEY,
P_NAME VARCHAR2(100),
P_TYPE NUMBER(8),       --P_Type: 0-언어, 1-IT/컴퓨터, 2-미술, 3-음악, 4-스포츠, 5-기타
P_ORIGINALPRICE NUMBER(8),
P_DISCOUNTRATE FLOAT(5),
P_TOTALSALECOUNT NUMBER(8),
P_POSTDATE DATE,
P_COMMISSIONRATE FLOAT(5)
);

CREATE SEQUENCE Product_Seq;

CREATE TABLE Board_Content (
B_IDX NUMBER(8) PRIMARY KEY,
B_TYPE NUMBER(8),       --B_Type: 0-공지사항, 1-리뷰, 2-qna
B_TITLE VARCHAR2(100),
B_CONTENT VARCHAR2(1000),
B_POSTDATE DATE,
B_COUNT NUMBER(8),
B_ISHIDDEN NUMBER(8),   --ishidden: 0-no(공개글이다), 1-yes(비밀글이다)
B_PW VARCHAR2(40),
B_QCATEGORY NUMBER(8),  --qcategoty: 0-상품문의, 1-결제문의
B_ISPOST NUMBER(8),     --ispost: 0-no(댓글이다), 1-yes(글이다)
M_IDX NUMBER(8),
P_IDX NUMBER(8),
AD_IDX NUMBER(8)
);

CREATE SEQUENCE Board_Content_Seq;

CREATE TABLE Wishlist(
W_IDX NUMBER(8) PRIMARY KEY,
M_IDX NUMBER(8),
P_IDX NUMBER(8),
W_WISHDATE DATE
);

CREATE SEQUENCE Wishlist_Seq;

CREATE TABLE Files (
F_IDX NUMBER(8) PRIMARY KEY,
B_IDX NUMBER(8),
F_PATH VARCHAR2(1000),
F_ORIGINALNAME VARCHAR2(1000)
);

CREATE SEQUENCE Files_Seq;

CREATE TABLE Product_Content (
P_IDX NUMBER(8) PRIMARY KEY,
PC_TEACHER VARCHAR2(40),
PC_MAXSTUDENT NUMBER(8),
PC_STARTDATE DATE,              --관리를 용이하게 하기 위해 Duration 대신 시작일/종료일을 date형식으로 저장하도록 칼럼나눔.
PC_LASTDATE DATE,
PC_LOCATION VARCHAR2(40),
PC_LECTUREDAY VARCHAR2(40),
PC_LECTURETIME VARCHAR2(40),
PC_DETAIL VARCHAR2(2000)
);

CREATE TABLE Orders (
O_IDX NUMBER(8) PRIMARY KEY,
O_TOTALPRICE NUMBER(8),
O_DATE DATE,
P_IDX NUMBER(8),
M_IDX NUMBER(8)
);

CREATE SEQUENCE Orders_Seq;

CREATE TABLE Payment (
O_IDX NUMBER(8) PRIMARY KEY,
PY_PAYMENTMETHOD NUMBER(8),     --paymentmethod: 0-무통장, 1-카드
PY_TOTALPAYMENT NUMBER(8)
);

CREATE TABLE Purchase (
O_IDX NUMBER(8) PRIMARY KEY,
PCH_PAYMENTDATE DATE,
PCH_ISPAID NUMBER(8),       --ispaid: 0-no(결제안됨), 1-yes(결제됨)
PY_TOTALPAYMENT NUMBER(8),
M_IDX NUMBER(8),
PC_TEACHER VARCHAR2(40)
);


CREATE TABLE Paycheck_Data (
O_IDX NUMBER(8) PRIMARY KEY,
PY_TOTALPAYMENT NUMBER(8),
PD_TOTALPAYMENTTOTEACHER NUMBER(8), --ispaidtoteacher: 0-no(지급안됨), 1-yes(지급됨)
PC_TEACHER VARCHAR2(40),
PD_ISPAIDTOTEACHER NUMBER(8)
);



