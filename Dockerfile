# python:3.8をベースとします
FROM python:3.8

# 作業ディレクトリの作成
RUN mkdir /code

# 作業ディレクトリの設定
WORKDIR /code

# カレントディレクトリにある資産をコンテナ上の指定のディレクトリにコピーする
ADD . /code

# pipでrequirements.txtに指定されているパッケージを追加する
RUN pip install -r requirements.txt

# ローカルサーバーでの起動
CMD python3 manage.py runserver 0.0.0.0:8002