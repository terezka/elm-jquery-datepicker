require('./main.css');

// Get Elm code
var Elm = require('./Main.elm');

// Find mount element
var root = document.getElementById('root');

// Mount Elm app
var app = Elm.Main.embed(root);


// Initilize when Elm is ready
app.ports.initializeJquery.subscribe(function() {
    $("#datepicker").datepicker({
      onSelect: function(selectedDate) {
        // Send date to Elm when new date is picked
        app.ports.newDate.send(selectedDate);
      }
    });
});
