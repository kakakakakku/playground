exports.handler = function(event, context) {
    message = event.split('&')[9].split('=')[1];
    returnMessage = message.replace(/parrotbot\+/g,'');

    var exec = require('child_process').exec;
    var hookUrl = 'https://hooks.slack.com/services/xxx'
    var cmd = 'curl -X POST --data-urlencode \'payload={"text": "' + returnMessage + '"}\' ' + hookUrl
    exec(cmd, function(error, stdout, stderr) {
        context.succeed(stdout);
    });
};
