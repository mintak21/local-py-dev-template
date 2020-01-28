# **Python local-dev templates for Flask/Django/Jupyter-Notebook**

# Usage
## 1. テンプレートをダウンロード

```bash:Terminal
git clone git@github.com:mintak21/flask-django-dev-template.git
```

## 2. ディレクトリを指定して、プロジェクトを作成

```bash:Terminal
sh scripts/setup.sh ${TARGET_DIR} ${TARGET_PJ}
```

### Arguments

|Arg|Outline|Example|
|:----|:------|:--------|
|TARGET_DIR|展開先ディレクトリ(存在しない場合は作成)|myflask_dir
|TARGET_PJ|展開するテンプレート種別<br>指定可能な値は`flask`, `django`, `jupyter`の3つ|flask

## 3. 展開先ディレクトリにて、コンテナ起動

```bash:Terminal
cd ${TARGET_DIR}
make run
```

## 4. サーバアクセスを確認

http://localhost:8000/

## 5. コンテナ停止(Shutdown)

ターミナルで`Ctrl + C`

## external. コンテナ起動、削除
プロジェクトさえ作成してしまえば、1コマンドで起動可能です。
### コンテナ起動

```bash:Terminal
make run
```

### お掃除(イメージとコンテナの削除)

```bash:Terminal
make cleanup
```

## external2. Visual-Studio-Code導入
Visual-Studio-Codeをインストール、
Pythonによるコーディングが行いやすいような設定まで全自動で行う。
Visual-Studio-Codeによる開発を行う方には推奨。

```bash:Terminal
sh scripts/setup_vscode.sh
code
```

# Start Development
どのプロジェクトについても、最初の一歩となるファイルは作成されています。まずはこのファイルに追記、記述変更から始めて見ると良いでしょう。
その後、ファイルやディレクトリを追加したくなると思いますが、その場合は**各アプリケーションディレクトリ内に作成**するようにしてください。

|プロジェクト|アプリケーションディレクトリ名|
|:-------|:--------
|Flask|app
|Django|自身で指定したもの
|Jupyter|workdir

# Caution

- テンプレートで用意されているファイル/ディレクトリの名称変更、削除を行うと動作しなくなる場合があります。仕組みが理解できるまでは非推奨です。

# Additional
`.local_deploy`ディレクトリの設定に不満が出て自前で作成できるようになれば、Docker初学者卒業です。
