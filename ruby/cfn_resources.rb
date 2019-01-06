require 'mechanize'

agent = Mechanize.new
resources = agent.get('https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html').search('.highlights ul li')

p '------------------------------'
p 'Resources : ' + resources.size.to_s
p '------------------------------'

resources.each do |resource|
  p resource.search('a').text
end
