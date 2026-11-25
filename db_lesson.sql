## Q1,新たに部署のテーブルを追加してください。

mysql> CREATE TABLE `departments`(
    -> department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> name VARCHAR(20) NOT NULL,
    -> created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -> updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> DESC departments;
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| Field         | Type         | Null | Key | Default           | Extra                                         |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| department_id | int unsigned | NO   | PRI | NULL              | auto_increment                                |
| name          | varchar(20)  | NO   |     | NULL              |                                               |
| created_at    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
4 rows in set (0.01 sec)


## Q2,peopleテーブルに新しいカラムを追加して、誰がどこに所属してるのかわかるようにしてください。

mysql> ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC people;
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+
| Field         | Type             | Null | Key | Default           | Extra                                         |
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+
| person_id     | int unsigned     | NO   | PRI | NULL              | auto_increment                                |
| name          | varchar(20)      | NO   |     | NULL              |                                               |
| email         | varchar(255)     | YES  | UNI | NULL              |                                               |
| department_id | int unsigned     | YES  |     | NULL              |                                               |
| age           | tinyint unsigned | YES  |     | NULL              |                                               |
| gender        | tinyint          | YES  |     | NULL              |                                               |
| created_at    | timestamp        | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at    | timestamp        | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+
8 rows in set (0.01 sec)


## Q3,department、people、reportsテーブルに指定された条件を満たすレコードを挿入してください。

mysql> INSERT INTO departments (name)
    -> VALUES
    -> ('営業'),
    -> ('開発'),
    -> ('経理'),
    -> ('人事'),
    -> ('情報システム');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM departments;
+---------------+--------------------+---------------------+---------------------+
| department_id | name               | created_at          | updated_at          |
+---------------+--------------------+---------------------+---------------------+
|             1 | 営業               | 2026-11-02 16:58:11 | 2026-11-02 16:58:11 |
|             2 | 開発               | 2026-11-02 16:58:11 | 2026-11-02 16:58:11 |
|             3 | 経理               | 2026-11-02 16:58:11 | 2026-11-02 16:58:11 |
|             4 | 人事               | 2026-11-02 16:58:11 | 2026-11-02 16:58:11 |
|             5 | 情報システム       | 2026-11-02 16:58:11 | 2026-11-02 16:58:11 |
+---------------+--------------------+---------------------+---------------------+
5 rows in set (0.00 sec)

mysql> INSERT INTO people (name, email, department_id, age, gender)
    -> VALUES
    -> ('山下だいき', 'yamashita@beyond-works.co.jp', 1, 30, 1),
    -> ('花澤かな', 'hanazawa@beyond-works.co.jp', 1, 36, 2),
    -> ('小野ゆうき', 'ono@beyond-works.co.jp', 1, 45, 1),
    -> ('早見さおり', 'hayami@beyond-works.co.jp', 2, 22, 2),
    -> ('石川かいと', 'ishikawa@beyond-works.co.jp', 2, 27, 1),
    -> ('佐藤あやね', 'satou@beyond-works.co.jp', 2, 38, 2),
    -> ('鈴村けんいち', 'suzumura@beyond-works.co.jp', 2, 50, 1),
    -> ('沢城みゆき', 'sawasiro@beyond-works.co.jp', 3, 44, 2),
    -> ('大塚あきお', 'otuka@beyond-works.co.jp', 4, 27, 1),
    -> ('上田れいな', 'ueda@beyond-works.co.jp', 5, 30, 2);
Query OK, 10 rows affected (0.00 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM people;
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name                  | email                        | department_id | age  | gender | created_at          | updated_at          |
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
|         1 | 鈴木たかし            | suzuki@beyond-works.co.jp    |          NULL |   20 |      1 | 2026-10-19 14:18:34 | 2026-10-19 14:18:34 |
|         2 | 田中ゆうこ            | tanaka@beyond-works.co.jp    |          NULL |   25 |      2 | 2026-10-19 14:29:22 | 2026-10-19 14:29:22 |
|         3 | 福田だいすけ          | hukuda@beyond-works.co.jp    |          NULL |   42 |      1 | 2026-10-19 14:29:22 | 2026-10-19 14:29:22 |
|         4 | 豊島はなこ            | toyoshima@beyond-works.co.jp |          NULL |   34 |      2 | 2026-10-19 14:29:22 | 2026-10-19 14:29:22 |
|         6 | 不思議沢みちこ        | NULL                         |          NULL | NULL |   NULL | 2026-10-19 14:29:22 | 2026-10-19 14:29:22 |
|         7 | 山下だいき            | yamashita@beyond-works.co.jp |             1 |   30 |      1 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|         8 | 花澤かな              | hanazawa@beyond-works.co.jp  |             1 |   36 |      2 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|         9 | 小野ゆうき            | ono@beyond-works.co.jp       |             1 |   45 |      1 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|        10 | 早見さおり            | hayami@beyond-works.co.jp    |             2 |   22 |      2 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|        11 | 石川かいと            | ishikawa@beyond-works.co.jp  |             2 |   27 |      1 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|        12 | 佐藤あやね            | satou@beyond-works.co.jp     |             2 |   38 |      2 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|        13 | 鈴村けんいち          | suzumura@beyond-works.co.jp  |             2 |   50 |      1 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|        14 | 沢城みゆき            | sawasiro@beyond-works.co.jp  |             3 |   44 |      2 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|        15 | 大塚あきお            | otuka@beyond-works.co.jp     |             4 |   27 |      1 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|        16 | 上田れいな            | ueda@beyond-works.co.jp      |             5 |   30 |      2 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
15 rows in set (0.00 sec)

mysql> INSERT INTO reports (person_id, content)
    -> VALUES
    -> (7, '書類の整理とファイリングを実施'),
    -> (8, '顧客データの入力と確認作業'),
    -> (9, '請求書の作成と内容のチェック'),
    -> (10, 'メールの確認と問い合わせ対応'),
    -> (11, '社内資料の作成とデータ集計'),
    -> (12, '備品の在庫確認と発注手続き'),
    -> (13, '契約書類の確認と整理を実施'),
    -> (14, '売上データの入力と集計作業'),
    -> (15, '郵便物の仕分けと発送準備'),
    -> (16, '会議資料の作成と印刷対応');
Query OK, 10 rows affected (0.00 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM reports;
+-----------+-----------+-----------------------------------------------+---------------------+---------------------+
| report_id | person_id | content                                       | created_at          | updated_at          |
+-----------+-----------+-----------------------------------------------+---------------------+---------------------+
|         1 |         1 | あいうえお                                    | 2026-10-28 16:39:50 | 2026-10-28 16:39:50 |
|         2 |         2 | かきくけこ                                    | 2026-10-28 16:44:48 | 2026-10-28 16:44:48 |
|         3 |         3 | さしすせそ                                    | 2026-10-28 16:44:48 | 2026-10-28 16:44:48 |
|         4 |         1 | たちつてと                                    | 2026-10-28 16:44:48 | 2026-10-28 16:44:48 |
|         5 |         2 | なにぬねの                                    | 2026-10-28 16:44:48 | 2026-10-28 16:44:48 |
|         6 |         3 | はひふへほ                                    | 2026-10-28 16:44:48 | 2026-10-28 16:44:48 |
|         7 |         1 | まみむめも                                    | 2026-10-28 16:44:48 | 2026-10-28 16:44:48 |
|         8 |         2 | やゆよ                                        | 2026-10-28 16:44:48 | 2026-10-28 16:44:48 |
|         9 |         3 | らりるれろ                                    | 2026-10-28 16:44:48 | 2026-10-28 16:44:48 |
|        10 |         5 | わをん                                        | 2026-10-28 16:44:48 | 2026-10-28 16:44:48 |
|        11 |         7 | 書類の整理とファイリングを実施                | 2026-11-09 16:19:29 | 2026-11-09 16:19:29 |
|        12 |         8 | 顧客データの入力と確認作業                    | 2026-11-09 16:19:29 | 2026-11-09 16:19:29 |
|        13 |         9 | 請求書の作成と内容のチェック                  | 2026-11-09 16:19:29 | 2026-11-09 16:19:29 |
|        14 |        10 | メールの確認と問い合わせ対応                  | 2026-11-09 16:19:29 | 2026-11-09 16:19:29 |
|        15 |        11 | 社内資料の作成とデータ集計                    | 2026-11-09 16:19:29 | 2026-11-09 16:19:29 |
|        16 |        12 | 備品の在庫確認と発注手続き                    | 2026-11-09 16:19:29 | 2026-11-09 16:19:29 |
|        17 |        13 | 契約書類の確認と整理を実施                    | 2026-11-09 16:19:29 | 2026-11-09 16:19:29 |
|        18 |        14 | 売上データの入力と集計作業                    | 2026-11-09 16:19:29 | 2026-11-09 16:19:29 |
|        19 |        15 | 郵便物の仕分けと発送準備                      | 2026-11-09 16:19:29 | 2026-11-09 16:19:29 |
|        20 |        16 | 会議資料の作成と印刷対応                      | 2026-11-09 16:19:29 | 2026-11-09 16:19:29 |
+-----------+-----------+-----------------------------------------------+---------------------+---------------------+
20 rows in set (0.00 sec)


## Q4,peopleテーブルにあるdepartment_idのNULLを、指定された条件に当てはまる値で埋めるためのクエリを作成してください。

mysql> UPDATE people SET department_id = 1 WHERE person_id = 1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET department_id = 2 WHERE person_id = 2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET department_id = 3 WHERE person_id = 3;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET department_id = 4 WHERE person_id = 4;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people SET department_id = 5 WHERE person_id = 6;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM people;
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name                  | email                        | department_id | age  | gender | created_at          | updated_at          |
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
|         1 | 鈴木たかし            | suzuki@beyond-works.co.jp    |             1 |   20 |      1 | 2026-10-19 14:18:34 | 2026-11-09 16:36:04 |
|         2 | 田中ゆうこ            | tanaka@beyond-works.co.jp    |             2 |   25 |      2 | 2026-10-19 14:29:22 | 2026-11-09 16:37:27 |
|         3 | 福田だいすけ          | hukuda@beyond-works.co.jp    |             3 |   42 |      1 | 2026-10-19 14:29:22 | 2026-11-09 16:38:32 |
|         4 | 豊島はなこ            | toyoshima@beyond-works.co.jp |             4 |   34 |      2 | 2026-10-19 14:29:22 | 2026-11-09 16:39:52 |
|         6 | 不思議沢みちこ        | NULL                         |             5 | NULL |   NULL | 2026-10-19 14:29:22 | 2026-11-09 16:40:51 |
|         7 | 山下だいき            | yamashita@beyond-works.co.jp |             1 |   30 |      1 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|         8 | 花澤かな              | hanazawa@beyond-works.co.jp  |             1 |   36 |      2 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|         9 | 小野ゆうき            | ono@beyond-works.co.jp       |             1 |   45 |      1 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|        10 | 早見さおり            | hayami@beyond-works.co.jp    |             2 |   22 |      2 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|        11 | 石川かいと            | ishikawa@beyond-works.co.jp  |             2 |   27 |      1 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|        12 | 佐藤あやね            | satou@beyond-works.co.jp     |             2 |   38 |      2 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|        13 | 鈴村けんいち          | suzumura@beyond-works.co.jp  |             2 |   50 |      1 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|        14 | 沢城みゆき            | sawasiro@beyond-works.co.jp  |             3 |   44 |      2 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|        15 | 大塚あきお            | otuka@beyond-works.co.jp     |             4 |   27 |      1 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|        16 | 上田れいな            | ueda@beyond-works.co.jp      |             5 |   30 |      2 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
15 rows in set (0.00 sec)


## Q5,年齢の降順で男性の名前と年齢を取得してください。

mysql> SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;
+--------------------+------+
| name               | age  |
+--------------------+------+
| 鈴村けんいち       |   50 |
| 小野ゆうき         |   45 |
| 福田だいすけ       |   42 |
| 山下だいき         |   30 |
| 石川かいと         |   27 |
| 大塚あきお         |   27 |
| 鈴木たかし         |   20 |
+--------------------+------+
7 rows in set (0.00 sec)


## Q6,テーブル・レコード・カラムという三つの単語を適切に使用して、下記のSQL文を日本語で説明してください。

SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

名前・メールアドレス・年齢のカラムを、peopleテーブルから、
営業部に所属する人のレコードに絞り、新しくレコードが作成された順に表示させる。


## Q7,二十代の女性と四十代の男性の名前一覧を同時に取得してください。

mysql> SELECT name FROM people WHERE age < 30 AND gender = 2 OR age BETWEEN 40 AND 49 AND gender = 1;
+--------------------+
| name               |
+--------------------+
| 田中ゆうこ         |
| 福田だいすけ       |
| 小野ゆうき         |
| 早見さおり         |
+--------------------+
4 rows in set (0.00 sec)


## Q8,営業部に所属する人だけを年齢の昇順で取得してください。

mysql> SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;
+-----------+-----------------+------------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name            | email                        | department_id | age  | gender | created_at          | updated_at          |
+-----------+-----------------+------------------------------+---------------+------+--------+---------------------+---------------------+
|         1 | 鈴木たかし      | suzuki@beyond-works.co.jp    |             1 |   20 |      1 | 2026-10-19 14:18:34 | 2026-11-09 16:36:04 |
|         7 | 山下だいき      | yamashita@beyond-works.co.jp |             1 |   30 |      1 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|         8 | 花澤かな        | hanazawa@beyond-works.co.jp  |             1 |   36 |      2 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
|         9 | 小野ゆうき      | ono@beyond-works.co.jp       |             1 |   45 |      1 | 2026-11-02 17:41:04 | 2026-11-02 17:41:04 |
+-----------+-----------------+------------------------------+---------------+------+--------+---------------------+---------------------+
4 rows in set (0.00 sec)


## Q9,開発部に所属している女性の平均年齢を取得してください。

mysql> SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2;
+-------------+
| average_age |
+-------------+
|     28.3333 |
+-------------+
1 row in set (0.00 sec)


## Q10,名前と部署名とその人が提出した日報の内容を同時に取得してください。

mysql> SELECT people.name, departments.name, reports.content
    -> FROM people INNER JOIN departments ON people.department_id = departments.department_id
    -> RIGHT JOIN reports ON people.person_id = reports.person_id;
+--------------------+--------------------+-----------------------------------------------+
| name               | name               | content                                       |
+--------------------+--------------------+-----------------------------------------------+
| 鈴木たかし         | 営業               | あいうえお                                    |
| 田中ゆうこ         | 開発               | かきくけこ                                    |
| 福田だいすけ       | 経理               | さしすせそ                                    |
| 鈴木たかし         | 営業               | たちつてと                                    |
| 田中ゆうこ         | 開発               | なにぬねの                                    |
| 福田だいすけ       | 経理               | はひふへほ                                    |
| 鈴木たかし         | 営業               | まみむめも                                    |
| 田中ゆうこ         | 開発               | やゆよ                                        |
| 福田だいすけ       | 経理               | らりるれろ                                    |
| NULL               | NULL               | わをん                                        |
| 山下だいき         | 営業               | 書類の整理とファイリングを実施                |
| 花澤かな           | 営業               | 顧客データの入力と確認作業                    |
| 小野ゆうき         | 営業               | 請求書の作成と内容のチェック                  |
| 早見さおり         | 開発               | メールの確認と問い合わせ対応                  |
| 石川かいと         | 開発               | 社内資料の作成とデータ集計                    |
| 佐藤あやね         | 開発               | 備品の在庫確認と発注手続き                    |
| 鈴村けんいち       | 開発               | 契約書類の確認と整理を実施                    |
| 沢城みゆき         | 経理               | 売上データの入力と集計作業                    |
| 大塚あきお         | 人事               | 郵便物の仕分けと発送準備                      |
| 上田れいな         | 情報システム       | 会議資料の作成と印刷対応                      |
+--------------------+--------------------+-----------------------------------------------+
20 rows in set (0.00 sec)


## Q11,日報を一つも提出していない人の名前一覧を取得してください。

mysql> SELECT p.person_id, p.name, r.content FROM people p LEFT OUTER JOIN reports r USING (person_id) WHERE content IS NULL;
+-----------+-----------------------+---------+
| person_id | name                  | content |
+-----------+-----------------------+---------+
|         4 | 豊島はなこ            | NULL    |
|         6 | 不思議沢みちこ        | NULL    |
+-----------+-----------------------+---------+
2 rows in set (0.00 sec)