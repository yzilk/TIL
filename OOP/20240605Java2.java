import java.text.SampleDateFormat;
import java.util.Date;
//研修においてはjava.utilを使用するので注意


//以下　日付文字チェックサンプルコード
package lesson19;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Sample1906 {
    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        String inputDataString;

        do {
            System.out.println("「yyyy/MM/dd」の形式で日付を入力してください"); // ユーザーに日付の形式を指示

            inputDataString = reader.readLine(); // ユーザーから入力を受け取る

        } while (isIllegalDate(inputDataString)); // 間違っている場合は繰り返す

        System.out.println("入力した日付は正しい内容です"); // 正しい場合のメッセージ
    }

    // 日付が正しいかどうかをチェックするメソッド
    private static boolean isIllegalDate(String inputDateString) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

        sdf.setLenient(false); // 厳密なチェック

        try {
            sdf.parse(inputDateString); // チェックに失敗すると例外発生する
            return false; // 正しい
        } catch (ParseException e) { // 発生した例外をキャッチする
            return true; // 間違い
        }
    }
}
