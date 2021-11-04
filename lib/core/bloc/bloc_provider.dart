import 'package:flutter/widgets.dart';
import 'package:recipe_challenge/core/bloc/bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  BlocProvider({Key? key, required this.child, required this.bloc})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BlocProviderState();

  static T of<T extends Bloc>(BuildContext context) {
    final provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    assert(provider != null);
    return provider!.bloc;
  }
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
