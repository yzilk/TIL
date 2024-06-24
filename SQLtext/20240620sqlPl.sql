CREATE TABLE dept (
    dept_id NUMBER(2) PRIMARY KEY,
    dept_name VARCHAR2(20) NOT NULL
    
);
//1行下の文を訂正
ｓ
ALTER TABLE dept ADD COLUMN 'loc' VARCHAR2(100) ;


CREATE TABLE emproyee(
    emp_id NUMBER(5) PRIMARY KEY,
    emp_pass VARCHAR2(10) NOT NULL,
    emp_name VARCHAR2(20) NOT NULL,
    gender NUMBER(1) NOT NULL,
    address VARCHAR2(30),
    birthday DATE,
    dept_id NUMBER(2) NOT NULL REFERENCES dept(dept_id),
)

//テーブルの削除
DROP TABLE emproyee;
//テーブル強制削除
DROP TABLE emproyee CASCADE CONSTRAINTS;

--インサート文
INSERT INTO dept VALUES(1, '総務部');
INSERT INTO dept VALUES(2, '営業部');
INSERT INTO dept VALUES(3, '経理部 ');
INSERT INTO dept VALUES(4, '資材部');

INSERT INTO emproyee VALUES(1,'1111','山田太郎',1,'千葉県','2009/09/09','1');
INSERT INTO emproyee VALUES(2,'2222','高橋健一',1,'埼玉県','2009/09/10','2');
INSERT INTO emproyee VALUES(3,'3333','鈴木花子',2,'東京都','2009/09/10','3');
INSERT INTO emproyee VALUES(4,'4444','佐々木良子',2,'埼玉県','2009/09/14','4');


INSERT INTO dept VALUES(1, 'システム企画本部','東京都江東区豊洲3-3-3');
INSERT INTO dept VALUES(2, 'ソリューション事業部','神奈川県川崎市中原区上小田中4-1-1');
INSERT INTO dept VALUES(3, '営業','大阪府大阪中央区城見');
INSERT INTO dept VALUES(4, '資材部',null);
