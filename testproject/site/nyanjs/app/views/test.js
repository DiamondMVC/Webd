nyan.define('test', {
  inherit: 'nyan.ViewController',

  model: undefined,

  getTestMessages: function(binder) {
    binder(this.model);
  }
});
