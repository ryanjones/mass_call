window.MassCall = class MassCall extends Batman.App
  Batman.ViewStore.prefix = 'assets/views'

  @root 'app#index'
  @resources 'recordings'

  @on 'run', ->
    console?.log "Running ...."

  @on 'ready', ->
    console?.log "MassCall ready for use."

  @flash: Batman()
  @flash.accessor
    get: (key) -> @[key]
    set: (key, value) ->
      @[key] = value
      if value isnt ''
        setTimeout =>
          @set(key, '')
        , 2000
      value

  @flashSuccess: (message) -> @set 'flash.success', message
  @flashError: (message) ->  @set 'flash.error', message