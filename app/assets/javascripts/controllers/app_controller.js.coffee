class MassCall.AppController extends Batman.Controller
  routingKey: 'app'

  index: (params) ->
    MassCall.Recording.load (err,results) =>
      @set 'recordings', new Batman.Set(results...)