# language: ja

@javascript
フィーチャ: ユーザーとして支出の一覧を見たい

  背景:
    前提   次のユーザーが存在する:
      | email             |
      | alice@example.com |
      | bob@example.com   |
    かつ   "alice@example.com" が次の支出を登録している:
      |  費目  | 金額 | メモ     | 登録日     |
      | 会食費 | 2000 | 立ち飲み | 2014/04/10 |
    かつ   "bob@example.com" が次の支出を登録している:
      | 費目 | 金額 | メモ   | 登録日     |
      | 食費 | 1000 | 昼食代 | 2014/03/20 |
    かつ   ユーザー "alice@example.com" としてサインインする

  シナリオ: 過去に自分が登録した支出を閲覧する
    もし   "トップ" ページを表示する
    かつ   全ての Tooltips を開く

    ならば "立ち飲み" と表示すること
    かつ   "10" と表示すること
    かつ   "昼食代" と表示しないこと

  シナリオ: 支出登録のエラー発生時でも他のユーザーの支出が表示されない
    もし   "トップ" ページを表示する
    かつ   "OK" をクリックする
    かつ   全ての Tooltips を開く

    ならば "立ち飲み" と表示すること
    かつ   "10" と表示すること
    かつ   "昼食代" と表示しないこと
