# language: ja

フィーチャ: ユーザーとしてサインイン/サインアウトしたい

  背景:
    前提   次のユーザーが存在する:
      | email             | password |
      | alice@example.com | password |

  シナリオ: サインインする
    前提   "トップ" ページを表示する

    もし   "Email" に "alice@example.com" と入力する
    かつ   "Password" に "password" と入力する
    かつ   "Sign in" ボタンをクリックする

    ならば "Sign out" と表示すること

  シナリオ: サインアウトする
    前提   ユーザー "alice@example.com" としてサインインする
    かつ   "トップ" ページを表示する

    もし   "Sign out" をクリックする

    ならば "Sign in" と表示すること
