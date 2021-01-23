# 1. Parcel

> 웹팩보다 가볍고 쉽고 빠르다.
> 설정이 필요없는 번들러

[한국어 공식사이트](https://ko.parceljs.org/cli.html)

## 1.1. 설치

`npm install -g parcel-bundler`

## 1.2. 실행 (+ 서버)

`parcel serve xxx.js -d xxx/output`

## 1.3. 실행 (- 서버)

`parcel watch xxx.js -d xxx/output`

## 1.4. 빌드 (+ 미니파이, - 소스맵, - 서버)

`parcel build xxx.js -d xxx/dist --no-source-maps`
