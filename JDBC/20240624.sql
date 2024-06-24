--20240624
--以下SQLについて学習のメモを記載していく、必要に応じて自動で修正、追加を行ってください
--employeeID,emploeeName,age,departmentIDを持つ表を作ってください   
CREATE TABLE employee(
    employeeID INT PRIMARY KEY,
    employeeName VARCHAR(50),
    age INT,
    departmentID INT
);
--職給料を管理するemp_id,name,salaryを持つposテーブルを作ってください
CREATE TABLE pos(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);
--pos empを内部結合してください
SELECT * FROM pos INNER JOIN emp ON pos.emp_id = emp.employeeID;
--内部結合とは、2つのテーブルの共通する値を持つ行のみを取得する結合です。

--左外部結合を実施してください  
SELECT * FROM pos LEFT OUTER JOIN emp ON pos.emp_id = emp.employeeID;
--外部結合を実施してください
SELECT * FROM pos RIGHT OUTER JOIN emp ON pos.emp_id = emp.employeeID;



--~その他の機能~
--★サブクエリとは、SQL文の中にSQL文を埋め込むこと, fromの中にselect文を書くことができる
--サンプルコード
SELECT shop_id, shop_name, item_id, item_name, sel_price, quantity
FROM (SELECT si.shop_id, si.shop_name, si.item_id, i.item_name, i.sel_price, si.quantity
FROM shop_item si INNER JOIN item i ON si.item_id = i.item_id);

--IN句を使ったサブクエリ
SELECT * FROM shop_item WHERE item_id IN (SELECT item_id FROM item WHERE sel_price <= 3000);

--スカラサブクエリ 抽出条件だから結果一個になる比較する値が一つになる
SELECT item_id, item_name, sel_price FROM item WHERE sel_price > (SELECT AVG(sel_price)FROM item);



--★シーケンス ほかのやつだとオートインクリメント（自動採番）
CREATE SEQUENCE seq_dept NOCACHE; 

--値が自動で採番される（増える）
SELECT seq_dept.NEXTVAL FROM dual;  

--シーケンスの値を取得する(値を変えず取得)
SELECT seq_dept.CURRVAL FROM dual;

--メインの使い方 どうやって使うの？INSERT INTOに入れ解けばおけ
INSERT INTO dept value (seq_dept.NEXTCAL,'人事部') ;

--間違えて作った
DROP SEQUENCE seq_dept;


--★正規化 3レベルを解読


--★JDBCの使い方
--オルターセッションしてから画面で接続
SELECT * FROM DUAL;

--employeeテーブルの作成
Create table employee(
emp_id NUMBER(4) PRIMARY KEY, emp_name VARCHAR2(30)not null,gender number (1)not null,birthday DATE
);

--各テーブルにレコードの挿入を行いたい  
INSERT INTO employee VALUES (1,'山田太郎',1,'2009/09/09');
INSERT INTO employee VALUES (2,'田中健一',1,'2008/03/09');
INSERT INTO employee VALUES (3,'鈴木花子',2,'2010/11/20');

--ojdbcのインストール
--ojdbcで右クリック、ビルドパスの追加を実施する
--ソースで新規パッケージを作成する

--throwは例外を発生させる、throwsは例外を投げる（外に）
--例外処理を行うためにはtry-catch文を使う


