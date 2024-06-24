-★RDBの接続
ALTER SESSION SET CONTAINER = XEPDB1;
CREATE USER sssuser IDENTIFIED BY systemsss;
GRANT ALL PRIVILEGES TO SSSUSER;
-- AlTER SESSION SET CONTAINER = XEPDB1;//コンテナの変更、XEPDB1はデフォルトで作成されるコンテナ名
-- CREATE USER ユーザー名 IDENTIFIED BY パスワード;    
-- GRANT ALL PRIVILEGES（これはALL権限に変更している） TO ユーザー名;//権限を付与

--★セレクト文
SELECT * FROM dual;
SELECT * FROM sssuser.dual; 

--★USERの名前を間違えちゃったとか セットコンテナをしてからDROP USERをする
--ALTER SESSION SET CONTAINER = XEPDB1;
DROP USER sssuser CASCADE;
CREATE USER sssuser IDENTIFIED BY systemsss;

/*★Oracleのデータ型
数値 NUMBER
*/
Create Table テーブル名(
    no NUMBER       --オラクルは整数も少数もNumberを使用
    name VARCHAR2(10 CAHR) --文字列型(10文字入れる) n byteを書くと何文字かわからん
    age NUMBER 
    DATE---時間分秒も格納してるよ
    TIMESTAMP(n) 
);

/*
★使用不可
日本語は原則使用しない
#$?は使用不可

★固定長文字列型、可変長文字列型
研修は可変長文字列型を使用

★4つの制約
①一意制約　unique　重複はダメno.1,no.2,no.2はダメ

②not null 制約 nullは禁止

③主キー制約
テーブルに格納されているレコードを識別するためのキー

④外部キー制約　ほかのテーブルの一意キーを参照する
参照先に存在しないデータを入れることができなくなる

★制約の書き方
表制約にNOTNULL制約は書けない
表制約だけ名前を記述する必要がある

★チェック制約とデフォルト制約
０，１　１しか入れられないようにする→チェック制約
TimeStamp型にデフォルトでシステム日付を指定しておくと便利　→デフォルト制約

★テーブルの削除
DROP TABLE テーブル名;
外部参照してるやつは消えない

★CREDとは
Create Read Update Delete
登録、参照、更新、削除

★ASで名前つけられる
この時日本語を書くときはダブルクォーテーションで囲む
列にも別名を付けられるが、AS句は使用しない（オラクルだけ！）
*/

--★重複を省いて出力する
SELECT DISTINCT address FROM employe


--★ 1.ユーザーと権限(1)
ALTER SESSION SET CONTAINER = xepdb1;
CREATE USER education IDENTIFIED BY systemsss;

--★ 1.ユーザーと権限(2)
GRANT ALL PRIVILEGES TO education;

