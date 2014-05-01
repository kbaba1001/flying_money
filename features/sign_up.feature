# language: ja

@wip
フィーチャ: ユーザーとしてサインアップしたい
  なぜならサービスを利用したいからだ

  シナリオ: サインアップする
    前提   "サインアップ" ページを表示する

    もし   "Email" に "alice@example.com" と入力する
    かつ   "Password" に "password" と入力する
    かつ   "Password confirmation" に "password" と入力する
    かつ   "Sign up" をクリックする

    ならば "Sign out" と表示すること
    かつ   "食費" と表示すること
