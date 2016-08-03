#
# Copyright 2016 Kenichi Sato
# 
Client = require('node-rest-client').Client

AOZORAPI_HOST = process.env.AOZORAPI_HOST or "153.127.202.91"
AOZORAPI_URL = "http://#{AOZORAPI_HOST}/api/v0.1"

class AozoraClient extends Client
  constructor: ->
    super()
    for method in ["books", "persons", "workers"]
      @registerMethod method,  AOZORAPI_URL + "/#{method}", "GET"
      @registerMethod method[...-1] + "_byid",
        AOZORAPI_URL + "/#{method}/${id}", "GET"

  _command: (method_name, args)->
    method = @methods[method_name]
    new Promise (resolve, reject)->
      method args, (data, resp)->
        if data is null
          reject "#{method.toString} is null"
        else
          resolve data

  books: (args)->
    params = {}
    if args
      if args.id
        return @_command "book_byid", {path: {id: args.id}}
      else
        params.parameters = {}
        if args.title
          params.parameters.title = args.title
        if args.author
          params.parameters.author = args.author
        if args.limit
          params.parameters.limit = args.limit
        if args.after
          params.parameters.after = args.after
    @_command "books", params

  persons: (args)->
    params = {}
    if args
      if args.id
        return @_command "person_byid", {path: {id: args.id}}
      else
        params.parameters = {}
        if args.name
          params.parameters.name = args.name
    @_command "persons", params

  workers: (args)->
    params = {}
    if args
      if args.id
        return @_command "worker_byid", {path: {id: args.id}}
      else
        params.parameters = {}
        if args.name
          params.parameters.name = args.name
    @_command "workers", params

module.exports.Client = AozoraClient
