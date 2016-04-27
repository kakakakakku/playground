#!/bin/sh

# トークンを取得する
TOKEN=$(
  curl -s -H 'Content-Type:application/json-rpc' \
    --user user:password http://example.com/zabbix/api_jsonrpc.php \
    -d '
      {
          "jsonrpc": "2.0",
          "method": "user.login",
          "params": {
              "user": "user",
              "password": "password"
          },
          "id": 1
      }
    ' | jq -r '.result'
)

PARAMS=$(cat << EOS
    {
        "jsonrpc": "2.0",
        "method": "apiinfo.version",
        "id": 2,
        "auth": "${TOKEN}"
    }
EOS
)

# Zabbix API Version を取得する
# https://www.zabbix.com/documentation/2.0/manual/appendix/api/apiinfo/version
curl -s -H 'Content-Type:application/json-rpc' \
  --user user:password http://example.com/zabbix/api_jsonrpc.php \
  -d "${PARAMS}" | jq .

PARAMS=$(cat << EOS
    {
        "jsonrpc": "2.0",
        "method": "host.get",
        "params": {
            "output": [
                "hostid",
                "host"
            ],
            "selectInterfaces": [
                "interfaceid",
                "ip"
            ]
        },
        "id": 2,
        "auth": "${TOKEN}"
    }
EOS
)

# ホスト情報を取得する
# https://www.zabbix.com/documentation/2.0/manual/appendix/api/host/get
curl -s -H 'Content-Type:application/json-rpc' \
  --user user:password http://example.com/zabbix/api_jsonrpc.php \
  -d "${PARAMS}" | jq .
