require 'qiita'

client = Qiita::Client.new(
  access_token: '',
  team: ''
)

projects = client.list_projects(per_page: 100).body

projects.each do |project|
  puts project['name']
end
