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
