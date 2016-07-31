Client = require('node-rest-client').Client
client = new Client()

AOZORAPI_HOST = "153.127.202.91"
AOZORAPI_HOST = "localhost:5000"

AOZORAPI_URL = "http://#{AOZORAPI_HOST}/api/v0.1"

for method in ["book", "person", "worker"]
  method_s = method + "s"
  client.registerMethod method_s, AOZORAPI_URL + "/#{method_s}", "GET"
  client.registerMethod method+"_byid", AOZORAPI_URL + "/#{method_s}/${id}", "GET"

new Promise (resolve, reject)=>
  client.methods.books (data, response)=>
    if data is null
      reject("books is null")
    else
      resolve data.length
.then (count)->
  console.log count
  new Promise (resolve, reject)=>
    client.methods.persons (data, response)=>
      if data is null
        reject("persons is null")
      else
        resolve data.length
        
.then (count)->
  console.log count
  new Promise (resolve, reject)=>
    client.methods.workers (data, response)=>
      if data is null
        reject("workers is null")
      else
        resolve data.length
        
.then (count)->
  console.log count
  new Promise (resolve, reject)=>
    client.methods.worker_byid
      path:
        id: 925
    , (data, response)=>
      if data is null
        reject "workers 1 item pick"
      else
        resolve data

.then (data)->
  console.log data

.catch (err)->
  console.error err
