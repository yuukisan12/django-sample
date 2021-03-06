# python:3.8をベースとします
FROM python:3.8

# 作業ディレクトリの作成
RUN mkdir /code

# 作業ディレクトリの設定
WORKDIR /code

# カレントディレクトリにある資産をコンテナ上の指定のディレクトリにコピーする
ADD . /code

RUN chgrp -R 0 /code && \
    chmod -R g=u /code

# pipでrequirements.txtに指定されているパッケージを追加する
RUN pip install -r requirements.txt

USER 1001
EXPOSE 8080

# ローカルサーバーでの起動
CMD python3 manage.py runserver 0.0.0.0:8080

