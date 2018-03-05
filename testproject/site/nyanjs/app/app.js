nyan.app = nyan.define('app', {
  config: {
    files: [
      // Controllers
      '/nyanjs/app/controllers/testController.js',
      // Models

      // Views
          '/nyanjs/app/views/header.html',
          '/nyanjs/app/views/header.js',
          '/nyanjs/app/views/test.html',
          '/nyanjs/app/views/test.js'

          /*'/app/views/home.html',
          '/app/views/home.js',

          '/app/views/footer.html',
          '/app/views/footer.js'*/
    ],

    navigationView: 'header'
  },

  init: function() {
    this.events.attach('load', this.onLoaded);
  },

  onLoaded: function() {
    //nyan.setView('header', 'header');
    // nyan.setView('mainView', 'home');
    // nyan.setView('footer', 'footer');

    nyan.Routing.addRoute('test', 'header');
  }
});
