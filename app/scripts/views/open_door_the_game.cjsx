define [
  'assets/scripts/namespace.js'
  'react.js'
  'assets/scripts/models/score_state.js'
  'assets/scripts/views/score_state.js'
  'assets/scripts/views/action_options.js'
  'assets/scripts/views/door_list.js'
  'assets/scripts/views/help.js'
  'assets/scripts/views/door_spectrum.js'
], (zt, React, ScoreState, ScoreStateView, ActionOptionsView, DoorListView, HelpView, DoorSpectrumView) ->

  OpenDoorTheGame = React.createClass
    getInitialState: ->
      @props.model.getState() 

    doAction: (action, value) ->

      isDelayed = switch action
        when 'open_door' then @props.model.chooseOpenDoor(value)
        when 'reset_doors' then @props.model.chooseResetDoors()

      @setState @props.model.getState()

      if isDelayed
        @props.model.emitter.once 'ui_event', => 
          @setState @props.model.getState()

    render: ->
      <div className="open-door-the-game odtg">
        <ScoreStateView score={@state.score} />
        <ActionOptionsView doAction={@doAction} action_options={@state.action_options} />
        <DoorListView doAction={@doAction} door_list={@state.door_list} />
        <DoorSpectrumView />
        <HelpView initiallyOpen=true />
      </div>