# **Python local-dev templates for Flask/Django/Jupyter-Notebook**

# Usage
## 1. テンプレートをダウンロード

```bash:Terminal
git clone git@github.com:mintak21/local-py-dev-template.git
```

## 2. プロジェクトを展開

```bash:Terminal
cd local-py-dev-template
# jupyterプロジェクトを作成する場合
make create_jupyter_pj
# flaskプロジェクトを作成する場合
make create_flask_pj
# djangoプロジェクトを作成する場合
make create_django_pj
```

### Available Arguments

|Arg|Outline|Default|Example|
|:----|:------|:------|:--------|
|TARGET_DIR|展開先ディレクトリ(存在しない場合は作成)|~/workspace/project|myflask_dir
|DJANGO_PJ_NAME|djangoの場合に指定可能。Djangoテンプレートのプロジェクト名|mysite|my_pj

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
make setup_vscode
code
```

# Start Development
どのプロジェクトについても、最初の一歩となるファイルは作成されています。まずはこのファイルに追記、記述変更から始めて見ると良いでしょう。
その後、ファイルやディレクトリを追加したくなると思いますが、その場合は**各アプリケーションディレクトリ内に作成**するようにしてください。(下表参照)

|Project|App Dir Name|
|:-------|:--------
|Flask|app
|Django|django_project
|Jupyter|workdir

# Caution

- テンプレートで用意されているファイル/ディレクトリの名称変更、削除を行うと動作しなくなる場合があります。仕組みが理解できるまでは非推奨です。

# Additional
`.local_deploy`ディレクトリの設定に不満が出て自前で作成できるようになれば、Docker初学者卒業です。
