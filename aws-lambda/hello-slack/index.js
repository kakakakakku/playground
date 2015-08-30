exports.handler = function(event, context) {
    var exec = require('child_process').exec;
    var hookUrl = 'https://hooks.slack.com/services/xxx/xxx'
    var cmd = 'curl -X POST --data-urlencode \'payload={"text": "Hello Slack from AWS Lambda"}\' ' + hookUrl
    exec(cmd, function(error, stdout, stderr) {
        context.succeed(stdout);
    });
};
