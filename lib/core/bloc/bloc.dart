import 'dart:async';

import 'package:flutter/foundation.dart';

abstract class Bloc<T extends BlocState> {
  T currentState;
  final _stateController = StreamController<T>.broadcast();
  Stream<T> get state => _stateController.stream;

  Bloc({T initialState}) {
    if (initialState != null) {
      currentState = initialState;
    }
  }

  void emit(T state) {
    currentState = state;
    _stateController.add(state);
  }

  void error(Failure error) {
    _stateController.addError(error);
  }

  @mustCallSuper
  void dispose() {
    _stateController.close();
  }
}

abstract class BlocState {}

abstract class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => 'Failure: $message';
}
