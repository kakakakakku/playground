var api = require('marvel-api');

var marvel = api.createClient({
    publicKey: '',
    privateKey: ''
});

// creators

marvel.creators.findByName('austin')
  .then(console.log)
  .fail(console.error.stack)
  .done();

marvel.creators.findByName('Goran', 'Sudzuka')
  .then(console.log)
  .fail(console.error.stack)
  .done();

marvel.creators.findByName('Pat', 'Lee', '(X-Men/FF)')
  .then(console.log)
  .fail(console.error.stack)
  .done();
