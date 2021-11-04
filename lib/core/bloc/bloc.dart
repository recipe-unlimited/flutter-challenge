import 'dart:async';

import 'package:flutter/foundation.dart';

abstract class Bloc<T extends BlocState> {
  T currentState;
  final _stateController = StreamController<T>.broadcast();
  Stream<T> get state => _stateController.stream;

  Bloc({required T initialState}) : currentState = initialState;

  void emit(T state) {
    if (state != currentState) {
      currentState = state;
      _stateController.add(state);
    }
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
  final Object? error;
  final StackTrace? stackTrace;

  Failure(this.error, this.stackTrace);

  @override
  String toString() {
    debugPrint(error?.toString());
    debugPrintStack(stackTrace: stackTrace);
    return 'Failure: $error';
  }
}
