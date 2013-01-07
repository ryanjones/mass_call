class MassCall.RecordingsController extends Batman.Controller
  routingKey: 'recordings'

  index: (params) ->
    MassCall.Recording.load (err,results) =>
      @set 'recordings', new Batman.Set(results...)