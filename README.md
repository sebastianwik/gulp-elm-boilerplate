# gulp-elm-boilerplate
A simple boilerplate for Gulp, Elm and Browser-sync

## Get started
Make sure you have Elm installed and that the ```elm``` command works.

In your terminal:
```
git clone https://github.com/sebastianwik/gulp-elm-boilerplate.git project
cd project
npm install && npm start
```

## If you are new to Elm

Check out Elm at [elm-lang.org](http://elm-lang.org/)
and go through the tutorials and what not.

### Entry Point for this boilerplate
You will find the entry point in the index.html file:

```javascript
    var mainElement = document.getElementById('main');
    var elm = Elm.embed(Elm.Main, mainElement);
```

The Elm object comes from the compiled Elm code in ```Main.js```.
On that Elm object you will find a Main module (```Elm.Main```), that comes from the file ```Main.elm``` which is the starting point for your Elm code.
(You can of course change this module name, I just think ```Main.elm``` works well.)