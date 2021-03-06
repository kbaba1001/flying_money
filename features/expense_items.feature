# language: ja

フィーチャ: ユーザーとして、費目を追加/削除したい
  なぜならば、ユーザーが自分で作った費目で支出を管理したいからだ

  背景:
    前提   次のユーザーが存在する:
      | email             |
      | alice@example.com |
    かつ   ユーザー "alice@example.com" としてサインインする
    かつ   "トップ" ページを表示する
    かつ   費目の設定ボタンをクリックする

  シナリオ: 費目を追加する
    もし   "名前" に "生活費" と入力する
    かつ   "OK" をクリックする

    ならば "生活費" と表示すること

  シナリオ: 表示順の初期値を表示する
    ならば "順番" フィールドに "8" と表示すること

  シナリオ: 費目を削除する
    前提   "食費" と表示すること
    かつ   "交通費" と表示すること
    かつ   "会食費" と表示すること
    かつ   "教育費" と表示すること
    かつ   "娯楽費" と表示すること
    かつ   "医療費" と表示すること
    かつ   "雑費" と表示すること

    もし   "雑費" の削除リンクをクリックする

    ならば "食費" と表示すること
    かつ   "交通費" と表示すること
    かつ   "会食費" と表示すること
    かつ   "教育費" と表示すること
    かつ   "娯楽費" と表示すること
    かつ   "医療費" と表示すること
    かつ   "雑費" と表示しないこと
