//★接続したいとき　Connectionオブジェクトで接続をおこなう
import java.sql.Connection;


//★例外の違い
ublic static void main(String[] args) {
		Connection connection = null;
		try {
			//DB に接続
			//例外は呼び出し元（mainメソッド）で処理される
            connection = DBManager.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//DB との接続を切断
            //例外は呼んだ先（DBManager）で処理される
			DBManager.close(connection);
		}

        //★ステートメント^プリペアードステートメントとは
        //SQL文を実行するためのオブジェクト
        //ステートメントはSQL文をそのまま実行する
        Connection connection = DBManager.getConnection();
        String sql = "SELECT * FROM employee";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        //覚えましょう
        //検索はexecuteQueryメソッドを使用
        //更新はexecuteUpdateメソッドを使用
        //ResultSetはカーソルのイメージ、nextで次の行に移動
        //ResultSet#nextメソッドは次の行があればtrue、なければfalseを返す
        while (resultSet.next()) {
            //カーソルが指す行のデータを取得
            int id = resultSet.getInt("id");//列名を指定
            String name = resultSet.getString("name");
            int age = resultSet.getInt("age");
            System.out.println("ID:" + id + ", NAME:" + name + ", AGE:" + age);
        }