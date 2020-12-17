import 'dart:async';
import 'package:flutter/material.dart';

class StreamListener<T> extends StatefulWidget {
  final Stream<T> stream;
  final void Function(T data) onData;
  final Widget child;
  final T initialData;
  final void Function(dynamic error, StackTrace stackTrace) onError;
  final void Function() onDone;
  final bool cancelOnError;
  const StreamListener({
    Key key,
    @required this.stream,
    @required this.onData,
    @required this.child,
    this.initialData,
    this.onError,
    this.onDone,
    this.cancelOnError,
  })  : assert(stream != null),
        assert(onData != null),
        assert(child != null),
        super(key: key);
  @override
  _StreamListenerState<T> createState() => _StreamListenerState<T>();
}

class _StreamListenerState<T> extends State<StreamListener<T>> {
  Stream<T> get _stream => widget.stream;
  StreamSubscription<T> _subscription;
  @override
  void initState() {
    super.initState();
    _subscription = _stream.listen(
      widget.onData,
      onError: widget.onError,
      onDone: widget.onDone,
      cancelOnError: widget.cancelOnError,
    );
    if (widget.initialData != null) {
      widget.onData(widget.initialData);
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
