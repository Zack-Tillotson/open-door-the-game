define [
  'namespace'
  'react'
  'models/score_state'
  'views/score_state'
  'views/action_options'
  'views/door_list'
  'views/help'
  'views/door_spectrum'
  'views/high_score_data'
  'views/game_over'
  'views/door_list_state'
], (zt, React, ScoreState, ScoreStateView, ActionOptionsView, DoorListView, HelpView, DoorSpectrumView, HighScoreDataView, GameOverView, DoorListStateView) ->

  OpenDoor = React.createClass

    render: ->

      <div className="open-door-the-game odtg">
        <ScoreStateView score={@props.model_state.score} />
        <DoorListStateView doors={@props.model_state.door_list} />
        <ActionOptionsView doAction={@props.event_handler} action_options={@props.model_state.action_options} />
        <DoorListView doAction={@props.event_handler} door_list={@props.model_state.door_list} />
        <DoorSpectrumView />
        <HelpView is_open={@props.help_is_open} doAction={@props.event_handler} />
        <GameOverView
          is_open={@props.game_over_is_open}
          doAction={@props.event_handler}
          high_scores={@props.high_scores}
          score={@props.model_state.score} />
        <HighScoreDataView 
          high_scores={@props.high_scores} 
          is_game_over={@props.model_state.score.is_game_over}
          is_open={@props.high_scores_is_open} 
          doAction={@props.event_handler} />
      </div>