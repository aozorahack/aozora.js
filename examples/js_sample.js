var Client = require('../lib/client').Client;
var client = new Client()

client.persons()
  .then(function(data) {
    console.log(data[0]);
    console.log(data.length);
    return client.persons({name: "谷崎"});
  })
  .then(function(data) {
    console.log(data);
    return client.persons({id: 1383});
  })
  .then(function(data) {
    console.log(data);
    return client.workers();
  })
  .then(function(data) {
    console.log(data[0]);
    console.log(data.length);
    return client.workers({id: 300});
  })
  .then(function(data) {
    return console.log(data);
  })
  .catch(function(err) {
    console.error(err);
  });


