--★whereをくっつけて全部に反映しないようにする
UPDATE employee SET address = '神奈川県',
                    gender = 2 WHERE emp_id = 1;

--★物理削除
DELETE FROM employee WHERE emp_id=3;


--★値の変更
SELECT *FROM employee;
UPDATE employee SET emp_pass = '7777' WHERE emp_id = 1;
commit;

*/★処理が終わったらコミットで確定
ミスがあればロールバックでの取り消し
/*

★NULLとの比較は
IS null　ではない IS NOT NULとして使用
WHERE句で使用
