nyan.app = nyan.define('app', {
  config: {
    files: [
      // Controllers
      // Models

      // Views
        // Templates
        // View Controllers
    ]
  },

  init: function() {
    this.events.attach('load', this.onLoad);
  },

  onLoad: function() {
    nyan.setView();
  }
});
