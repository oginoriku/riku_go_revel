FROM golang:1.17.5-alpine AS build

#$GOPATHに/go/srcを追加．この後srcの下にアプリケーションフォルダを作成する為
ENV GOPATH $GOPATH:/go/src

#revel，revel-cli，gorm，go-sql-driverのインストール
#revelにはORMがないので
RUN go get github.com/revel/revel && \
    go get github.com/revel/cmd/revel && \
    go get github.com/jinzhu/gorm && \
    go get github.com/go-sql-driver/mysql

#アプリケーション(myapp)をマウントするためのディレクトリを作成
RUN mkdir /go/src/myapp

WORKDIR /go/src/myapp

#COPY myapp/go.mod myapp/go.sum ./
#COPY myapp/ ./
#RUN go mod download

#revelはポート9000で実行されるのでポート9000の開放
EXPOSE 9000
