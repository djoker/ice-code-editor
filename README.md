# ICE Code Editor

The Code Editor + Visualization Preview used in the book "[3D Game Programming for Kids](http://gamingjs.com)."

This is an attempt to convert the JavaScript version ([repository](https://github.com/eee-c/code-editor) / [live version](http://gamingjs.com/ice)) to Dart. The JavaScript version is a pain to maintain. I hope to leverage the benefits of Dart (cross-browser support, testing, documentation) by doing this.

![ICE Code Editor Screenshoot](ice_code_editor.png)

## Running the Example App

The example app contained in `example` is a simple Dart web server. From the `example` directory, run the web server with `dart app.dart`, then open `http://localhost:8000` in Dartium. You should see a simple ACE Editor embedded in the page.
