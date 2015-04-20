// Generated by CoffeeScript 1.9.2
require(['public/assets/scripts/main', 'public/assets/scripts/models/score_state'], function() {
  return describe("zt.ScoreState", function() {
    return describe("in a standard initial state", function() {
      ({
        beforeEach: function() {
          return this.state = new zt.ScoreState();
        }
      });
      return it("has correct starting attributes", function() {
        console.log(this, this.state, zt.ScoreState);
        expect(this.state.level).toBe(1);
        expect(this.state.money).toBe(0);
        return expect(this.state.strikes).toBe(0);
      });
    });
  });
});
