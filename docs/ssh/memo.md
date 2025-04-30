# 概要
GitHubにsshキーを設定してpushするまでの作業メモ。

# 作業メモ
## ssh key作成
```ssh-keygen -t ed25519```

![alt text](assets/image.png)

## git hubへの登録
![alt text](assets/image-1.png)
![alt text](assets/image-2.png)

## ssh config設定
code ~/.ssh/config
```
Host github.com
    HostName github.com
    IdentityFile ~/.ssh/id_ed25519.pub
```

### 接続エラー（公開鍵のアクセス権過剰）
オーナー以外にも見える状態は怒られる。
![alt text](assets/image-4.png)  
[SSH接続時のパーミッションエラー解消方法について](https://qiita.com/mittsukan/items/fa85db0ca125b8ed9ebe)  
![alt text](assets/image-3.png)  

### 接続エラー（ssh configにユーザ設定がなかったから？）
結論から言うと関係なかった。
![alt text](assets/image-5.png)
https://zenn.dev/nikaera/articles/ssh-config-github
![alt text](assets/image-6.png)

### 接続エラー解決（ssh config公開鍵を指定していたら）
![alt text](assets/image-7.png)
![alt text](assets/image-9.png)
![alt text](assets/image-8.png)

### git設定
host/devcontainerで設定を共有しやすいようにlocalに設定。
![alt text](assets/image-10.png)

## push成功
上記設定でGitHubにpush成功した。
![alt text](assets/image-11.png)
![alt text](assets/image-12.png)

