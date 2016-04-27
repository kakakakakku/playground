require 'zabbixapi'
require 'pry'
require 'pp'

zbx = ZabbixApi.connect(
  url: 'http://example.com/zabbix/api_jsonrpc.php',
  user: 'user',
  password: 'password',
  http_user: 'user',
  http_password: 'password'
)

# Zabbix API Version を取得する
# https://www.zabbix.com/documentation/2.0/manual/appendix/api/apiinfo/version
pp zbx.query(
  method: 'apiinfo.version'
)

# ホスト情報を取得する
# https://www.zabbix.com/documentation/2.0/manual/appendix/api/host/get
pp zbx.query(
  method: 'host.get',
  params: {
    output: [
      'hostid',
      'host'
    ],
    selectInterfaces: [
      'interfaceid',
      'ip'
    ]
  }
)
