var api = require('marvel-api');

var marvel = api.createClient({
    publicKey: '',
    privateKey: ''
});

exports.handler = function(event, context) {
   var characterName = event.split('&')[9].split('=')[1].replace(/marvelbot\+/g,'').replace(/\+/g,' ');
   console.log(characterName);

   marvel.characters.findByName(characterName)
       .then(function(res) {
           image_path = res.data[0].thumbnail.path;
           image_extension = res.data[0].thumbnail.extension;
           image_size = 'standard_amazing'
           return image_path + '/' + image_size + '.' + image_extension;
       })
       .fail(console.error)
       .done(function(val){
           var exec = require('child_process').exec;
           var url = 'https://hooks.slack.com/services/xxx'
           var cmd = 'curl -X POST --data-urlencode \'payload={"text": "' + val + '"}\' ' + url
           exec(cmd, function(error, stdout, stderr) {
               context.succeed(stdout);
           });
           console.log(val);
       });
};
