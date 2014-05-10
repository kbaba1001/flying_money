# language: ja

フィーチャ: ユーザーとして月毎の支出合計額を見たい
  なぜなら支出の増減を月毎に考えることで金の使い方を改善したいからだ

  シナリオ: 月毎の支出合計値を見たい
    前提   次のユーザーが存在する:
      | email             |
      | alice@example.com |
      | bob@example.com   |
    かつ   "alice@example.com" が次の支出を登録している:
      | 費目   | 金額 | メモ     | 登録日     |
      | 会食費 | 2000 | 立ち飲み | 2014/03/30 |
      | 雑費   |  500 |          | 2014/03/31 |
      | 食費   | 3000 |          | 2014/04/01 |
      | 交通費 |  160 | 山手線   | 2014/04/30 |
      | 娯楽費 | 5000 | DVD      | 2014/05/01 |
    かつ   ユーザー "alice@example.com" としてサインインする

    もし   "トップ" ページを表示する

    ならば "2014/03" と表示すること
    かつ   "2,500円" と表示すること
    かつ   "2014/04" と表示すること
    かつ   "3,160円" と表示すること
    かつ   "2014/05" と表示すること
    かつ   "5,000円" と表示すること
