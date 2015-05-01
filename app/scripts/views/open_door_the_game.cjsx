define [
  '/assets/scripts/namespace.js'
  'react.js'
  '/assets/scripts/models/score_state.js'
  '/assets/scripts/views/score_state.js'
  '/assets/scripts/views/action_options.js'
  '/assets/scripts/views/door_list.js'
], (zt, React, ScoreState, ScoreStateView, ActionOptionsView, DoorListView) ->

  OpenDoorTheGame = React.createClass
    getInitialState: ->
      @props.model.getState()

    doAction: (action, value) ->
      switch action
        when 'open_door' then @props.model.chooseOpenDoor(value)
        when 'reset_doors' then @props.model.chooseResetDoors()

      @setState @props.model.getState()
      
    render: ->
      <div className="lets-ladder-game">
        <ScoreStateView score={@state.score} />
        <ActionOptionsView doAction={@doAction} action_options={@state.action_options} />
        <DoorListView doAction={@doAction} door_list={@state.door_list} />
      </div>