Client = require('../src/client').Client
client = new Client()

d = new Date()
d.setDate(d.getDate()-1)
yesterday = d.toISOString()[..9]
client.books {after: yesterday}
.then (data)->
  console.log data
.catch (err)->
  console.error err
