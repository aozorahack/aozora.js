Client = require('../src/client').Client
client = new Client()

client.books()
.then (data)->
  console.log data[0]
  console.log data.length
  client.books {id: 300}
.then (data)->
  console.log data
  client.books {author: "太宰"}
.then (data)->
  console.log data[0]
  console.log data.length
  client.books {title: "人間"}
.then (data)->
  console.log data[0]
  console.log data.length
  client.books {limit: 30}
.then (data)->
  console.log data[0]
  console.log data.length
.catch (err)->
  console.error err
