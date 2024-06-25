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

//練習問題Olacre
-- 1. ユーザーと権限 
--(1) ユーザーを作成しなさい。
CREATE USER education IDENTIFIED BY systemsss; 

--(2) education ユーザーに対し、
SELECT ANY DECTIONARY 権限以外の全ての権限を付与しなさい。 
GRANT ALL PRIVILEGES TO education; 

-- 2. テーブル操作 
-- (1)
CREATE TABLE dept( 
 deptno VARCHAR2(2) PRIMARY KEY, 
dname VARCHAR2(50) NOT NULL, 
loc VARCHAR2(100) 
); 

-- (2) education スキーマ内にテーブルを作成しなさい。
CREATE TABLE emp ( 
 empno VARCHAR2(3) PRIMARY KEY, 
 ename VARCHAR2(20) NOT NULL, 
 superior VARCHAR2(20), 
 hiredate DATE NOT NULL, 
 sal NUMBER NOT NULL, 
 job VARCHAR2(30), 
 deptno VARCHAR2(2), 
 CONSTRAINT fk_deptno FOREIGN KEY(deptno) REFERENCES dept(deptno) 
 ); 

--(3) 上記(2)で作成した emp テーブルを作成する SQL 文に、適切なコメントを付与しなさい。 
CREATE TABLE emp ( 
 empno VARCHAR2(3) PRIMARY KEY, -- 社員 NO 
 ename VARCHAR2(20) NOT NULL, -- 社員名 
 superior VARCHAR2(20), -- 上司 
 hiredate DATE NOT NULL, -- 入社日 
 sal NUMBER NOT NULL, -- 給与 
 job VARCHAR2(30) , -- 職種 
 deptno VARCHAR2(2), -- 部署 NO 
 /* 
 * 部署テーブルの deptno（部署 NO）カラムを 
 * 外部参照制約する制約を付加する。 
 */ 
 CONSTRAINT fk_deptno FOREIGN KEY(deptno) REFERENCES dept(deptno) 
); 

-- 3. レコードの登録 
--(1) emp テーブル及び dept テーブルにデータを登録しなさい。
-- dept テーブル 
INSERT INTO dept VALUES ('01','システム企画本部','東京都江東区豊洲 3-3-3'); 
INSERT INTO dept VALUES ('02','ソリューション事業部','神奈川県川崎市中原区
上小田中 4-1-1'); 
INSERT INTO dept VALUES ('03','営業部','大阪府大阪市中央区城見 1-4-24'); 
INSERT INTO dept VALUES ('04','総務部',NULL); 
COMMIT; 

 -- emp 
 INSERT INTO emp VALUES ('001', '鈴木 仁', NULL, '2000/01/01', 600000, 
 'PL', '01'); 
 INSERT INTO emp VALUES ('002','佐藤 幸助','鈴木 仁','2000/03/22',350000,'
 ブリッジ SE','01'); 
 INSERT INTO emp VALUES ('003', '高橋 ひとみ', NULL, '2000/01/01', 500000, 
 'PL', '02'); 
 INSERT INTO emp VALUES ('004', '大前 貢', '鈴木 仁', '2000/04/01', 320000, 
 'SE', '01'); 
 INSERT INTO emp VALUES ('005', '真田 博之', '鈴木 仁', '2001/04/01', 
 300000, 'SE', '01'); 
 INSERT INTO emp VALUES ('006', '大城 勉', '鈴木 仁', '2001/04/01', 300000, 
 'SE', '01'); 
 INSERT INTO emp VALUES ('007', '神城 陣', '高橋 ひとみ', '2001/04/01', 
 280000, 'PG', '02'); 
 INSERT INTO emp VALUES ('008', '結城 瞳', '高橋 ひとみ', '2002/04/01', 
 280000, 'PG', '02'); 
 INSERT INTO emp VALUES ('009', '博多 弁', '高橋 ひとみ', '2003/04/01', 
 260000, 'PG', '02'); 
 INSERT INTO emp VALUES ('010', '小山 浩', '高橋 ひとみ', '2006/04/01', 
 180000, 'デザイナー', '02'); 
 
 COMMIT;

-- 4. レコードの検索 
-- (1) dept テーブルからデータを検索しなさい。
SELECT * FROM dept; 

-- (2) emp テーブルからデータを検索しなさい。
SELECT ename, superior, hiredate FROM emp; 

-- (3) dept テーブルからデータを検索しなさい
SELECT * FROM dept WHERE deptno = '02'; 

-- (4) emp テーブルからデータを検索しなさい
SELECT empno, ename, hiredate, job FROM emp WHERE job = 'PG'; 
