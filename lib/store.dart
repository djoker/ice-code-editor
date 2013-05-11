library ice;

import 'dart:html';
import 'dart:collection';
import 'dart:crypto';
import 'dart:json' as JSON;
import 'package:js/js.dart' as js;

class Store implements HashMap<String, HashMap> {
  const String codeEditor = 'codeeditor';
  List _projects;

  Store() { }

  static String encode(String string) {
    var gzip = js.context.RawDeflate.deflate(string);
    return CryptoUtils.bytesToBase64(gzip.codeUnits);
  }
  static String decode(String string) {
    var bytes = CryptoUtils.base64StringToBytes(string);
    var gzip = new String.fromCharCodes(bytes);
    return js.context.RawDeflate.inflate(gzip);
  }

  int get length => projects.length;

  void operator []=(String key, Object data) {
    data['title'] = key;

    _updateAtIndex(_indexOfKey(key), data);

    _sync();
  }

  int _indexOfKey(String key) => projects.indexOf(this[key]);

  void _updateAtIndex(i, data) {
    if (i == -1) {
      projects.insert(0, data);
    }
    else {
      projects[i] = data;
    }
  }

  HashMap operator [](String key) {
    return projects.
      firstWhere(
        (p) => p['title'] == key,
        orElse: () => null
      );
  }

  List get projects {
    if (_projects != null) return _projects;

    var json = window.localStorage[codeEditor];
    return _projects = (json == null) ? [] : JSON.parse(json);
  }

  void refresh() => _projects = null;


  void _sync() {
    window.localStorage[codeEditor] = JSON.stringify(projects);
  }
}
