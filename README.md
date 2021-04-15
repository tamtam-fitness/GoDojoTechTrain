# GoDojoTechTrain


Applicationの起動コマンド
```
docker-compose up -d go_api
```

TEST COMMAND
```
# create
 curl -X POST -H "Content-Type: application/json" -d '{"name":"TestUser"}' localhost:8080/user/create
# get
curl -H "X-Auth-Token:<token-key>" http://localhost:8080/user/get
{"name":"TestUser"}%                         

# update



```

### Reference
- [オンライン版　CA Tech Dojo サーバサイド (Go)編](https://techbowl.co.jp/techtrain/missions/12)
- [DeNA Codelabs: テスタビリティの高いGoのAPIサーバを開発しよう（その1 ~準備&E2E実装編~）](https://dena.github.io/codelabs/testable-architecture-with-go-part1/#0)
- [GolangCI-LintとCircleCIを利用して静的解析チェックを自動化する](https://blog.mmmcorp.co.jp/blog/2021/01/10/golangci-lint-circleci/)
- [Github ActionsでGoのCI環境を作成する](https://blog.mmmcorp.co.jp/blog/2021/01/10/golangci-lint-circleci/)