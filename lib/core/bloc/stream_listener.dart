import 'dart:async';
import 'package:flutter/material.dart';

class StreamListener<T> extends StatefulWidget {
  final Stream<T> stream;
  final void Function(T data) onData;
  final Widget child;
  final T? initialData;
  final void Function(dynamic error, StackTrace stackTrace)? onError;
  final void Function()? onDone;
  final bool? cancelOnError;
  const StreamListener({
    Key? key,
    required this.stream,
    required this.onData,
    required this.child,
    this.initialData,
    this.onError,
    this.onDone,
    this.cancelOnError,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StreamListenerState<T> createState() => _StreamListenerState<T>();
}

class _StreamListenerState<T> extends State<StreamListener<T>> {
  Stream<T> get _stream => widget.stream;
  late StreamSubscription<T> _subscription;

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
      widget.onData(widget.initialData as T);
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
