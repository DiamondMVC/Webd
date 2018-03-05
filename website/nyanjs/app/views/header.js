nyan.define('header', {
  inherit: 'nyan.ViewController',

  getMenu: function(binder) {
    binder([{
      text: 'Home',
      link:'/'
    }, {
      text: 'About',
      link:'/about'
    }, {
      text: 'Docs',
      link:'/docs'
    }, {
      text: 'Tutorials',
      link:'/tutorials'
    }]);
  }
});

/*
nyan.viewControllers.header = {
  init: function() {},


};*/
