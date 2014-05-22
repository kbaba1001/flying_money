# language: ja

フィーチャ: ユーザーとして過去の支出を削除したい

  背景:
    前提   次のユーザーが存在する:
      | email             |
      | alice@example.com |
    かつ   "alice@example.com" が次の支出を登録している:
      |  費目  | 金額 | 登録日     |
      | 会食費 | 2000 | 2014/04/10 |
      | 医療費 | 3200 | 2014/04/11 |
    かつ   ユーザー "alice@example.com" としてサインインする
    かつ   "トップ" ページを表示する

  シナリオ: 過去に自分が登録した支出を削除する
    もし   "トップ" ページを表示する

    ならば "2,000円" と表示すること
    かつ   "3,200円" と表示すること

    もし   "2,000円" の削除ボタンをクリックする

    ならば "2,000円" と表示しないこと
    かつ   "3,200円" と表示すること
