async = require 'async'
queries = require '../../queries'

module.exports = (app) ->
  app.get '/', (req, res, next) ->
    async.parallel [
      (cb) ->
        queries.squares cb
      , (cb) ->
        queries.all_settlements cb
    ], (err, [square_count, settlements]) ->
      return next(err) if err?
      active_settlements = settlements.filter (s) ->
        not s.destroyed?
      res.render 'home',
        message: req.param('msg')
        square_count: square_count
        settlement_count: active_settlements.length
        settlements: active_settlements
        server_time: new Date()
