require('./main.css');

var Elm = require('./Main.elm');

var root = document.getElementById('root');

var app = Elm.Main.embed(root);

app.ports.initializeJquery.subscribe(function() {
    $( "#datepicker" )
      .datepicker({
        onSelect: function(selectedDate) {
          app.ports.newDate.send(selectedDate);
        }
      });
});
