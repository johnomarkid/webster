## webster
Add your favorite movie or video with subtitle file so it can automatically be broken up into clips. 
The clips are then shown to you based on an SRS algorithm. Best used to learn a new language or 
to memorize film lines.

Webster is a desktop app built with the [Elm](http://elm-lang.org/) language and [Electron](http://electron.atom.io/).

## Autobuild with chokidar
Run `npm run watch` to launch Electron in dev mode. Make a change to one of the .elm files in the app/renderer/ folder.
Upon saving the file, chokidar will recompile the elm code to create an elm.js file, and Electron will be reloaded.

