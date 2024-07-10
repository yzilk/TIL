--初期設定
ALTER SESSION SET CONTAINER = XEPDB1;
CREATE USER spring_user IDENTIFIED BY systemsss;
GRANT ALL PRIVILEGES TO spring_user;



--★値の変更
SELECT *FROM employee;
UPDATE employee SET emp_pass = '7777' WHERE emp_id = 1;
commit;

/*★復習
外部参照制約
①使ってるやつは消せない
②使ってないやつは登録できない


★hereをくっつけて全部に反映しないようにする
*/
UPDATE employee SET address = '神奈川県',gender = 2 WHERE emp_id = 1;

--物理削除
DELETE FROM employee WHERE emp_id=3;

--見る
SELECT *FROM employee;

--emp_idのupdate
UPDATE employee SET emp_pass = '7777' WHERE emp_id = 1;

commit;

UPDATE employee SET address = '神奈川県',
                    gender = 2 WHERE emp_id = 1;

DELETE FROM employee WHERE emp_id=3;
SELECT * FROM employee;

UPDATE emplyee SET delete_frag WHERE emp_id = 3;

--表を作成
CREATE TABLE item 
(item_id CHAR(4) PRIMARY KEY, 
 item_name VARCHAR2(100) NOT NULL, 
 category_id NUMBER NOT NULL, 
 sel_price NUMBER, 
 pur_price NUMBER, 
 reg_date DATE
 ); 

 --登録
INSERT INTO item VALUES ('0001','シャツ',1,1000,500,'2009-09-20'); 
INSERT INTO item VALUES ('0002','ホッチキス',2,500,320,'2009-09-11'); 
INSERT INTO item VALUES ('0003','セーター',1,4000,2800,NULL); 
INSERT INTO item VALUES ('0004','包丁',3,3000,2800,'2009-09-20'); 
INSERT INTO item VALUES ('0005','フライパン',3,5000,2800,'2009-01-15'); 
INSERT INTO item VALUES ('0006','フォーク',3,NULL,2800,'2009-09-20'); 
INSERT INTO item VALUES ('0007','スプーン',3,790,2800,'2008-04-28'); 
INSERT INTO item VALUES ('0008','ボールペン',2,NULL,2800,'2009-11-11'); 
COMMIT; 

--見る
SELECT *FROM item;

--★演算子
-- AND演算子(かつ)
SELECT * FROM item WHERE category_id = 3 AND sel_price >= 3000;
-- OR演算子(または)
SELECT * FROM item WHERE category_id = 3 OR sel_price >= 3000;
-- NOT演算子(否定)
SELECT * FROM item WHERE NOT sel_price >= 1000;

--★AND
SELECT *FROM item WHERE category_id = 3 AND sel_price >= 3000;

--★OR
SELECT *FROM item WHERE category_id = 3 OR sel_price >= 3000;

SELECT *FROM item;

--★like
SELECT item_name FROM item WHERE item_name LIKE '%ー%';
SELECT item_name FROM item WHERE item_name LIKE 'プ%';

--★bitween
SELECT * FROM item WHERE sel_price BETWEEN 500 AND 3000;
SELECT * FROM item WHERE reg_date BETWEEN '2008/4/28' AND '2009/9/11';


--指定した数値のものだけ出す
SELECT item_name, sel_price FROM item WHERE sel_price IN (500,790,1000);


/*
純粋な件数はCount* 
列を指定するときはCount列指定→ nullを除外する
*/
SELECT COUNT (*) FROM item;
SELECT COUNT (sel_price)FROM item;


--★sum
SELECT SUM (sel_price) FROM item;
SELECT AVG (sel_price)  FROM item;

--★二桁パターン
SELECT ROUND(AVG(sel_price),2) FROM item;


--★値の変更
SELECT *FROM employee;
UPDATE employee SET emp_pass = '7777' WHERE emp_id = 1;
commit;

/*★処理が終わったらコミットで確定
ミスがあればロールバックでの取り消し


★NULLとの比較は
IS null　ではない IS NOT NULとして使用
WHERE句で使用

★WHEREの中で
LIKE フ　フが入ってる出して！
％フ、最後がフのやつ出して！
フ％、最初がフのやつ出して！
％フ％、フのやつ出して！


★任意の最大値と最小値を出す
*/
SELECT MAX(sel_price), MIN(sel_price) FROM item;

--★構文GROUP BY 集約
SELECTS category_id, COUNT(*) FROM item GROUP BY category_id;


--★グループに集約すると まとめた中での値を求められる-- 列全体　だと８件
SELECT COUNT(*) FROM item GROUP BY category_id;
SELECT COUNT(*) FROM item ;

--★セレクト句には集約キーと集約関数しか書けない
SELECT MAX (sel_price) item_name FROM item  GROUP BY category_id;

SELECT category_id ,count(category_id ) from item group by category_id;
--集約した要素に関してぎゅっとするイメージ

--★実行順序
SELECT pur_price, COUNT(*) FROM item WHERE category_id =1 GROUP BY pur_price
/* 1 . FROM item WHERE category_id =1
巨大なデータから件数を少なくするイメージ

2.持ってきたものに対してグループ化を行う
GROUP BY pur_price

3.最後にselect
SELECT pur_price, COUNT(*) 
この後セレクト句の前にどんどん要素が増えてくるイメージ
例えばwhereで集約関数＝？条件が使えないのでHavingでまた関数を入れる
*/
SELECT category_id ,count(*) FROM item GROUP BY category_id HAVING count(*) = 2;

--pur順にしつつ、item_id順に並べる
SELECT * FROM item ORDER by pur_price DESC ,item_id ASC;

--item_idの順番にして名前を変えながら出力
SELECT category_id as cate ,item_name as iname , item_id iid FROM item ORDER BY item_id ASC;

--★内部結合はある者同士
SELECT si.shop_id,si.shop_name,si.item_id ,i.item_name,i.sel_price,si.quantity FROM shop_item si INNER JOIN item i ON si.item_id = i.item_id;
/*
SELECT si.shop_id,si.shop_name,si.item_id ,i.item_name,i.sel_price,si.quantity


FROM shop_item si

INNER JOIN item i ON si.item_id = i.item_id;

★左外部決豪は左のやつは全部出して右の表でないやつはNULLになるヨ
左外部結合＝＝左の情報をベースにジョインするヨ
*/

