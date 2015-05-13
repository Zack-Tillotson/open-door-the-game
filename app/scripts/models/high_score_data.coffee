define ['namespace', 'libs/eventemitter2', 'firebase'], (zt, EventEmitter2, Firebase2_4) ->
  
  class zt.HighScoreData
    @max_scores = 5
    @recent_time = 1000 * 60 * 60 # 1 hour

    constructor: (options) ->

      @emitter = new EventEmitter2()

      @fb = new Firebase("https://blistering-inferno-4564.firebaseio.com/v1_1/scores");
      if not @fb.getAuth()
        @fb.authAnonymously (error, authData) ->
          if (error)
            console.log("Login Failed!", error)
          else
            console.log("Authenticated successfully with payload:", authData);

      @fb.on 'value', (data) =>
        @global_scores = (item for key, item of _.clone(data.val()))
          .sort (a, b) -> b.score - a.score
          .splice(0, HighScoreData.max_scores)

        @local_scores = (item for key, item of _.clone(data.val()) when item.who is @fb.getAuth()?.auth.uid)
          .sort (a, b) -> b.score - a.score
          .splice(0, HighScoreData.max_scores)

        @recent_scores = (item for key, item of _.clone(data.val()) when item.date > new Date().getTime() - HighScoreData.recent_time)
          .sort (a, b) -> b.score - a.score
          .splice(0, HighScoreData.max_scores)

        @emitter.emit 'state_change'

    getState: ->
      global_scores: @global_scores
      local_scores: @local_scores
      recent_scores: @recent_scores

    saveGameInformation: (data) =>
      @fb.push().set
        who: @fb.getAuth().auth.uid
        date: new Date().getTime()
        score: data.score.money
        level: data.score.level