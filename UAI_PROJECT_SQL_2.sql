--�ۼ���: 19.08.12.��
--**(LHE) ���� �۾� ȯ�濡�� DB�� ����� �׽�Ʈ�� �� ���� ���� ���̺�/������ ���� ���� �Դϴ�.
--        ���� �׽�Ʈ�� ����ȣ��Ʈ/SCOTT ������ ���̺��� ���� �׽�Ʈ ���ּ���.
--  Ȯ���� ���̺� ���: �����ͺ��̽� �� PDF ����
-- (������ ���̺��� �����ߴ� �е��� ����� ALTER/DROP���� ���� ����) CREATE �������� ������� �� ��ɾ �������ּ���.
-- ��������� �ŽǺ��� ���̺� drop, delete�� �����ϰ� �ϱ� ���� CASCADE ������ �ɾ��ֽð� ������ ������ ALTER TABLE�� ���ּ���.


-- ���� ���̺��� ������� �����
ALTER TABLE Board_Content DROP CONSTRAINT fk_members;
ALTER TABLE Board_Content DROP CONSTRAINT fk_product;
ALTER TABLE Board_Content DROP CONSTRAINT FK_admin;

ALTER TABLE Orders DROP CONSTRAINT fk_product2;
ALTER TABLE Orders DROP CONSTRAINT fk_members2;

-- ���� ���̺� �����
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

--CREATE TABLE/SEQUENCE ����

CREATE TABLE Members(
M_IDX NUMBER(8) PRIMARY KEY,
M_ID VARCHAR2(40),
M_PW VARCHAR2(40),
M_NAME VARCHAR2(40),
M_NICK VARCHAR2(40),
M_PHONE VARCHAR2(40),
M_ADDRESS VARCHAR2(100),
M_GENDER VARCHAR2(20),      --Gender: M-����, F-����
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
P_TYPE NUMBER(8),       --P_Type: 0-���, 1-IT/��ǻ��, 2-�̼�, 3-����, 4-������, 5-��Ÿ
P_ORIGINALPRICE NUMBER(8),
P_DISCOUNTRATE FLOAT(5),
P_TOTALSALECOUNT NUMBER(8),
P_POSTDATE DATE,
P_COMMISSIONRATE FLOAT(5)
);

CREATE SEQUENCE Product_Seq;

CREATE TABLE Board_Content (
B_IDX NUMBER(8) PRIMARY KEY,
B_TYPE NUMBER(8),       --B_Type: 0-��������, 1-����, 2-qna
B_TITLE VARCHAR2(100),
B_CONTENT VARCHAR2(1000),
B_POSTDATE DATE,
B_COUNT NUMBER(8),
B_ISHIDDEN NUMBER(8),   --ishidden: 0-no(�������̴�), 1-yes(��б��̴�)
B_PW VARCHAR2(40),
B_QCATEGORY NUMBER(8),  --qcategoty: 0-��ǰ����, 1-��������
B_ISPOST NUMBER(8),     --ispost: 0-no(����̴�), 1-yes(���̴�)
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
PC_STARTDATE DATE,              --������ �����ϰ� �ϱ� ���� Duration ��� ������/�������� date�������� �����ϵ��� Į������.
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
PY_PAYMENTMETHOD NUMBER(8),     --paymentmethod: 0-������, 1-ī��
PY_TOTALPAYMENT NUMBER(8)
);

CREATE TABLE Purchase (
O_IDX NUMBER(8) PRIMARY KEY,
PCH_PAYMENTDATE DATE,
PCH_ISPAID NUMBER(8),       --ispaid: 0-no(�����ȵ�), 1-yes(������)
PY_TOTALPAYMENT NUMBER(8),
M_IDX NUMBER(8),
PC_TEACHER VARCHAR2(40)
);


CREATE TABLE Paycheck_Data (
O_IDX NUMBER(8) PRIMARY KEY,
PY_TOTALPAYMENT NUMBER(8),
PD_TOTALPAYMENTTOTEACHER NUMBER(8), --ispaidtoteacher: 0-no(���޾ȵ�), 1-yes(���޵�)
PC_TEACHER VARCHAR2(40),
PD_ISPAIDTOTEACHER NUMBER(8)
);



