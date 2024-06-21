0621　practiceAnser
-- 6. レコードの削除 
-- (1) emp テーブルから empno が ’006’ のデータを削除して、下記のような結果になるようにしなさい。 

DELETE FROM emp WHERE empno = '006'; 

COMMIT;

-- 7. 演算子 
-- (1) emp テーブルからデータを検索しなさい。上司が NULL でないデータを検索する
SELECT ename, superior FROM emp WHERE superior IS NOT NULL;

-- (2) emp テーブルからデータを検索しなさい。給与が 300000 以下のデータを検索する
SELECT ename, sal, job FROM emp WHERE sal <= 300000; 


-- (3) emp テーブルからデータを検索しなさい。職種が SE かつ部署 NO が 01 のデータを検索する
SELECT ename, job, deptno FROM emp WHERE job = 'SE' AND deptno = 

-- (4) emp テーブルからデータを検索しなさい。職種が PL または部署 NO が 01 のデータを検索する
SELECT ename, job, deptno FROM emp WHERE job = 'PL' OR deptno = '01'; 

-- (5) emp テーブルからデータを検索しなさい。社員名に”城”の文字が含まれているデータを検索する
SELECT empno, ename FROM emp WHERE ename LIKE '%城%'; 

-- (6) emp テーブルからデータを検索しなさい。入社日が2000年1月1日から2001年12月31日までのデータを検索
SELECT ename, hiredate FROM emp WHERE hiredate BETWEEN '2000/01/01' AND '2001/12/31'; 


-- 8. 集約関数 
-- (1) emp テーブルからデータを検索しなさい。emp テーブルの行数を検索する
SELECT COUNT(*) AS "行数" FROM emp; 

-- (2) emp テーブルからデータを検索しなさい。給与の最大値、最小値、合計値を検索する
SELECT MAX(sal) AS "給与(最大値)", MIN(sal) AS "給与(最小値)", SUM(sal) AS "給与(合計値)" FROM emp;


-- 9. グループ化 
-- (1) emp テーブルからデータを検索しなさい。職種に対する行数を検索する
SELECT job, COUNT(*) AS "行数" FROM emp GROUP BY job; 

-- 10. 並び替え 
-- (1) emp テーブルからデータを検索
SELECT empno, ename FROM emp ORDER BY empno DESC; 

-- (2) emp テーブルからデータを検索し、DEPTNO 昇順、SAL 降順で表示しなさい
SELECT deptno,ename,sal FROM emp ORDER BY deptno ASC, sal DESC; 

-- 11. 結合 
-- (1) dept テーブル及び emp テーブルからデータを検索しなさい
SELECT 
 e.empno, 
 e.ename, 
 d.dname 
 FROM 
 emp e INNER JOIN dept d 
 ON e.deptno = d.deptno; 

-- (2) dept テーブル及び emp テーブルからデータを検索
 SELECT 
 e.empno, 
 e.ename, 
 d.dname 
 FROM 
 emp e RIGHT OUTER JOIN dept d 
 ON e.deptno = d.deptno; 







