'use strict'
/* global Elm */ // This will keep your linter happy

// get a reference to the div where we will show our UI
let container = document.getElementById('container')

// start the elm app in the container
// and keep a reference for communicating with the appp
let websterApp = Elm.embed(Elm.Main, container)

websterApp.ports.timeUpdated.subscribe(currentTimeLookup)

function currentTimeLookup(sel) {
  var time = document.getElementById(sel).currentTime;
  console.log(time);
}


var sqlite3 = require('sqlite3').verbose();
var db = new sqlite3.Database('websterdb');

db.serialize(function() {
  // db.run("CREATE TABLE lorem (info TEXT)");
  //
  // var stmt = db.prepare("INSERT INTO lorem VALUES (?)");
  // for (var i = 0; i < 10; i++) {
  //     stmt.run("Ipsum " + i);
  // }
  // stmt.finalize();

  db.each("SELECT rowid AS id, info FROM lorem", function(err, row) {
      console.log(row.id + ": " + row.info);
  });
});

db.close();
