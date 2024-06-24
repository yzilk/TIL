--練習問題
--education スキーマ内にシーケンスを作成しなさい。シーケンス名は dept_seq とし、初期値は 10、増減値は 1 としなさい
CREATE SEQUENCE dept_seq START WITH 10 INCREMENT BY 1;

--dept テーブルにデータを登録しなさい。詳細については下記を参考にすること。なお、deptno カラムに格納する値については、dept_seq シーケンスを使用すること。
INSERT INTO dept VALUES (dept_seq.NEXTVAL, '人事部', '東京');
