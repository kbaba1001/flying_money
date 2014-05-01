# language: ja

フィーチャ: ユーザーとして支出を入力したい

  背景:
    前提 次のユーザーが存在する:
      | email             |
      | alice@example.com |
    かつ   ユーザー "alice@example.com" としてサインインする
    かつ   "トップ" ページを表示する

  シナリオ: 支出を追加する
    もし   "費目" として "食費" を選択する
    かつ   "金額" に "500" と入力する
    かつ   "備考" に "増税によるつつましい昼食" と入力する
    かつ   "OK" をクリックする

    ならば "支出一覧" に "食費" と表示すること
    かつ   "支出一覧" に "500円" と表示すること
    かつ   "支出一覧" に "増税によるつつましい昼食" と表示すること

  シナリオ: 必須項目が空の場合エラーメッセージを表示すること
    もし   "OK" をクリックする

    かつ   "金額を入力してください。" と表示すること
