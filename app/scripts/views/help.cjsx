define [
  'assets/scripts/namespace.js'
  'react.js'
], (zt, React) ->

  HelpView = React.createClass
    getInitialState: ->
      is_open: if @props.initiallyOpen? then @props.initiallyOpen or false

    doAction: ->
      @setState is_open: !@state.is_open
      
    render: ->
      overlay_active_class = if @state.is_open then "active" else "inactive"
      <div className="help-view" onClick={@doAction}>
        <div className="action-target help-toggle fa fa-question" />
        <div className="help-overlay #{overlay_active_class}">
          <ol className="help-items #{overlay_active_class}">
            <li className="help-item">Choose doors to open and earn money!</li>
            <li className="help-item">Get 3 <span className="fa fa-check"> </span>s to win money and go up a level.</li>
            <li className="help-item">However, if you open 3 <span className="fa fa-times"> </span>s then you lose a life and go down a level.</li>
            <li className="help-item">Spend your winnings to Reset the level if you think you might open that third <span className="strike" />!</li>
          </ol>
        </div>
      </div>