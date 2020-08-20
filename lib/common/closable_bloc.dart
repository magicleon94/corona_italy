import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ClosableBloc<E, S> extends Bloc<E, S> {
  var closed = false;
  ClosableBloc(S initialState) : super(initialState);

  @override
  @mustCallSuper
  Future<void> close() {
    closed = true;
    return super.close();
  }
}
