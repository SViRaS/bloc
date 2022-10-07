import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { event_green, event_red }

class ColorBloc {
  Color _color = Colors.green;

  final _inputEventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<Color>();
  Stream<Color> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(ColorEvent event) {
    if (event == ColorEvent.event_red)
      _color = Colors.red;
    else if (event == ColorEvent.event_green)
      _color = Colors.green;
    else
      throw Exception('Wrong, noob');


      _outputStateController.sink.add(_color);
  }

  ColorBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
